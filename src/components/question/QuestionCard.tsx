import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Colors } from '../../constants/colors';
import type { Question } from '../../types/question.types';

interface QuestionCardProps {
  question: Question;
  questionNumber: number;
  accentColor: string;
}

export function QuestionCard({ question, questionNumber, accentColor }: QuestionCardProps) {
  const difficultyStyle = DIFFICULTY_STYLES[question.difficulty];
  const isSeringKeluar = question.tags?.includes('sering-keluar');

  return (
    <View style={styles.card}>
      {/* Badges row */}
      <View style={styles.badgeRow}>
        <View style={[styles.numBadge, { backgroundColor: accentColor + '18' }]}>
          <Text style={[styles.numText, { color: accentColor }]}>Soal {questionNumber}</Text>
        </View>
        <View style={[styles.diffBadge, { backgroundColor: difficultyStyle.bg }]}>
          <Text style={[styles.diffText, { color: difficultyStyle.text }]}>
            {question.difficulty}
          </Text>
        </View>
        {isSeringKeluar && (
          <View style={styles.seringBadge}>
            <Text style={styles.seringText}>🔥 SERING KELUAR</Text>
          </View>
        )}
      </View>

      {/* Question text */}
      <Text style={styles.questionText}>{question.questionText}</Text>
    </View>
  );
}

const DIFFICULTY_STYLES = {
  MUDAH: { bg: Colors.success + '18', text: Colors.success },
  SEDANG: { bg: Colors.warning + '20', text: Colors.warning },
  SULIT: { bg: Colors.error + '15', text: Colors.error },
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 20,
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  badgeRow: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    alignItems: 'center',
  },
  numBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  numText: { fontSize: 12, fontWeight: '700' },
  diffBadge: {
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 5,
  },
  diffText: { fontSize: 10, fontWeight: '700', letterSpacing: 0.3 },
  seringBadge: {
    backgroundColor: Colors.warning + '20',
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 5,
  },
  seringText: { fontSize: 10, fontWeight: '700', color: Colors.warning },
  questionText: {
    fontSize: 15,
    lineHeight: 24,
    color: Colors.textPrimary,
    fontWeight: '500',
  },
});
