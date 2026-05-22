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

interface TemplateInfo {
  title: string;
  subtitle: string;
  color: string;
  questionCount: number;
  durationMinutes: number;
  sections: Array<{ name: string; count: number; passing: number }>;
  description: string;
}

const TEMPLATE_MAP: Record<string, TemplateInfo> = {
  'cpns-skd-001': {
    title: 'CPNS SKD Paket 1',
    subtitle: 'Seleksi Kompetensi Dasar',
    color: Colors.cpns,
    questionCount: 110,
    durationMinutes: 100,
    sections: [
      { name: 'Tes Wawasan Kebangsaan (TWK)', count: 30, passing: 65 },
      { name: 'Tes Intelegensia Umum (TIU)', count: 35, passing: 80 },
      { name: 'Tes Karakteristik Pribadi (TKP)', count: 45, passing: 166 },
    ],
    description:
      'Paket tryout CPNS SKD ini disusun sesuai dengan standar Badan Kepegawaian Negara (BKN) dengan distribusi soal dan waktu yang sama dengan ujian sesungguhnya.',
  },
  'tni-001': {
    title: 'TNI Paket 1',
    subtitle: 'Tes Akademik & Psikotes',
    color: Colors.tni,
    questionCount: 80,
    durationMinutes: 90,
    sections: [
      { name: 'Matematika', count: 20, passing: 60 },
      { name: 'Bahasa Indonesia', count: 20, passing: 60 },
      { name: 'Pengetahuan Umum', count: 20, passing: 60 },
      { name: 'Psikotes', count: 20, passing: 70 },
    ],
    description: 'Paket tryout TNI mencakup semua materi tes akademik dan psikotes yang digunakan dalam seleksi Tentara Nasional Indonesia.',
  },
  'polri-001': {
    title: 'Polri Paket 1',
    subtitle: 'Tes Akademik & Kedinasan',
    color: Colors.polri,
    questionCount: 90,
    durationMinutes: 90,
    sections: [
      { name: 'Matematika', count: 20, passing: 60 },
      { name: 'Bahasa Indonesia', count: 20, passing: 60 },
      { name: 'Pengetahuan Umum', count: 20, passing: 60 },
      { name: 'Pengetahuan Hukum', count: 15, passing: 55 },
      { name: 'Psikotes', count: 15, passing: 65 },
    ],
    description: 'Paket tryout Polri mencakup semua materi tes yang digunakan dalam seleksi Kepolisian Republik Indonesia.',
  },
};

const FALLBACK_TEMPLATE: TemplateInfo = {
  title: 'Tryout',
  subtitle: 'Detail',
  color: Colors.primary,
  questionCount: 0,
  durationMinutes: 0,
  sections: [],
  description: 'Detail tryout tidak tersedia.',
};

