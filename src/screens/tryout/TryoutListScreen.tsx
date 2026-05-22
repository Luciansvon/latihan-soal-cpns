import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';

interface TryoutTemplate {
  id: string;
  title: string;
  subtitle: string;
  questionCount: number;
  durationMinutes: number;
  color: string;
  icon: keyof typeof Ionicons.glyphMap;
  difficulty: string;
}

const TRYOUT_TEMPLATES: TryoutTemplate[] = [
  {
    id: 'cpns-skd-001',
    title: 'CPNS SKD Paket 1',
    subtitle: 'Seleksi Kompetensi Dasar',
    questionCount: 110,
    durationMinutes: 100,
    color: Colors.cpns,
    icon: 'business-outline',
    difficulty: 'Standar',
  },
  {
    id: 'tni-001',
    title: 'TNI Paket 1',
    subtitle: 'Tes Akademik & Psikotes',
    questionCount: 80,
    durationMinutes: 90,
    color: Colors.tni,
    icon: 'shield-half-outline',
    difficulty: 'Sedang',
  },
  {
    id: 'polri-001',
    title: 'Polri Paket 1',
    subtitle: 'Tes Akademik & Kedinasan',
    questionCount: 90,
    durationMinutes: 90,
    color: Colors.polri,
    icon: 'shield-checkmark-outline',
    difficulty: 'Sedang',
  },
];

export function TryoutListScreen({ navigation }: TryoutScreenProps<'TryoutList'>) {
  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Tryout Resmi</Text>
        <Text style={styles.headerSubtitle}>Simulasi ujian lengkap dengan durasi dan skor resmi</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Info Banner */}
        <View style={styles.infoBanner}>
          <Ionicons name="information-circle-outline" size={18} color={Colors.info} />
          <Text style={styles.infoText}>
            Tryout meniru kondisi ujian sesungguhnya. Pastikan kamu siap sebelum memulai.
          </Text>
        </View>

        <Text style={styles.sectionTitle}>Pilih Paket Tryout</Text>

        {TRYOUT_TEMPLATES.map((template) => (
          <TouchableOpacity
            key={template.id}
            style={[styles.tryoutCard, { borderLeftColor: template.color }]}
            activeOpacity={0.85}
            onPress={() => navigation.navigate('TryoutDetail', { templateId: template.id })}
          >
            {/* Card Header */}
            <View style={styles.cardHeader}>
              <View style={[styles.iconBox, { backgroundColor: template.color + '18' }]}>
                <Ionicons name={template.icon} size={26} color={template.color} />
              </View>
              <View style={styles.cardTitleGroup}>
                <Text style={styles.cardTitle}>{template.title}</Text>
                <Text style={styles.cardSubtitle}>{template.subtitle}</Text>
              </View>
              <View style={[styles.difficultyBadge, { backgroundColor: template.color + '18' }]}>
                <Text style={[styles.difficultyText, { color: template.color }]}>
                  {template.difficulty}
                </Text>
              </View>
            </View>

            {/* Stats Row */}
            <View style={styles.statsRow}>
              <View style={styles.statItem}>
                <Ionicons name="document-text-outline" size={14} color={Colors.textSecondary} />
                <Text style={styles.statText}>{template.questionCount} soal</Text>
              </View>
              <View style={styles.statDot} />
              <View style={styles.statItem}>
                <Ionicons name="time-outline" size={14} color={Colors.textSecondary} />
                <Text style={styles.statText}>{template.durationMinutes} menit</Text>
              </View>
            </View>

            <View style={styles.cardFooter}>
              <Text style={[styles.startText, { color: template.color }]}>Lihat Detail</Text>
              <Ionicons name="chevron-forward" size={16} color={template.color} />
            </View>
          </TouchableOpacity>
        ))}

        {/* Coming Soon */}
        <View style={styles.comingSoonCard}>
          <Ionicons name="hourglass-outline" size={20} color={Colors.textMuted} />
          <Text style={styles.comingSoonText}>Paket tryout baru akan segera hadir</Text>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 16,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  headerTitle: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary, marginTop: 2 },

  scroll: { padding: 20, gap: 14, paddingBottom: 40 },

  infoBanner: {
    flexDirection: 'row',
    gap: 10,
    backgroundColor: '#EFF6FF',
    borderRadius: 12,
    padding: 14,
    borderWidth: 1,
    borderColor: '#BFDBFE',
    alignItems: 'flex-start',
  },
  infoText: { flex: 1, fontSize: 13, color: Colors.info, lineHeight: 20 },

  sectionTitle: { fontSize: 15, fontWeight: '700', color: Colors.textPrimary },

  tryoutCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 14,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.07,
    shadowRadius: 8,
    elevation: 2,
  },
  cardHeader: { flexDirection: 'row', alignItems: 'center', gap: 14 },
  iconBox: {
    width: 50,
    height: 50,
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
  },
  cardTitleGroup: { flex: 1 },
  cardTitle: { fontSize: 16, fontWeight: '800', color: Colors.textPrimary },
  cardSubtitle: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
  difficultyBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
  },
  difficultyText: { fontSize: 11, fontWeight: '700' },

  statsRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    paddingTop: 4,
    borderTopWidth: 1,
    borderTopColor: Colors.gray100,
  },
  statItem: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  statText: { fontSize: 13, color: Colors.textSecondary },
  statDot: {
    width: 3,
    height: 3,
    borderRadius: 1.5,
    backgroundColor: Colors.gray300,
  },

  cardFooter: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    gap: 4,
  },
  startText: { fontSize: 13, fontWeight: '700' },

  comingSoonCard: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 10,
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 18,
    borderWidth: 1,
    borderColor: Colors.border,
    borderStyle: 'dashed',
  },
  comingSoonText: { fontSize: 13, color: Colors.textMuted, fontWeight: '500' },
});
