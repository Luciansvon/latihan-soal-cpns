import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Image } from 'expo-image';
import { Colors } from '../../constants/colors';
import type { Question } from '../../types/question.types';
import { HighlightedText, TKP_BUZZWORDS } from './HighlightedText';

interface Props {
  question: Question;
  questionNumber: number;
  totalQuestions: number;
  accentColor: string;
}

export function QuestionCard({ question, questionNumber, totalQuestions, accentColor }: Props) {
  const isTKP = question.subject === 'TKP';

  return (
    <View style={styles.card}>
      <View style={styles.headerRow}>
        <View style={[styles.numBadge, { backgroundColor: accentColor + '18' }]}>
          <Text style={[styles.numText, { color: accentColor }]}>
            Soal {questionNumber} / {totalQuestions}
          </Text>
        </View>
        {question.subtopic ? (
          <Text style={styles.subtopic} numberOfLines={1}>
            {question.subtopic}
          </Text>
        ) : null}
      </View>

      {isTKP ? (
        <HighlightedText
          text={question.questionText}
          keywords={TKP_BUZZWORDS}
          style={styles.questionText}
          highlightColor={accentColor}
        />
      ) : (
        <Text style={styles.questionText}>{question.questionText}</Text>
      )}

      {question.questionImageUrl ? (
        <Image
          source={{ uri: question.questionImageUrl }}
          style={styles.image}
          contentFit="contain"
          transition={150}
        />
      ) : null}
    </View>
  );
}

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
  headerRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: 8,
  },
  numBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  numText: { fontSize: 12, fontWeight: '700' },
  subtopic: {
    fontSize: 11,
    fontWeight: '600',
    color: Colors.textMuted,
    flexShrink: 1,
    textAlign: 'right',
  },
  questionText: {
    fontSize: 15,
    lineHeight: 22,
    color: Colors.textPrimary,
    fontWeight: '500',
  },
  image: {
    width: '100%',
    aspectRatio: 16 / 10,
    borderRadius: 10,
    backgroundColor: Colors.gray100,
  },
});
