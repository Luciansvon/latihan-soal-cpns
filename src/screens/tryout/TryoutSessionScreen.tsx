import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
  Modal,
  Pressable,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';
import { useStore } from '../../store';
import { useTryoutSession } from '../../hooks/useTryoutSession';
import { CountdownTimer } from '../../components/tryout/CountdownTimer';
import { QuestionCard } from '../../components/question/QuestionCard';
import { OptionButton } from '../../components/question/OptionButton';
import { TKP_BUZZWORDS } from '../../components/question/HighlightedText';

export function TryoutSessionScreen({ route, navigation }: TryoutScreenProps<'TryoutSession'>) {
  const { templateId } = route.params;
  const userId = useStore((s) => s.userId);
  const [gridOpen, setGridOpen] = useState(false);

  const session = useTryoutSession({
    templateId,
    userId,
    onComplete: (sessionId) => navigation.replace('TryoutResult', { sessionId }),
  });

  const accent = Colors.primary;

  // -------------------- States --------------------
  if (session.phase === 'loading') {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={accent} />
          <Text style={styles.loadingText}>Memuat tryout…</Text>
        </View>
      </SafeAreaView>
    );
  }

  if (session.phase === 'error') {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <Ionicons name="alert-circle-outline" size={56} color={Colors.error} />
          <Text style={styles.errorText}>{session.error ?? 'Terjadi kesalahan.'}</Text>
          <TouchableOpacity style={styles.primaryBtn} onPress={() => navigation.goBack()}>
            <Text style={styles.primaryBtnText}>Kembali</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  if (session.phase === 'submitting' || session.phase === 'done') {
    return (
      <SafeAreaView style={styles.safe}>
        <View style={styles.centerBox}>
          <ActivityIndicator size="large" color={accent} />
          <Text style={styles.loadingText}>Menyimpan hasil…</Text>
        </View>
      </SafeAreaView>
    );
  }

  const current = session.currentQuestion;
  const total = session.questions.length;
  const idx = session.currentIndex;
  const selectedHere = current ? session.selectedAnswers[current.id] : undefined;
  const isFlagged = current ? session.flaggedQuestions.has(current.id) : false;
  const isLast = idx === total - 1;
  const progressPct = ((idx + 1) / total) * 100;

  // -------------------- Actions --------------------
  const handleClose = () => {
    Alert.alert(
      'Akhiri tryout?',
      `Kamu sudah menjawab ${session.answeredCount} dari ${total} soal. Hasil yang ada akan disimpan.`,
      [
        { text: 'Lanjut Tryout', style: 'cancel' },
        {
          text: 'Selesaikan',
          style: 'destructive',
          onPress: () => session.finalize(),
        },
      ]
    );
  };

  const handleFinishPress = () => {
    if (session.answeredCount < total) {
      Alert.alert(
        'Selesaikan tryout?',
        `Kamu belum menjawab ${total - session.answeredCount} soal. Selesaikan sekarang?`,
        [
          { text: 'Batal', style: 'cancel' },
          { text: 'Selesai', onPress: () => session.finalize() },
        ]
      );
    } else {
      session.finalize();
    }
  };

  // -------------------- Render --------------------
  return (
    <SafeAreaView style={styles.safe}>
      {/* Header: close, timer, pause-placeholder */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.iconBtn} onPress={handleClose}>
          <Ionicons name="close" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <CountdownTimer secondsLeft={session.secondsLeft} totalSeconds={session.totalSeconds} />
        <TouchableOpacity style={styles.iconBtn} onPress={session.toggleFlag}>
          <Ionicons
            name={isFlagged ? 'flag' : 'flag-outline'}
            size={22}
            color={isFlagged ? Colors.warning : Colors.textSecondary}
          />
        </TouchableOpacity>
      </View>

      {/* Progress + answered count */}
      <View style={styles.progressContainer}>
        <View style={styles.progressTrack}>
          <View style={[styles.progressFill, { width: `${progressPct}%`, backgroundColor: accent }]} />
        </View>
        <Text style={styles.progressLabel}>
          {idx + 1} / {total}
        </Text>
      </View>
      <Text style={styles.subStat}>
        Terjawab: {session.answeredCount} · Ditandai: {session.flaggedQuestions.size}
      </Text>

      {/* Content */}
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {current ? (
          <View style={{ gap: 12 }}>
            <QuestionCard
              question={current}
              questionNumber={idx + 1}
              totalQuestions={total}
              accentColor={accent}
            />
            {current.options.map((opt) => (
              <OptionButton
                key={opt.id}
                optionId={opt.id}
                text={opt.text}
                imageUrl={opt.imageUrl}
                state={selectedHere === opt.id ? 'selected' : 'idle'}
                accentColor={accent}
                onPress={() => session.selectOption(opt.id)}
                highlightKeywords={current.subject === 'TKP' ? TKP_BUZZWORDS : undefined}
              />
            ))}
          </View>
        ) : null}
      </ScrollView>

      {/* Bottom nav */}
      <View style={styles.bottomNav}>
        <TouchableOpacity
          style={[styles.navBtn, idx === 0 && styles.navBtnDisabled]}
          activeOpacity={0.8}
          disabled={idx === 0}
          onPress={session.prev}
        >
          <Ionicons
            name="chevron-back"
            size={20}
            color={idx === 0 ? Colors.gray300 : Colors.textSecondary}
          />
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.gridBtn}
          activeOpacity={0.8}
          onPress={() => setGridOpen(true)}
        >
          <Ionicons name="grid-outline" size={18} color={accent} />
          <Text style={[styles.gridBtnText, { color: accent }]}>Daftar Soal</Text>
        </TouchableOpacity>

        {isLast ? (
          <TouchableOpacity
            style={[styles.primaryBtnRow, { backgroundColor: accent }]}
            activeOpacity={0.85}
            onPress={handleFinishPress}
          >
            <Ionicons name="checkmark" size={20} color={Colors.white} />
            <Text style={styles.primaryBtnText}>Selesai</Text>
          </TouchableOpacity>
        ) : (
          <TouchableOpacity
            style={[styles.primaryBtnRow, { backgroundColor: accent }]}
            activeOpacity={0.85}
            onPress={session.next}
          >
            <Text style={styles.primaryBtnText}>Berikutnya</Text>
            <Ionicons name="chevron-forward" size={20} color={Colors.white} />
          </TouchableOpacity>
        )}
      </View>

      {/* Question grid modal */}
      <Modal
        visible={gridOpen}
        transparent
        animationType="fade"
        onRequestClose={() => setGridOpen(false)}
      >
        <Pressable style={styles.modalBackdrop} onPress={() => setGridOpen(false)}>
          <Pressable style={styles.modalSheet} onPress={(e) => e.stopPropagation()}>
            <Text style={styles.modalTitle}>Daftar Soal</Text>
            <View style={styles.legendRow}>
              <Legend color={Colors.success} label="Terjawab" />
              <Legend color={Colors.warning} label="Ditandai" />
              <Legend color={accent} label="Saat ini" />
              <Legend color={Colors.gray200} label="Belum" />
            </View>
            <ScrollView style={{ maxHeight: 360 }}>
              <View style={styles.grid}>
                {session.questions.map((q, i) => {
                  const answered = !!session.selectedAnswers[q.id];
                  const flagged = session.flaggedQuestions.has(q.id);
                  const isCurrent = i === idx;
                  const bg = isCurrent
                    ? accent
                    : flagged
                    ? Colors.warning
                    : answered
                    ? Colors.success
                    : Colors.gray200;
                  const fg = isCurrent || flagged || answered ? Colors.white : Colors.textPrimary;
                  return (
                    <TouchableOpacity
                      key={q.id}
                      style={[styles.gridCell, { backgroundColor: bg }]}
                      onPress={() => {
                        session.goTo(i);
                        setGridOpen(false);
                      }}
                    >
                      <Text style={[styles.gridCellText, { color: fg }]}>{i + 1}</Text>
                    </TouchableOpacity>
                  );
                })}
              </View>
            </ScrollView>
            <TouchableOpacity
              style={[styles.primaryBtn, { backgroundColor: accent, marginTop: 12 }]}
              onPress={() => setGridOpen(false)}
            >
              <Text style={styles.primaryBtnText}>Tutup</Text>
            </TouchableOpacity>
          </Pressable>
        </Pressable>
      </Modal>
    </SafeAreaView>
  );
}

