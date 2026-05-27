import React, { useEffect, useState } from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, ScrollView, Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Colors } from '../../constants/colors';
import { summarizeLearningStyle } from '../../utils/LearningStyleEngine';
import type { OnboardingScreenProps } from '../../navigation/types';
import { supabase } from '../../services/supabase';
import { bootstrapProfile } from '../../services/profileBootstrap';
import { getDatabase } from '../../db/database';

const STYLE_COLORS: Record<string, string> = {
  visual: '#7C3AED',
  auditory: '#2563EB',
  reading: '#059669',
  kinesthetic: '#D97706',
  activist: '#DC2626',
  reflector: '#0891B2',
  theorist: '#4F46E5',
  pragmatist: '#B45309',
};

export function HasilAnalisisScreen({ route }: OnboardingScreenProps<'HasilAnalisis'>) {
  const { profile } = route.params;
  const summary = summarizeLearningStyle(profile);
  const [saving, setSaving] = useState(false);
  const [saveError, setSaveError] = useState<string | null>(null);

  useEffect(() => {
    saveProfile();
  }, []);

  async function saveProfile() {
    await getDatabase();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      setSaveError('Sesi tidak ditemukan. Coba login ulang.');
      return;
    }
    const { error } = await supabase
      .from('profiles')
      .update({ learning_style: profile })
      .eq('id', user.id);
    if (error) {
      setSaveError(error.message);
    }
  }

  async function handleFinish() {
    if (saving) return;
    setSaving(true);
    setSaveError(null);

    // Re-bootstrap profile dari Supabase: ambil semua field terbaru (target_exam,
    // province, learning_style) → upsert ke local + set di Zustand store.
    // Setelah ini, RootNavigator gate (learningStyle != null) akan switch ke MainApp.
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      setSaving(false);
      Alert.alert('Sesi tidak ditemukan', 'Coba login ulang.');
      return;
    }

    // Pastikan learning_style sudah tersimpan di server (kalau useEffect sebelumnya
    // gagal silent, retry di sini sebelum bootstrap).
    if (saveError) {
      const { error } = await supabase
        .from('profiles')
        .update({ learning_style: profile })
        .eq('id', user.id);
      if (error) {
        setSaving(false);
        Alert.alert('Gagal menyimpan profil', error.message);
        return;
      }
    }

    const result = await bootstrapProfile(user.id);
    setSaving(false);

    if (!result || !result.learningStyle) {
      Alert.alert(
        'Gagal memuat profil',
        'Coba lagi atau cek koneksi internet kamu.'
      );
    }
    // Jika sukses, RootNavigator otomatis switch ke MainApp karena
    // profile.learningStyle di store sekarang terisi.
  }

  // Sort dimensions by score for display
  const dimensions = [
    { key: 'visual', label: 'Visual', score: profile.visual },
    { key: 'auditory', label: 'Auditori', score: profile.auditory },
    { key: 'reading', label: 'Baca/Tulis', score: profile.reading },
    { key: 'kinesthetic', label: 'Kinestetik', score: profile.kinesthetic },
    { key: 'activist', label: 'Aktivis', score: profile.activist },
    { key: 'reflector', label: 'Reflektor', score: profile.reflector },
    { key: 'theorist', label: 'Teoris', score: profile.theorist },
    { key: 'pragmatist', label: 'Pragmatis', score: profile.pragmatist },
  ].sort((a, b) => b.score - a.score);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Header */}
        <View style={styles.header}>
          <Text style={styles.emoji}>🧠</Text>
          <Text style={styles.title}>Hasil Analisis{'\n'}Gaya Belajarmu</Text>
        </View>

        {/* Primary style badge */}
        <View style={[styles.primaryCard, { borderColor: STYLE_COLORS[summary.primaryStyleId] ?? Colors.primary }]}>
          <Text style={styles.primaryLabel}>Gaya Belajar Dominan</Text>
          <Text style={[styles.primaryStyle, { color: STYLE_COLORS[summary.primaryStyleId] ?? Colors.primary }]}>
            {summary.primaryStyle}
            {summary.secondaryStyle ? ` + ${summary.secondaryStyle}` : ''}
          </Text>
          <Text style={styles.primaryDesc}>{summary.description}</Text>
        </View>

        {/* Score bars */}
        <Text style={styles.sectionTitle}>Profil Lengkap</Text>
        <View style={styles.barsContainer}>
          {dimensions.map((dim) => (
            <View key={dim.key} style={styles.barRow}>
              <Text style={styles.barLabel}>{dim.label}</Text>
              <View style={styles.barTrack}>
                <View
                  style={[
                    styles.barFill,
                    {
                      width: `${dim.score}%`,
                      backgroundColor: STYLE_COLORS[dim.key] ?? Colors.primary,
                    },
                  ]}
                />
              </View>
              <Text style={styles.barScore}>{dim.score}</Text>
            </View>
          ))}
        </View>

        {/* Study tips */}
        <Text style={styles.sectionTitle}>Tips Belajar Untukmu</Text>
        <View style={styles.tipsContainer}>
          {summary.studyTips.map((tip, i) => (
            <View key={i} style={styles.tipRow}>
              <Text style={styles.tipBullet}>•</Text>
              <Text style={styles.tipText}>{tip}</Text>
            </View>
          ))}
        </View>

        {/* Exam strategies */}
        <Text style={styles.sectionTitle}>Strategi di Aplikasi Ini</Text>
        <View style={styles.tipsContainer}>
          {summary.examStrategies.map((s, i) => (
            <View key={i} style={styles.tipRow}>
              <Text style={[styles.tipBullet, { color: Colors.primary }]}>→</Text>
              <Text style={styles.tipText}>{s}</Text>
            </View>
          ))}
        </View>

        {/* Science note */}
        <View style={styles.scienceNote}>
          <Text style={styles.scienceNoteText}>
            📚 Analisis ini berdasarkan VARK Model (Fleming & Mills, 1992) dan Honey & Mumford Learning Styles (1982), dua kerangka gaya belajar yang banyak digunakan dalam penelitian pendidikan.
          </Text>
        </View>

        {/* CTA */}
        <TouchableOpacity
          style={[styles.startBtn, saving && { opacity: 0.6 }]}
          onPress={handleFinish}
          disabled={saving}
          activeOpacity={0.85}
        >
          <Text style={styles.startBtnText}>
            {saving ? 'Menyimpan...' : 'Mulai Belajar Sekarang! 🚀'}
          </Text>
        </TouchableOpacity>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgPrimary },
  scroll: { flexGrow: 1, paddingHorizontal: 24, paddingBottom: 32 },
  header: { alignItems: 'center', paddingVertical: 32 },
  emoji: { fontSize: 56, marginBottom: 12 },
  title: { fontSize: 26, fontWeight: '800', color: Colors.textPrimary, textAlign: 'center', lineHeight: 34, letterSpacing: -0.5 },
  primaryCard: {
    borderRadius: 16,
    borderWidth: 2,
    padding: 20,
    marginBottom: 28,
    backgroundColor: Colors.bgSecondary,
  },
  primaryLabel: { fontSize: 11, fontWeight: '700', color: Colors.textMuted, textTransform: 'uppercase', letterSpacing: 1, marginBottom: 4 },
  primaryStyle: { fontSize: 22, fontWeight: '800', marginBottom: 10 },
  primaryDesc: { fontSize: 14, color: Colors.textSecondary, lineHeight: 21 },
  sectionTitle: { fontSize: 15, fontWeight: '700', color: Colors.textPrimary, marginBottom: 12 },
  barsContainer: { gap: 10, marginBottom: 28 },
  barRow: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  barLabel: { width: 72, fontSize: 12, color: Colors.textSecondary, fontWeight: '500' },
  barTrack: { flex: 1, height: 10, backgroundColor: Colors.gray100, borderRadius: 5, overflow: 'hidden' },
  barFill: { height: '100%', borderRadius: 5 },
  barScore: { width: 28, fontSize: 12, color: Colors.textMuted, fontWeight: '700', textAlign: 'right' },
  tipsContainer: { gap: 8, marginBottom: 28 },
  tipRow: { flexDirection: 'row', gap: 8 },
  tipBullet: { fontSize: 14, color: Colors.textMuted, fontWeight: '700', marginTop: 1 },
  tipText: { flex: 1, fontSize: 14, color: Colors.textSecondary, lineHeight: 20 },
  scienceNote: {
    backgroundColor: Colors.gray50,
    borderRadius: 12,
    padding: 14,
    marginBottom: 28,
    borderWidth: 1,
    borderColor: Colors.border,
  },
  scienceNoteText: { fontSize: 12, color: Colors.textMuted, lineHeight: 18 },
  startBtn: {
    backgroundColor: Colors.primary,
    paddingVertical: 18,
    borderRadius: 16,
    alignItems: 'center',
  },
  startBtnText: { color: Colors.white, fontSize: 17, fontWeight: '800' },
});
