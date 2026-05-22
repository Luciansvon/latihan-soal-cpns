import React, { useState, useEffect, useRef } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  TouchableOpacity,
  Alert,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { TryoutScreenProps } from '../../navigation/types';

function formatTime(seconds: number): string {
  const h = Math.floor(seconds / 3600);
  const m = Math.floor((seconds % 3600) / 60);
  const s = seconds % 60;
  if (h > 0) {
    return `${String(h).padStart(2, '0')}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
  }
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
}

const TOTAL_SECONDS = 100 * 60; // 100 minutes default

export function TryoutSessionScreen({ route, navigation }: TryoutScreenProps<'TryoutSession'>) {
  const { templateId } = route.params;
  const [timeLeft, setTimeLeft] = useState(TOTAL_SECONDS);
  const [isPaused, setIsPaused] = useState(false);
  const [currentQuestion, setCurrentQuestion] = useState(1);
  const totalQuestions = 110;
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const progress = (currentQuestion - 1) / totalQuestions;
  const timeProgress = timeLeft / TOTAL_SECONDS;
  const timerColor = timeLeft < 300 ? Colors.error : timeLeft < 900 ? Colors.warning : Colors.success;

  useEffect(() => {
    if (!isPaused && timeLeft > 0) {
      intervalRef.current = setInterval(() => {
        setTimeLeft((prev) => {
          if (prev <= 1) {
            clearInterval(intervalRef.current!);
            navigation.replace('TryoutResult', { sessionId: `tryout-${templateId}-001` });
            return 0;
          }
          return prev - 1;
        });
      }, 1000);
    }
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [isPaused, timeLeft]);

  const handleFinish = () => {
    Alert.alert(
      'Selesaikan Tryout?',
      'Kamu masih memiliki waktu tersisa. Apakah kamu yakin ingin mengakhiri tryout?',
      [
        { text: 'Batal', style: 'cancel' },
        {
          text: 'Selesai',
          style: 'destructive',
          onPress: () => navigation.replace('TryoutResult', { sessionId: `tryout-${templateId}-001` }),
        },
      ]
    );
  };

  return (
    <SafeAreaView style={styles.safe}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.headerBtn} onPress={handleFinish}>
          <Ionicons name="close-outline" size={24} color={Colors.textSecondary} />
        </TouchableOpacity>

        {/* Timer */}
        <View style={styles.timerContainer}>
          <View style={[styles.timerBadge, { borderColor: timerColor + '40', backgroundColor: timerColor + '10' }]}>
            <Ionicons name="time-outline" size={16} color={timerColor} />
            <Text style={[styles.timerText, { color: timerColor }]}>
              {formatTime(timeLeft)}
            </Text>
          </View>
          {timeLeft < 300 && (
            <Text style={styles.timerWarning}>Waktu hampir habis!</Text>
          )}
        </View>

        <TouchableOpacity
          style={styles.headerBtn}
          onPress={() => setIsPaused((p) => !p)}
        >
          <Ionicons
            name={isPaused ? 'play-outline' : 'pause-outline'}
            size={22}
            color={Colors.textSecondary}
          />
        </TouchableOpacity>
      </View>

      {/* Progress Bar */}
      <View style={styles.progressBar}>
        <View
          style={[
            styles.progressFill,
            { width: `${Math.min(progress * 100, 100)}%` },
          ]}
        />
      </View>

      {/* Question Counter */}
      <View style={styles.questionCounter}>
        <Text style={styles.questionCountText}>
          Soal {currentQuestion} dari {totalQuestions}
        </Text>
        <View style={styles.timeProgressBar}>
          <View
            style={[
              styles.timeProgressFill,
              {
                width: `${timeProgress * 100}%`,
                backgroundColor: timerColor,
              },
            ]}
          />
        </View>
      </View>

      {/* Placeholder Question Area */}
      <View style={styles.content}>
        <View style={styles.questionCard}>
          <View style={styles.questionNumRow}>
            <View style={styles.questionNumBadge}>
              <Text style={styles.questionNumText}>Soal {currentQuestion}</Text>
            </View>
            <TouchableOpacity style={styles.flagBtn}>
              <Ionicons name="flag-outline" size={18} color={Colors.textSecondary} />
            </TouchableOpacity>
          </View>

          <View style={styles.questionPlaceholder}>
            <Ionicons name="document-text-outline" size={48} color={Colors.gray300} />
            <Text style={styles.placeholderTitle}>Tryout Session</Text>
            <Text style={styles.placeholderDesc}>
              Konten soal akan dimuat di sini{'\n'}
              Template: {templateId}
            </Text>
          </View>
        </View>

        {/* Option Placeholders */}
        {['A', 'B', 'C', 'D', 'E'].map((opt) => (
          <TouchableOpacity key={opt} style={styles.optionCard} activeOpacity={0.8}>
            <View style={styles.optionBullet}>
              <Text style={styles.optionBulletText}>{opt}</Text>
            </View>
            <View style={styles.optionTextPlaceholder} />
          </TouchableOpacity>
        ))}
      </View>

      {/* Bottom Nav */}
      <View style={styles.bottomNav}>
        <TouchableOpacity
          style={styles.navBtn}
          activeOpacity={0.8}
          onPress={() => setCurrentQuestion((q) => Math.max(1, q - 1))}
        >
          <Ionicons name="chevron-back" size={20} color={Colors.textSecondary} />
          <Text style={styles.navBtnText}>Sebelumnya</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.questionGridBtn}
          activeOpacity={0.8}
        >
          <Ionicons name="grid-outline" size={18} color={Colors.primary} />
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.nextBtn}
          activeOpacity={0.8}
          onPress={() => {
            if (currentQuestion < totalQuestions) {
              setCurrentQuestion((q) => q + 1);
            } else {
              handleFinish();
            }
          }}
        >
          <Text style={styles.nextBtnText}>
            {currentQuestion < totalQuestions ? 'Berikutnya' : 'Selesai'}
          </Text>
          <Ionicons name="chevron-forward" size={20} color={Colors.white} />
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
    justifyContent: 'space-between',
  },
  headerBtn: {
    width: 40,
    height: 40,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 20,
    backgroundColor: Colors.gray100,
  },
  timerContainer: { alignItems: 'center', gap: 2 },
  timerBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: 20,
    borderWidth: 1.5,
  },
  timerText: { fontSize: 20, fontWeight: '800', letterSpacing: 1, fontVariant: ['tabular-nums'] },
  timerWarning: { fontSize: 11, color: Colors.error, fontWeight: '600' },

  progressBar: {
    height: 3,
    backgroundColor: Colors.gray100,
  },
  progressFill: {
    height: '100%',
    backgroundColor: Colors.primary,
  },

  questionCounter: {
    backgroundColor: Colors.white,
    paddingHorizontal: 20,
    paddingVertical: 10,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  questionCountText: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary, minWidth: 130 },
  timeProgressBar: {
    flex: 1,
    height: 4,
    backgroundColor: Colors.gray100,
    borderRadius: 2,
    overflow: 'hidden',
  },
  timeProgressFill: {
    height: '100%',
    borderRadius: 2,
  },

  content: { flex: 1, padding: 16, gap: 10 },

  questionCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 18,
    gap: 14,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  questionNumRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  questionNumBadge: {
    backgroundColor: Colors.primary + '15',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  questionNumText: { fontSize: 12, fontWeight: '700', color: Colors.primary },
  flagBtn: { padding: 4 },

  questionPlaceholder: {
    alignItems: 'center',
    paddingVertical: 16,
    gap: 8,
  },
  placeholderTitle: { fontSize: 15, fontWeight: '600', color: Colors.textSecondary },
  placeholderDesc: { fontSize: 12, color: Colors.textMuted, textAlign: 'center', lineHeight: 18 },

  optionCard: {
    backgroundColor: Colors.white,
    borderRadius: 10,
    padding: 12,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  optionBullet: {
    width: 30,
    height: 30,
    borderRadius: 15,
    borderWidth: 2,
    borderColor: Colors.gray200,
    justifyContent: 'center',
    alignItems: 'center',
  },
  optionBulletText: { fontSize: 13, fontWeight: '700', color: Colors.textSecondary },
  optionTextPlaceholder: {
    flex: 1,
    height: 12,
    backgroundColor: Colors.gray100,
    borderRadius: 6,
  },

  bottomNav: {
    backgroundColor: Colors.white,
    flexDirection: 'row',
    padding: 14,
    gap: 10,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
    alignItems: 'center',
  },
  navBtn: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
    paddingVertical: 12,
    borderRadius: 10,
    borderWidth: 1.5,
    borderColor: Colors.border,
  },
  navBtnText: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary },
  questionGridBtn: {
    width: 44,
    height: 44,
    borderRadius: 10,
    borderWidth: 1.5,
    borderColor: Colors.primary + '60',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.primary + '08',
  },
  nextBtn: {
    flex: 1.5,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
    paddingVertical: 12,
    borderRadius: 10,
    backgroundColor: Colors.primary,
  },
  nextBtnText: { fontSize: 13, fontWeight: '700', color: Colors.white },
});