function Legend({ color, label }: { color: string; label: string }) {
  return (
    <View style={styles.legendItem}>
      <View style={[styles.legendDot, { backgroundColor: color }]} />
      <Text style={styles.legendText}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  centerBox: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    gap: 12,
  },
  loadingText: { fontSize: 14, color: Colors.textSecondary, marginTop: 6 },
  errorText: { fontSize: 14, color: Colors.textSecondary, textAlign: 'center', lineHeight: 20 },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    justifyContent: 'space-between',
  },
  iconBtn: { width: 40, height: 40, justifyContent: 'center', alignItems: 'center' },

  progressContainer: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 4,
    paddingBottom: 8,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  progressTrack: {
    flex: 1,
    height: 6,
    backgroundColor: Colors.gray200,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: { height: '100%', borderRadius: 3 },
  progressLabel: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary, minWidth: 50 },
  subStat: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 10,
    fontSize: 11,
    color: Colors.textMuted,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },

  scroll: { padding: 20, paddingBottom: 32, gap: 12 },

  bottomNav: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    padding: 12,
    gap: 8,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
    alignItems: 'center',
  },
  navBtn: {
    width: 48,
    height: 48,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 12,
    borderWidth: 1.5,
    borderColor: Colors.border,
  },
  navBtnDisabled: { borderColor: Colors.gray200, backgroundColor: Colors.gray50 },
  gridBtn: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    height: 48,
    borderRadius: 12,
    borderWidth: 1.5,
    borderColor: Colors.primary + '50',
    backgroundColor: Colors.primary + '08',
  },
  gridBtnText: { fontSize: 13, fontWeight: '700' },
  primaryBtnRow: {
    flex: 1.5,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    height: 48,
    borderRadius: 12,
  },
  primaryBtn: {
    paddingHorizontal: 24,
    paddingVertical: 14,
    borderRadius: 12,
    alignItems: 'center',
  },
  primaryBtnText: { fontSize: 14, fontWeight: '700', color: Colors.white },

  modalBackdrop: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.45)',
    justifyContent: 'flex-end',
  },
  modalSheet: {
    backgroundColor: Colors.white,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    padding: 20,
    gap: 12,
  },
  modalTitle: { fontSize: 16, fontWeight: '800', color: Colors.textPrimary },

  legendRow: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  legendItem: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  legendDot: { width: 10, height: 10, borderRadius: 5 },
  legendText: { fontSize: 11, color: Colors.textSecondary },

  grid: { flexDirection: 'row', flexWrap: 'wrap', gap: 8, paddingTop: 4 },
  gridCell: {
    width: 38,
    height: 38,
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  gridCellText: { fontSize: 12, fontWeight: '700' },
});