export function TryoutDetailScreen({ route, navigation }: TryoutScreenProps<'TryoutDetail'>) {
  const { templateId } = route.params;
  const template = TEMPLATE_MAP[templateId] ?? FALLBACK_TEMPLATE;
  const accentColor = template.color;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={[styles.header, { borderBottomColor: accentColor + '30' }]}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerCenter}>
          <View style={[styles.badge, { backgroundColor: accentColor }]}>
            <Text style={styles.badgeText}>{template.subtitle.toUpperCase()}</Text>
          </View>
          <Text style={styles.headerTitle}>{template.title}</Text>
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Stats Cards */}
        <View style={styles.statsRow}>
          <View style={[styles.statCard, { borderTopColor: accentColor }]}>
            <Ionicons name="document-text-outline" size={22} color={accentColor} />
            <Text style={styles.statValue}>{template.questionCount}</Text>
            <Text style={styles.statLabel}>Total Soal</Text>
          </View>
          <View style={[styles.statCard, { borderTopColor: accentColor }]}>
            <Ionicons name="time-outline" size={22} color={accentColor} />
            <Text style={styles.statValue}>{template.durationMinutes}</Text>
            <Text style={styles.statLabel}>Menit</Text>
          </View>
          <View style={[styles.statCard, { borderTopColor: accentColor }]}>
            <Ionicons name="layers-outline" size={22} color={accentColor} />
            <Text style={styles.statValue}>{template.sections.length}</Text>
            <Text style={styles.statLabel}>Bagian</Text>
          </View>
        </View>

        {/* Description */}
        <View style={styles.descCard}>
          <Text style={styles.descTitle}>Tentang Tryout Ini</Text>
          <Text style={styles.descText}>{template.description}</Text>
        </View>

        {/* Sections */}
        <View style={styles.sectionsCard}>
          <Text style={styles.sectionsTitle}>Distribusi Soal</Text>
          {template.sections.map((section, index) => (
            <View key={index} style={styles.sectionRow}>
              <View style={[styles.sectionDot, { backgroundColor: accentColor }]} />
              <View style={styles.sectionInfo}>
                <Text style={styles.sectionName}>{section.name}</Text>
                <Text style={styles.sectionMeta}>
                  {section.count} soal · Nilai passing: {section.passing}
                </Text>
              </View>
            </View>
          ))}
        </View>

        {/* Rules */}
        <View style={styles.rulesCard}>
          <View style={styles.rulesHeader}>
            <Ionicons name="alert-circle-outline" size={18} color={Colors.warning} />
            <Text style={styles.rulesTitle}>Perhatian</Text>
          </View>
          <View style={styles.rulesList}>
            {[
              'Tryout tidak dapat dijeda setelah dimulai',
              'Waktu akan berjalan terus menerus',
              'Pastikan koneksi internet stabil',
              'Jawaban otomatis tersimpan',
            ].map((rule, i) => (
              <View key={i} style={styles.ruleItem}>
                <Text style={styles.ruleBullet}>•</Text>
                <Text style={styles.ruleText}>{rule}</Text>
              </View>
            ))}
          </View>
        </View>

      </ScrollView>

      {/* Start Button */}
      <View style={styles.footer}>
        <TouchableOpacity
          style={[styles.startBtn, { backgroundColor: accentColor }]}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('TryoutSession', { templateId })}
        >
          <Ionicons name="play-circle-outline" size={20} color={Colors.white} />
          <Text style={styles.startBtnText}>Mulai Tryout</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingTop: 12,
    paddingBottom: 16,
    borderBottomWidth: 1,
    gap: 10,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center' },
  headerCenter: { gap: 6 },
  badge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  badgeText: { fontSize: 10, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },

  scroll: { padding: 20, gap: 16, paddingBottom: 32 },

  statsRow: { flexDirection: 'row', gap: 12 },
  statCard: {
    flex: 1,
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    alignItems: 'center',
    gap: 6,
    borderTopWidth: 3,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  statValue: { fontSize: 22, fontWeight: '900', color: Colors.textPrimary },
  statLabel: { fontSize: 11, color: Colors.textSecondary, textAlign: 'center' },

  descCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  descTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  descText: { fontSize: 13, color: Colors.textSecondary, lineHeight: 22 },

  sectionsCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  sectionsTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  sectionRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 12 },
  sectionDot: { width: 8, height: 8, borderRadius: 4, marginTop: 5 },
  sectionInfo: { flex: 1 },
  sectionName: { fontSize: 13, fontWeight: '600', color: Colors.textPrimary },
  sectionMeta: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },

  rulesCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 14,
    padding: 16,
    gap: 12,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  rulesHeader: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  rulesTitle: { fontSize: 14, fontWeight: '700', color: Colors.warning },
  rulesList: { gap: 8 },
  ruleItem: { flexDirection: 'row', gap: 8 },
  ruleBullet: { fontSize: 14, color: Colors.warning, lineHeight: 20 },
  ruleText: { flex: 1, fontSize: 13, color: Colors.gray700, lineHeight: 20 },

  footer: {
    backgroundColor: Colors.white,
    padding: 20,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  startBtn: {
    borderRadius: 14,
    paddingVertical: 16,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
  },
  startBtnText: { fontSize: 16, fontWeight: '800', color: Colors.white },
});
