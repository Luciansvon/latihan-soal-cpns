import React, { useState, useRef } from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, SafeAreaView, ScrollView, Animated,
} from 'react-native';
import { Colors } from '../../constants/colors';
import { LEARNING_STYLE_QUESTIONS } from '../../constants/learningStyleQuestions';
import { calculateLearningStyle, type AnswerMap } from '../../utils/LearningStyleEngine';
import type { AuthScreenProps } from '../../navigation/types';

const TOTAL = LEARNING_STYLE_QUESTIONS.length;

export function LearningStyleQuizScreen({ navigation }: AuthScreenProps<'LearningStyleQuiz'>) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<AnswerMap>({});
  const fadeAnim = useRef(new Animated.Value(1)).current;

  const question = LEARNING_STYLE_QUESTIONS[currentIndex];
  const selectedAnswer = answers[question.id];
  const progress = (currentIndex + 1) / TOTAL;

  function handleSelect(optionId: 'A' | 'B' | 'C' | 'D') {
    setAnswers((prev) => ({ ...prev, [question.id]: optionId }));
  }

  function handleNext() {
    if (!selectedAnswer) return;

    Animated.sequence([
      Animated.timing(fadeAnim, { toValue: 0, duration: 150, useNativeDriver: true }),
      Animated.timing(fadeAnim, { toValue: 1, duration: 150, useNativeDriver: true }),
    ]).start();

    if (currentIndex < TOTAL - 1) {
      setTimeout(() => setCurrentIndex((i) => i + 1), 150);
    } else {
      // Calculate and navigate to result
      const profile = calculateLearningStyle(answers);
      navigation.navigate('HasilAnalisis', { profile });
    }
  }

  function handlePrev() {
    if (currentIndex > 0) {
      setCurrentIndex((i) => i - 1);
    }
  }

  return (
    <SafeAreaView style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <View style={styles.headerTop}>
          <Text style={styles.headerTitle}>Analisis Gaya Belajar</Text>
          <Text style={styles.counter}>{currentIndex + 1}/{TOTAL}</Text>
        </View>

        {/* Progress bar */}
        <View style={styles.progressTrack}>
          <Animated.View style={[styles.progressFill, { width: `${progress * 100}%` }]} />
        </View>

        <Text style={styles.headerSub}>
          Berdasarkan VARK Questionnaire (Fleming & Mills, 1992)
        </Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        <Animated.View style={{ opacity: fadeAnim }}>
          {/* Question */}
          <View style={styles.questionBox}>
            <Text style={styles.questionText}>{question.question}</Text>
          </View>

          {/* Options */}
          <View style={styles.options}>
            {question.options.map((option) => {
              const isSelected = selectedAnswer === option.id;
              return (
                <TouchableOpacity
                  key={option.id}
                  style={[styles.optionCard, isSelected && styles.optionSelected]}
                  onPress={() => handleSelect(option.id)}
                  activeOpacity={0.7}
                >
                  <View style={[styles.optionBadge, isSelected && styles.optionBadgeSelected]}>
                    <Text style={[styles.optionBadgeText, isSelected && styles.optionBadgeTextSelected]}>
                      {option.id}
                    </Text>
                  </View>
                  <Text style={[styles.optionText, isSelected && styles.optionTextSelected]}>
                    {option.text}
                  </Text>
                </TouchableOpacity>
              );
            })}
          </View>
        </Animated.View>
      </ScrollView>

      {/* Navigation */}
      <View style={styles.navRow}>
        <TouchableOpacity
          style={[styles.prevBtn, currentIndex === 0 && styles.btnHidden]}
          onPress={handlePrev}
          disabled={currentIndex === 0}
          activeOpacity={0.7}
        >
          <Text style={styles.prevBtnText}>← Kembali</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={[styles.nextBtn, !selectedAnswer && styles.nextBtnDisabled]}
          onPress={handleNext}
          disabled={!selectedAnswer}
          activeOpacity={0.85}
        >
          <Text style={styles.nextBtnText}>
            {currentIndex === TOTAL - 1 ? 'Lihat Hasil 🎯' : 'Berikutnya →'}
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgPrimary },
  header: { paddingHorizontal: 24, paddingTop: 16, paddingBottom: 12 },
  headerTop: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 },
  headerTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary },
  counter: { fontSize: 13, fontWeight: '600', color: Colors.textMuted },
  progressTrack: { height: 6, backgroundColor: Colors.gray100, borderRadius: 3, overflow: 'hidden' },
  progressFill: { height: '100%', backgroundColor: Colors.primary, borderRadius: 3 },
  headerSub: { fontSize: 11, color: Colors.textMuted, marginTop: 8, fontStyle: 'italic' },
  scroll: { flexGrow: 1, paddingHorizontal: 24, paddingTop: 8, paddingBottom: 24 },
  questionBox: {
    backgroundColor: Colors.gray50,
    borderRadius: 16,
    padding: 20,
    marginBottom: 20,
    borderLeftWidth: 4,
    borderLeftColor: Colors.primary,
  },
  questionText: { fontSize: 16, color: Colors.textPrimary, lineHeight: 24, fontWeight: '500' },
  options: { gap: 10 },
  optionCard: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 12,
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 14,
    borderWidth: 1.5,
    borderColor: Colors.border,
  },
  optionSelected: { borderColor: Colors.primary, backgroundColor: '#FFF0F0' },
  optionBadge: {
    width: 32,
    height: 32,
    borderRadius: 16,
    backgroundColor: Colors.gray100,
    justifyContent: 'center',
    alignItems: 'center',
    flexShrink: 0,
  },
  optionBadgeSelected: { backgroundColor: Colors.primary },
  optionBadgeText: { fontSize: 13, fontWeight: '700', color: Colors.textSecondary },
  optionBadgeTextSelected: { color: Colors.white },
  optionText: { fontSize: 14, color: Colors.textPrimary, lineHeight: 20, flex: 1 },
  optionTextSelected: { color: Colors.primary, fontWeight: '500' },
  navRow: {
    flexDirection: 'row',
    paddingHorizontal: 24,
    paddingVertical: 16,
    gap: 12,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
    backgroundColor: Colors.white,
  },
  prevBtn: { flex: 1, paddingVertical: 14, alignItems: 'center', borderRadius: 12, borderWidth: 1.5, borderColor: Colors.border },
  btnHidden: { opacity: 0 },
  prevBtnText: { fontSize: 15, color: Colors.textSecondary, fontWeight: '600' },
  nextBtn: { flex: 2, paddingVertical: 14, alignItems: 'center', borderRadius: 12, backgroundColor: Colors.primary },
  nextBtnDisabled: { opacity: 0.4 },
  nextBtnText: { fontSize: 15, color: Colors.white, fontWeight: '700' },
});
