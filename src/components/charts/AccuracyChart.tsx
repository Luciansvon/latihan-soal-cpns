// AccuracyChart — bar horizontal accuracy per subject.
// Implementasi pakai View kustom (bukan react-native-gifted-charts) supaya
// bundle Hermes lebih ringan; UI placeholder, kemungkinan diganti saat
// Claude Design release versi chart final.

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Colors } from '../../constants/colors';
import { SUBJECT_LABELS, type SubjectType } from '../../types/exam.types';

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

export interface AccuracyDatum {
  subject: SubjectType;
  correct: number;
  total: number;
  pct: number;
}

interface Props {
  data: AccuracyDatum[];
  emptyMessage?: string;
}

export function AccuracyChart({ data, emptyMessage }: Props) {
  if (data.length === 0) {
    return (
      <View style={styles.empty}>
        <Text style={styles.emptyText}>
          {emptyMessage ?? 'Belum ada data — selesaikan sesi latihan dulu.'}
        </Text>
      </View>
    );
  }

  return (
    <View style={styles.wrap}>
      {data.map((d) => {
        const color = SUBJECT_COLORS[d.subject] ?? Colors.primary;
        return (
          <View key={d.subject} style={styles.row}>
            <View style={styles.labelGroup}>
              <View style={[styles.dot, { backgroundColor: color }]} />
              <Text style={styles.subject}>{d.subject}</Text>
            </View>
            <View style={styles.barTrack}>
              <View
                style={[
                  styles.barFill,
                  { width: `${Math.min(100, d.pct)}%`, backgroundColor: color },
                ]}
              />
            </View>
            <Text style={styles.pct}>{d.pct}%</Text>
            <Text style={styles.detail}>
              {d.correct}/{d.total}
            </Text>
          </View>
        );
      })}
      <Text style={styles.legend}>
        Akurasi = jumlah jawaban benar / total jawaban per mata pelajaran.
      </Text>
    </View>
  );
}

// Tooltip helper untuk dipakai di tempat lain
export function getSubjectColor(s: SubjectType): string {
  return SUBJECT_COLORS[s] ?? Colors.primary;
}

export function getSubjectLabel(s: SubjectType): string {
  return SUBJECT_LABELS[s] ?? String(s);
}

const styles = StyleSheet.create({
  wrap: { gap: 12 },
  row: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  labelGroup: { flexDirection: 'row', alignItems: 'center', gap: 6, width: 70 },
  dot: { width: 8, height: 8, borderRadius: 4 },
  subject: { fontSize: 12, fontWeight: '700', color: Colors.textSecondary },
  barTrack: {
    flex: 1,
    height: 10,
    backgroundColor: Colors.gray100,
    borderRadius: 5,
    overflow: 'hidden',
  },
  barFill: { height: '100%', borderRadius: 5 },
  pct: { fontSize: 12, fontWeight: '700', color: Colors.textPrimary, width: 34, textAlign: 'right' },
  detail: { fontSize: 10, color: Colors.textMuted, width: 42, textAlign: 'right' },
  empty: { paddingVertical: 24, alignItems: 'center' },
  emptyText: { fontSize: 12, color: Colors.textMuted, textAlign: 'center', paddingHorizontal: 16 },
  legend: { fontSize: 10, color: Colors.textMuted, marginTop: 4 },
});
