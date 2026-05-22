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
import { EXAM_CONFIGS, SUBJECT_LABELS, type SubjectType } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';

const SUBJECT_COLORS: Partial<Record<SubjectType, string>> = {
  TWK: Colors.twk,
  TIU: Colors.tiu,
  TKP: Colors.tkp,
  MATEMATIKA: Colors.math,
  BAHASA_INDONESIA: Colors.indo,
  PENGETAHUAN_UMUM: Colors.umum,
  PSIKOTES: Colors.levelBadge,
  KEDINASAN: Colors.tni,
  PENGETAHUAN_HUKUM: Colors.hukum,
};

const SUBJECT_ICONS: Partial<Record<SubjectType, keyof typeof Ionicons.glyphMap>> = {
  TWK: 'flag-outline',
  TIU: 'bulb-outline',
  TKP: 'person-outline',
  MATEMATIKA: 'calculator-outline',
  BAHASA_INDONESIA: 'book-outline',
  PENGETAHUAN_UMUM: 'globe-outline',
  PSIKOTES: 'fitness-outline',
  KEDINASAN: 'shield-outline',
  PENGETAHUAN_HUKUM: 'document-text-outline',
};

// Placeholder packs per subject
const PACK_COUNT_PER_SUBJECT = 5;

export function CategoryListScreen({ route, navigation }: LatihanScreenProps<'CategoryList'>) {
  const { examType } = route.params;
  const config = EXAM_CONFIGS[examType];

  const examColorMap: Record<string, string> = {
    CPNS: Colors.cpns,
    TNI: Colors.tni,
    POLRI: Colors.polri,
  };
  const accentColor = examColorMap[examType] ?? Colors.primary;

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backBtn} onPress={() => navigation.goBack()}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerText}>
          <View style={[styles.examBadge, { backgroundColor: accentColor }]}>
            <Text style={styles.examBadgeText}>{config.label}</Text>
          </View>
          <Text style={styles.headerTitle}>Pilih Mata Pelajaran</Text>
          <Text style={styles.headerSubtitle}>{config.description}</Text>
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <Text style={styles.sectionLabel}>{config.subjects.length} mata pelajaran tersedia</Text>

        {config.subjects.map((subject: SubjectType) => {
          const color = SUBJECT_COLORS[subject] ?? accentColor;
          const iconName = SUBJECT_ICONS[subject] ?? 'document-text-outline';
          return (
            <TouchableOpacity
              key={subject}
              style={styles.subjectCard}
              activeOpacity={0.8}
              onPress={() =>
                navigation.navigate('PracticeSession', {
                  examType,
                  subject,
                  packId: 'pack-001',
                })
              }
            >
              <View style={[styles.iconBox, { backgroundColor: color + '18' }]}>
                <Ionicons name={iconName} size={24} color={color} />
              </View>

              <View style={styles.subjectBody}>
                <Text style={styles.subjectName}>{SUBJECT_LABELS[subject]}</Text>
                <Text style={styles.subjectCode}>{subject}</Text>

                {/* Mini pack row */}
                <View style={styles.packRow}>
                  {Array.from({ length: PACK_COUNT_PER_SUBJECT }).map((_, i) => (
                    <View
                      key={i}
                      style={[styles.packDot, { backgroundColor: color + '30', borderColor: color }]}
                    >
                      <Text style={[styles.packDotText, { color }]}>{i + 1}</Text>
                    </View>
                  ))}
                </View>
              </View>

              <View style={styles.subjectRight}>
                <Text style={[styles.packCountText, { color }]}>{PACK_COUNT_PER_SUBJECT}</Text>
                <Text style={styles.packCountLabel}>paket</Text>
                <Ionicons name="chevron-forward" size={16} color={Colors.gray400} style={{ marginTop: 4 }} />
              </View>
            </TouchableOpacity>
          );
        })}

        {/* Info box */}
        <View style={styles.infoBox}>
          <Ionicons name="information-circle-outline" size={16} color={Colors.info} />
          <Text style={styles.infoText}>
            Setiap paket berisi 10–20 soal. Kamu bisa mengulang paket yang sama berkali-kali.
          </Text>
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
    paddingTop: 12,
    paddingBottom: 20,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    gap: 12,
  },
  backBtn: { width: 36, height: 36, justifyContent: 'center' },
  headerText: { gap: 4 },
  examBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
    marginBottom: 4,
  },
  examBadgeText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 1 },
  headerTitle: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  headerSubtitle: { fontSize: 13, color: Colors.textSecondary },

  scroll: { padding: 20, gap: 12, paddingBottom: 40 },
  sectionLabel: { fontSize: 12, fontWeight: '600', color: Colors.textSecondary, letterSpacing: 0.3 },

  subjectCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 5,
    elevation: 1,
  },
  iconBox: {
    width: 50,
    height: 50,
    borderRadius: 14,
    justifyContent: 'center',
    alignItems: 'center',
  },
  subjectBody: { flex: 1, gap: 4 },
  subjectName: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  subjectCode: { fontSize: 11, fontWeight: '600', color: Colors.textSecondary, letterSpacing: 0.5 },
  packRow: { flexDirection: 'row', gap: 4, marginTop: 4 },
  packDot: {
    width: 22,
    height: 22,
    borderRadius: 11,
    borderWidth: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  packDotText: { fontSize: 10, fontWeight: '700' },

  subjectRight: { alignItems: 'center' },
  packCountText: { fontSize: 20, fontWeight: '800' },
  packCountLabel: { fontSize: 10, color: Colors.textMuted },

  infoBox: {
    flexDirection: 'row',
    gap: 8,
    backgroundColor: '#EFF6FF',
    borderRadius: 10,
    padding: 12,
    borderWidth: 1,
    borderColor: '#BFDBFE',
    marginTop: 4,
  },
  infoText: { flex: 1, fontSize: 12, color: Colors.info, lineHeight: 18 },
});
