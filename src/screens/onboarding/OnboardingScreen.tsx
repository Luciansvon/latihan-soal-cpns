import React, { useState } from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, ScrollView,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Colors } from '../../constants/colors';
import { EXAM_CONFIGS } from '../../types/exam.types';
import type { OnboardingScreenProps } from '../../navigation/types';
import type { ExamType } from '../../types/exam.types';
import { supabase } from '../../services/supabase';

const PROVINCES = [
  'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Yogyakarta',
  'Banten', 'Sumatera Utara', 'Sumatera Selatan', 'Sulawesi Selatan',
  'Kalimantan Timur', 'Bali', 'Lainnya',
];

export function OnboardingScreen({ navigation }: OnboardingScreenProps<'Onboarding'>) {
  const [selectedExam, setSelectedExam] = useState<ExamType>('CPNS');
  const [selectedProvince, setSelectedProvince] = useState('');
  const [loading, setLoading] = useState(false);

  const exams = Object.values(EXAM_CONFIGS);

  async function handleNext() {
    setLoading(true);
    // Update profile with target exam and province
    const { data: { user } } = await supabase.auth.getUser();
    if (user) {
      await supabase
        .from('profiles')
        .update({ target_exam: selectedExam, province: selectedProvince || null })
        .eq('id', user.id);
    }
    setLoading(false);
    navigation.navigate('LearningStyleQuiz');
  }

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Progress */}
        <View style={styles.progress}>
          <View style={[styles.dot, styles.dotActive]} />
          <View style={styles.line} />
          <View style={styles.dot} />
          <View style={styles.line} />
          <View style={styles.dot} />
        </View>

        <Text style={styles.step}>Langkah 1 dari 3</Text>
        <Text style={styles.title}>Ujian apa yang kamu persiapkan?</Text>
        <Text style={styles.subtitle}>Kami akan menyesuaikan materi dan soal untukmu</Text>

        {/* Exam type selector */}
        <View style={styles.examGrid}>
          {exams.map((exam) => (
            <TouchableOpacity
              key={exam.type}
              style={[
                styles.examCard,
                selectedExam === exam.type && { borderColor: exam.color, borderWidth: 2.5 },
              ]}
              onPress={() => setSelectedExam(exam.type)}
              activeOpacity={0.8}
            >
              <View style={[styles.examBadge, { backgroundColor: exam.color }]}>
                <Text style={styles.examBadgeText}>{exam.label}</Text>
              </View>
              <Text style={styles.examDesc}>{exam.description}</Text>
              <View style={styles.examSubjects}>
                {exam.subjects.slice(0, 3).map((s) => (
                  <View key={s} style={styles.subjectPill}>
                    <Text style={styles.subjectPillText}>{s}</Text>
                  </View>
                ))}
              </View>
              {selectedExam === exam.type && (
                <View style={[styles.checkMark, { backgroundColor: exam.color }]}>
                  <Text style={styles.checkMarkText}>âœ“</Text>
                </View>
              )}
            </TouchableOpacity>
          ))}
        </View>

        {/* Province (optional) */}
        <Text style={styles.sectionTitle}>Provinsi (opsional)</Text>
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.provinceRow}>
          {PROVINCES.map((p) => (
            <TouchableOpacity
              key={p}
              style={[styles.provincePill, selectedProvince === p && styles.provincePillActive]}
              onPress={() => setSelectedProvince(p === selectedProvince ? '' : p)}
              activeOpacity={0.7}
            >
              <Text
                style={[styles.provincePillText, selectedProvince === p && styles.provincePillTextActive]}
              >
                {p}
              </Text>
            </TouchableOpacity>
          ))}
        </ScrollView>

        <TouchableOpacity
          style={[styles.nextBtn, loading && { opacity: 0.6 }]}
          onPress={handleNext}
          disabled={loading}
          activeOpacity={0.85}
        >
          <Text style={styles.nextBtnText}>{loading ? 'Menyimpan...' : 'Lanjut â†’'}</Text>
        </TouchableOpacity>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgPrimary },
  scroll: { flexGrow: 1, paddingHorizontal: 24, paddingVertical: 20 },
  progress: { flexDirection: 'row', alignItems: 'center', marginBottom: 24 },
  dot: { width: 10, height: 10, borderRadius: 5, backgroundColor: Colors.gray200 },
  dotActive: { backgroundColor: Colors.primary, width: 24, borderRadius: 5 },
  line: { flex: 1, height: 2, backgroundColor: Colors.gray200, marginHorizontal: 4 },
  step: { fontSize: 12, color: Colors.textMuted, fontWeight: '600', textTransform: 'uppercase', letterSpacing: 1 },
  title: { fontSize: 24, fontWeight: '800', color: Colors.textPrimary, marginTop: 8, letterSpacing: -0.3 },
  subtitle: { fontSize: 14, color: Colors.textSecondary, marginTop: 6, marginBottom: 24 },
  examGrid: { gap: 12, marginBottom: 28 },
  examCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 16,
    borderWidth: 1.5,
    borderColor: Colors.border,
    position: 'relative',
  },
  examBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 20,
    marginBottom: 8,
  },
  examBadgeText: { color: Colors.white, fontWeight: '700', fontSize: 13 },
  examDesc: { fontSize: 14, color: Colors.textSecondary, marginBottom: 10 },
  examSubjects: { flexDirection: 'row', gap: 6, flexWrap: 'wrap' },
  subjectPill: { backgroundColor: Colors.gray100, paddingHorizontal: 10, paddingVertical: 3, borderRadius: 20 },
  subjectPillText: { fontSize: 11, color: Colors.textSecondary, fontWeight: '600' },
  checkMark: { position: 'absolute', top: 12, right: 12, width: 24, height: 24, borderRadius: 12, justifyContent: 'center', alignItems: 'center' },
  checkMarkText: { color: Colors.white, fontWeight: '700', fontSize: 12 },
  sectionTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary, marginBottom: 10 },
  provinceRow: { marginBottom: 28, marginHorizontal: -24, paddingHorizontal: 24 },
  provincePill: { paddingHorizontal: 14, paddingVertical: 8, borderRadius: 20, backgroundColor: Colors.gray100, marginRight: 8, borderWidth: 1.5, borderColor: 'transparent' },
  provincePillActive: { borderColor: Colors.primary, backgroundColor: '#FFF0F0' },
  provincePillText: { fontSize: 13, color: Colors.textSecondary, fontWeight: '500' },
  provincePillTextActive: { color: Colors.primary, fontWeight: '700' },
  nextBtn: { backgroundColor: Colors.primary, paddingVertical: 16, borderRadius: 14, alignItems: 'center', marginTop: 8 },
  nextBtnText: { color: Colors.white, fontSize: 16, fontWeight: '700' },
});
