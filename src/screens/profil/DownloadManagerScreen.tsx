import React, { useCallback, useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  RefreshControl,
  Alert,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { ProfilScreenProps } from '../../navigation/types';
import type { QuestionPack } from '../../types/question.types';
import type { ExamType } from '../../types/exam.types';
import { SUBJECT_LABELS } from '../../types/exam.types';
import { DownloadService } from '../../services/DownloadService';
import { useStore } from '../../store';

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function DownloadManagerScreen({ navigation }: ProfilScreenProps<'DownloadManager'>) {
  const userId = useStore((s) => s.userId);
  const isOnline = useStore((s) => s.isOnline);
  const downloads = useStore((s) => s.downloads);
  const setDownloadStatus = useStore((s) => s.setDownloadStatus);

  const [packs, setPacks] = useState<QuestionPack[]>([]);
  const [downloadedIds, setDownloadedIds] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setError(null);
    try {
      const [available, localIds] = await Promise.all([
        isOnline ? DownloadService.listAvailablePacks() : Promise.resolve<QuestionPack[]>([]),
        DownloadService.listDownloadedPackIds(),
      ]);
      setPacks(available);
      setDownloadedIds(localIds);
    } catch (e: any) {
      setError(`Gagal memuat daftar paket: ${e?.message ?? 'unknown error'}`);
    }
  }, [isOnline]);

  useEffect(() => {
    (async () => {
      setLoading(true);
      await load();
      setLoading(false);
    })();
  }, [load]);

  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    await load();
    setRefreshing(false);
  }, [load]);

  const handleDownload = useCallback(
    async (pack: QuestionPack) => {
      if (!userId) {
        Alert.alert('Login dulu', 'Anda harus login untuk mengunduh paket.');
        return;
      }
      try {
        await DownloadService.downloadPack(pack.id, userId, (info) => {
          setDownloadStatus(info.packId, info.status, info.progress, info.error);
        });
        setDownloadedIds((prev) => new Set(prev).add(pack.id));
      } catch (e: any) {
        Alert.alert('Download gagal', e?.message ?? 'Terjadi kesalahan tak terduga.');
      }
    },
    [userId, setDownloadStatus]
  );

  const handleDelete = useCallback(
    (pack: QuestionPack) => {
      if (!userId) return;
      Alert.alert(
        'Hapus paket?',
        `Hapus "${pack.title}" dari penyimpanan lokal? Anda dapat mengunduhnya kembali kapan saja.`,
        [
          { text: 'Batal', style: 'cancel' },
          {
            text: 'Hapus',
            style: 'destructive',
            onPress: async () => {
              try {
                await DownloadService.deletePack(pack.id, userId);
                setDownloadedIds((prev) => {
                  const next = new Set(prev);
                  next.delete(pack.id);
                  return next;
                });
              } catch (e: any) {
                Alert.alert('Gagal menghapus', e?.message ?? 'Terjadi kesalahan.');
              }
            },
          },
        ]
      );
    },
    [userId]
  );

  // Group packs by exam type
  const grouped = packs.reduce<Record<ExamType, QuestionPack[]>>((acc, p) => {
    if (!acc[p.examType]) acc[p.examType] = [];
    acc[p.examType].push(p);
    return acc;
  }, {} as Record<ExamType, QuestionPack[]>);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.goBack()} style={styles.backBtn}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <Text style={styles.title}>Download Soal Offline</Text>
        <View style={{ width: 40 }} />
      </View>

      <ScrollView
        contentContainerStyle={styles.scroll}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
        showsVerticalScrollIndicator={false}
      >
        {!isOnline ? (
          <View style={styles.offlineBanner}>
            <Ionicons name="cloud-offline-outline" size={18} color={Colors.warning} />
            <Text style={styles.offlineText}>
              Mode offline. Hanya paket yang sudah terunduh yang ditampilkan.
            </Text>
          </View>
        ) : null}

        {loading ? (
          <View style={styles.center}>
            <ActivityIndicator size="large" color={Colors.primary} />
            <Text style={styles.loadingText}>Memuat daftar paket…</Text>
          </View>
        ) : error ? (
          <View style={styles.center}>
            <Ionicons name="alert-circle-outline" size={48} color={Colors.error} />
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity style={styles.retryBtn} onPress={onRefresh}>
              <Text style={styles.retryBtnText}>Coba lagi</Text>
            </TouchableOpacity>
          </View>
        ) : packs.length === 0 && downloadedIds.size === 0 ? (
          <View style={styles.empty}>
            <Text style={styles.emptyIcon}>📦</Text>
            <Text style={styles.emptyTitle}>Belum ada paket tersedia</Text>
            <Text style={styles.emptyDesc}>
              Admin belum mempublish paket soal. Coba refresh atau kembali nanti.
            </Text>
          </View>
        ) : (
          (Object.keys(grouped) as ExamType[]).map((exam) => (
            <View key={exam} style={styles.groupSection}>
              <View style={styles.groupHeader}>
                <View style={[styles.groupBadge, { backgroundColor: EXAM_COLORS[exam] }]}>
                  <Text style={styles.groupBadgeText}>{exam}</Text>
                </View>
                <Text style={styles.groupCount}>{grouped[exam].length} paket</Text>
              </View>

              {grouped[exam].map((pack) => {
                const isDownloaded = downloadedIds.has(pack.id);
                const dl = downloads[pack.id];
                const isDownloading = dl?.status === 'DOWNLOADING' || dl?.status === 'PENDING';
                const color = EXAM_COLORS[pack.examType] ?? Colors.primary;

                return (
                  <View key={pack.id} style={[styles.packCard, { borderLeftColor: color }]}>
                    <View style={styles.packMain}>
                      <Text style={styles.packTitle}>{pack.title}</Text>
                      <Text style={styles.packSubtitle}>
                        {SUBJECT_LABELS[pack.subject] ?? pack.subject} · {pack.questionCount} soal
                        {pack.fileSizeKb ? ` · ${formatKb(pack.fileSizeKb)}` : ''}
                      </Text>
                      {pack.description ? (
                        <Text style={styles.packDesc} numberOfLines={2}>
                          {pack.description}
                        </Text>
                      ) : null}

                      {isDownloading ? (
                        <View style={styles.progressWrap}>
                          <View style={styles.progressTrack}>
                            <View
                              style={[
                                styles.progressFill,
                                { width: `${Math.round((dl?.progress ?? 0) * 100)}%`, backgroundColor: color },
                              ]}
                            />
                          </View>
                          <Text style={styles.progressText}>
                            {Math.round((dl?.progress ?? 0) * 100)}%
                          </Text>
                        </View>
                      ) : null}

                      {dl?.status === 'FAILED' ? (
                        <Text style={styles.failText}>Gagal: {dl.error ?? 'unknown'}</Text>
                      ) : null}
                    </View>

                    <View style={styles.packActions}>
                      {isDownloaded ? (
                        <>
                          <View style={styles.doneBadge}>
                            <Ionicons name="checkmark-circle" size={14} color={Colors.success} />
                            <Text style={styles.doneBadgeText}>Tersimpan</Text>
                          </View>
                          <TouchableOpacity
                            style={styles.deleteBtn}
                            onPress={() => handleDelete(pack)}
                          >
                            <Ionicons name="trash-outline" size={18} color={Colors.error} />
                          </TouchableOpacity>
                        </>
                      ) : isDownloading ? (
                        <ActivityIndicator color={color} />
                      ) : (
                        <TouchableOpacity
                          style={[styles.downloadBtn, { backgroundColor: color }]}
                          activeOpacity={0.85}
                          onPress={() => handleDownload(pack)}
                          disabled={!isOnline}
                        >
                          <Ionicons name="download-outline" size={16} color={Colors.white} />
                          <Text style={styles.downloadBtnText}>Unduh</Text>
                        </TouchableOpacity>
                      )}
                    </View>
                  </View>
                );
              })}
            </View>
          ))
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

function formatKb(kb: number): string {
  if (kb < 1024) return `${kb} KB`;
  return `${(kb / 1024).toFixed(1)} MB`;
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    backgroundColor: Colors.white,
  },
  backBtn: { width: 40, height: 40, justifyContent: 'center' },
  title: { flex: 1, fontSize: 17, fontWeight: '700', color: Colors.textPrimary, textAlign: 'center' },

  scroll: { padding: 16, gap: 16, paddingBottom: 40 },

  offlineBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#FFFBEB',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  offlineText: { flex: 1, fontSize: 12, color: Colors.warning, fontWeight: '500' },

  center: { alignItems: 'center', gap: 12, paddingVertical: 48 },
  loadingText: { fontSize: 13, color: Colors.textSecondary },
  errorText: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20, paddingHorizontal: 24 },
  retryBtn: { backgroundColor: Colors.primary, paddingHorizontal: 20, paddingVertical: 10, borderRadius: 10 },
  retryBtnText: { fontSize: 13, fontWeight: '700', color: Colors.white },

  empty: { alignItems: 'center', gap: 8, paddingVertical: 48 },
  emptyIcon: { fontSize: 56 },
  emptyTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary, marginTop: 8 },
  emptyDesc: {
    fontSize: 13,
    color: Colors.textSecondary,
    textAlign: 'center',
    paddingHorizontal: 24,
    lineHeight: 20,
  },

  groupSection: { gap: 10 },
  groupHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 4,
  },
  groupBadge: { paddingHorizontal: 10, paddingVertical: 4, borderRadius: 6 },
  groupBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  groupCount: { fontSize: 11, color: Colors.textSecondary, fontWeight: '600' },

  packCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    flexDirection: 'row',
    gap: 12,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  packMain: { flex: 1, gap: 4 },
  packTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  packSubtitle: { fontSize: 12, color: Colors.textSecondary },
  packDesc: { fontSize: 12, color: Colors.textMuted, lineHeight: 18 },

  progressWrap: {
    marginTop: 6,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  progressTrack: {
    flex: 1,
    height: 6,
    backgroundColor: Colors.gray100,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: { height: '100%', borderRadius: 3 },
  progressText: { fontSize: 11, fontWeight: '600', color: Colors.textSecondary, minWidth: 36 },

  failText: { fontSize: 11, color: Colors.error, marginTop: 4 },

  packActions: { alignItems: 'flex-end', justifyContent: 'space-between', gap: 8 },
  downloadBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 8,
  },
  downloadBtnText: { fontSize: 12, fontWeight: '700', color: Colors.white },
  doneBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    backgroundColor: Colors.success + '15',
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 6,
  },
  doneBadgeText: { fontSize: 11, fontWeight: '700', color: Colors.success },
  deleteBtn: { padding: 6 },
});
