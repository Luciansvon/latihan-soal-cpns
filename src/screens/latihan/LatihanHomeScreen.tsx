import React, { useState } from 'react';
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
import { EXAM_CONFIGS, SUBJECT_LABELS, type ExamType, type SubjectType } from '../../types/exam.types';
import type { LatihanScreenProps } from '../../navigation/types';

const EXAM_TABS: ExamType[] = ['CPNS', 'TNI', 'POLRI'];

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

const SUBJECT_ICONS: Partial<Record<SubjectType, keyof typeof Ionicons.glyphMap>> = {
  TWK: 'flag-outline',
  TIU: 'bulb-outline',
  TKP: 'person-outline',
  MATEMATIKA: 'calculator-outline',
  BAHASA_INDONESIA: 'book-outline',
  PENGETAHUAN_UMUM: 'globe-outline',
  PSIKOTES: 'brain' as any,
  KEDINASAN: 'shield-outline',
  PENGETAHUAN_HUKUM: 'scale-outline' as any,
};

export function LatihanHomeScreen({ navigation }: LatihanScreenProps<'LatihanHome'>) {
  const [activeExam, setActiveExam] = useState<ExamType>('CPNS');

  const config = EXAM_CONFIGS[activeExam];
  const accentColor = EXAM_COLORS[activeExam];

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Latihan Soal</Text>
        <Text style={styles.headerSubtitle}>Pilih kategori ujian dan mulai berlatih</Text>
      </View>

      {/* Exam Tabs */}
      <View style={styles.tabRow}>
        {EXAM_TABS.map((exam) => {
          const isActive = activeExam === exam;
          return (
            <TouchableOpacity
              key={exam}
              style={[
                styles.tab,
                isActive && { backgroundColor: EXAM_COLORS[exam], borderColor: EXAM_COLORS[exam] },
              ]}
              onPress={() => setActiveExam(exam)}
              activeOpacity={0.8}
            >
              <Text style={[styles.tabText, isActive && styles.tabTextActive]}>
                {EXAM_CONFIGS[exam].label}
              </Text>
            </TouchableOpacity>
          );
        })}
      </View>

      {/* Description */}
      <View style={[styles.descBanner, { backgroundColor: accentColor + '15', borderColor: accentColor + '40' }]}>
        <Ionicons name="information-circle-outline" size={16} color={accentColor} />
        <Text style={[styles.descText, { color: accentColor }]}>{config.description}</Text>
      </View>

      {/* Subject List */}
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <Text style={styles.sectionLabel}>Pilih Mata Pelajaran</Text>
        {config.subjects.map((subject) => {
          const iconName = SUBJECT_ICONS[subject] ?? 'document-text-outline';
          return (
            <TouchableOpacity
              key={subject}
              style={styles.subjectCard}
              activeOpacity={0.8}
              onPress={() =>
                navigation.navigate('CategoryList', { examType: activeExam })
              }
            >
              <View style={[styles.iconBox, { backgroundColor: accentColor + '15' }]}>
                <Ionicons name={iconName} size={22} color={accentColor} />
              </View>
              <View style={styles.subjectInfo}>
                <Text style={styles.subjectCode}>{subject}</Text>
                <Text style={styles.subjectName}>{SUBJECT_LABELS[subject]}</Text>
              </View>
              <Ionicons name="chevron-forward" size={18} color={Colors.gray400} />
            </TouchableOpacity>
          );
        })}

        {/* Quick start all */}
        <TouchableOpacity
          style={[styles.allSubjectsBtn, { borderColor: accentColor }]}
          activeOpacity={0.85}
          onPress={() => navigation.navigate('CategoryList', { examType: activeExam })}
        >
          <Ionicons name="flash-outline" size={18} color={accentColor} />
          <Text style={[styles.allSubjectsBtnText, { color: accentColor }]}>
            Lihat Semua Paket {config.label}
          </Text>
        </TouchableOpacity>
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

  tabRow: {
    flexDirection: 'row',
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingBottom: 16,
    gap: 10,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  tab: {
    flex: 1,
    paddingVertical: 10,
    borderRadius: 10,
    alignItems: 'center',
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
  },
  tabText: { fontSize: 14, fontWeight: '700', color: Colors.textSecondary },
  tabTextActive: { color: Colors.white },

  descBanner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginHorizontal: 20,
    marginTop: 16,
    padding: 12,
    borderRadius: 10,
    borderWidth: 1,
  },
  descText: { fontSize: 13, fontWeight: '500', flex: 1 },

  scroll: { padding: 20, gap: 10, paddingBottom: 40 },
  sectionLabel: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary, marginBottom: 4 },

  subjectCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 4,
    elevation: 1,
  },
  iconBox: {
    width: 46,
    height: 46,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
  },
  subjectInfo: { flex: 1 },
  subjectCode: { fontSize: 12, fontWeight: '700', color: Colors.textSecondary, letterSpacing: 0.5 },
  subjectName: { fontSize: 14, fontWeight: '600', color: Colors.textPrimary, marginTop: 2 },

  allSubjectsBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    marginTop: 8,
    paddingVertical: 14,
    borderRadius: 12,
    borderWidth: 1.5,
    backgroundColor: Colors.white,
  },
  allSubjectsBtnText: { fontSize: 14, fontWeight: '700' },
});
