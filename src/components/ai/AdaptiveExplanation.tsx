// AdaptiveExplanation
// Render pembahasan adaptif: tampilkan strategi belajar (offline, dari
// constants/learningStrategyMap) + tombol "Generate pembahasan AI" yang
// memanggil Edge Function ai-tutor. Hint juga di-handle di sini (3 level).

import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { Question } from '../../types/question.types';
import type { ExamType } from '../../types/exam.types';
import { AIService, AIError } from '../../services/AIService';
import {
  dominantVark,
  dominantHoneyMumford,
  getStrategyTip,
  VARK_LABELS,
  HM_LABELS,
} from '../../constants/learningStrategyMap';
import { useStore } from '../../store';

interface Props {
  question: Question;
  examType: ExamType;
  accentColor?: string;
}

type Phase = 'idle' | 'loading' | 'done' | 'error' | 'rate-limited';

export function AdaptiveExplanation({ question, examType, accentColor = Colors.primary }: Props) {
  const profile = useStore((s) => s.profile);
  const isOnline = useStore((s) => s.isOnline);
  const learningStyle = profile?.learningStyle;

  const [phase, setPhase] = useState<Phase>('idle');
  const [aiText, setAiText] = useState<string>('');
  const [error, setError] = useState<string | null>(null);
  const [usage, setUsage] = useState<{ used: number; limit: number } | null>(null);

  const [hintLevel, setHintLevel] = useState<0 | 1 | 2 | 3>(0);
  const [hintText, setHintText] = useState<string>('');
  const [hintLoading, setHintLoading] = useState(false);

  const vark = dominantVark(learningStyle);
  const hm = dominantHoneyMumford(learningStyle);
  const offlineTip = getStrategyTip(question.subject, vark);

  async function generateAI() {
    setPhase('loading');
    setError(null);
    try {
      const res = await AIService.requestExplanation({ question, examType });
      setAiText(res.content);
      setUsage({ used: res.usedToday, limit: res.dailyLimit });
      setPhase('done');
    } catch (e: any) {
      if (e instanceof AIError && e.rateLimited) {
        setUsage({ used: e.rateLimited.usedToday, limit: e.rateLimited.dailyLimit });
        setError(e.rateLimited.message);
        setPhase('rate-limited');
      } else {
        setError(e?.message ?? 'Gagal memanggil AI.');
        setPhase('error');
      }
    }
  }

  async function requestHint(level: 1 | 2 | 3) {
    setHintLoading(true);
    try {
      const res = await AIService.requestHint({ question, examType, level });
      setHintText(res.content);
      setHintLevel(level);
      setUsage({ used: res.usedToday, limit: res.dailyLimit });
    } catch (e: any) {
      if (e instanceof AIError && e.rateLimited) {
        setUsage({ used: e.rateLimited.usedToday, limit: e.rateLimited.dailyLimit });
        setError(e.rateLimited.message);
      } else {
        setError(e?.message ?? 'Gagal memanggil hint AI.');
      }
    } finally {
      setHintLoading(false);
    }
  }

  return (
    <View style={[styles.card, { borderLeftColor: accentColor }]}>
      <View style={styles.header}>
        <Ionicons name="sparkles-outline" size={16} color={accentColor} />
        <Text style={[styles.headerTitle, { color: accentColor }]}>Tutor Adaptif</Text>
        {usage ? (
          <Text style={styles.usage}>
            AI {usage.used}/{usage.limit}
          </Text>
        ) : null}
      </View>

      {/* Profil summary */}
      <Text style={styles.profileText}>
        Profil kamu: <Text style={styles.profileEm}>{VARK_LABELS[vark]}</Text> ·{' '}
        <Text style={styles.profileEm}>{HM_LABELS[hm]}</Text>
      </Text>

      {/* Offline tip */}
      <View style={styles.tipBox}>
        <Ionicons name="bulb-outline" size={14} color={Colors.textSecondary} />
        <Text style={styles.tipText}>{offlineTip}</Text>
      </View>

      {/* Hint buttons */}
      <View style={styles.hintRow}>
        {([1, 2, 3] as const).map((lvl) => {
          const used = hintLevel >= lvl;
          return (
            <TouchableOpacity
              key={lvl}
              style={[
                styles.hintBtn,
                used && { backgroundColor: accentColor + '15', borderColor: accentColor },
              ]}
              disabled={hintLoading || !isOnline}
              onPress={() => requestHint(lvl)}
              activeOpacity={0.8}
            >
              <Text style={[styles.hintBtnText, used && { color: accentColor }]}>
                Hint {lvl}
              </Text>
            </TouchableOpacity>
          );
        })}
        {hintLoading ? <ActivityIndicator size="small" color={accentColor} /> : null}
      </View>

      {hintText ? (
        <View style={styles.hintBox}>
          <Text style={styles.hintLabel}>Hint level {hintLevel}:</Text>
          <Text style={styles.hintBody}>{hintText}</Text>
        </View>
      ) : null}

      {/* Explanation generator */}
      {phase === 'done' && aiText ? (
        <View style={styles.aiBox}>
          <Text style={styles.aiLabel}>Pembahasan AI</Text>
          <Text style={styles.aiBody}>{aiText}</Text>
        </View>
      ) : (
        <TouchableOpacity
          style={[
            styles.generateBtn,
            { backgroundColor: accentColor },
            (!isOnline || phase === 'loading') && styles.generateBtnDisabled,
          ]}
          activeOpacity={0.85}
          disabled={!isOnline || phase === 'loading'}
          onPress={generateAI}
        >
          {phase === 'loading' ? (
            <ActivityIndicator color={Colors.white} />
          ) : (
            <>
              <Ionicons name="sparkles" size={16} color={Colors.white} />
              <Text style={styles.generateBtnText}>
                {isOnline ? 'Generate Pembahasan AI' : 'AI butuh koneksi internet'}
              </Text>
            </>
          )}
        </TouchableOpacity>
      )}

      {error ? <Text style={styles.errorText}>{error}</Text> : null}
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: Colors.white,
    borderRadius: 12,
    padding: 14,
    gap: 10,
    borderLeftWidth: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 3,
    elevation: 1,
  },
  header: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  headerTitle: { flex: 1, fontSize: 13, fontWeight: '700' },
  usage: { fontSize: 11, color: Colors.textMuted, fontWeight: '600' },

  profileText: { fontSize: 12, color: Colors.textSecondary },
  profileEm: { fontWeight: '700', color: Colors.textPrimary },

  tipBox: {
    flexDirection: 'row',
    gap: 6,
    backgroundColor: Colors.gray50,
    borderRadius: 8,
    padding: 10,
    alignItems: 'flex-start',
  },
  tipText: { flex: 1, fontSize: 12, color: Colors.textSecondary, lineHeight: 18 },

  hintRow: { flexDirection: 'row', gap: 8, alignItems: 'center' },
  hintBtn: {
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 8,
    borderWidth: 1.5,
    borderColor: Colors.border,
    backgroundColor: Colors.white,
  },
  hintBtnText: { fontSize: 12, fontWeight: '700', color: Colors.textSecondary },

  hintBox: {
    backgroundColor: '#FFFBEB',
    borderRadius: 8,
    padding: 10,
    gap: 4,
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  hintLabel: { fontSize: 11, fontWeight: '700', color: Colors.warning },
  hintBody: { fontSize: 13, color: Colors.textPrimary, lineHeight: 19 },

  aiBox: {
    backgroundColor: '#EFF6FF',
    borderRadius: 8,
    padding: 10,
    gap: 4,
    borderWidth: 1,
    borderColor: '#BFDBFE',
  },
  aiLabel: { fontSize: 11, fontWeight: '700', color: Colors.info },
  aiBody: { fontSize: 13, color: Colors.textPrimary, lineHeight: 19 },

  generateBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 12,
    borderRadius: 10,
  },
  generateBtnDisabled: { opacity: 0.5 },
  generateBtnText: { fontSize: 13, fontWeight: '700', color: Colors.white },

  errorText: { fontSize: 12, color: Colors.error },
});
