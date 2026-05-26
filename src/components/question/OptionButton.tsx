import React from 'react';
import { TouchableOpacity, Text, View, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { QuestionOption } from '../../types/question.types';

export type OptionState = 'idle' | 'selected' | 'correct' | 'wrong';

interface OptionButtonProps {
  option: QuestionOption;
  state: OptionState;
  accentColor: string;
  onPress: () => void;
  disabled?: boolean;
}

export function OptionButton({ option, state, accentColor, onPress, disabled }: OptionButtonProps) {
  const colors = stateColors(state, accentColor);

  return (
    <TouchableOpacity
      style={[styles.container, { backgroundColor: colors.bg, borderColor: colors.border }]}
      onPress={onPress}
      disabled={disabled || state === 'correct' || state === 'wrong'}
      activeOpacity={0.75}
    >
      <View style={[styles.bullet, { backgroundColor: colors.bulletBg, borderColor: colors.border }]}>
        {state === 'correct' ? (
          <Ionicons name="checkmark" size={14} color={Colors.white} />
        ) : state === 'wrong' ? (
          <Ionicons name="close" size={14} color={Colors.white} />
        ) : (
          <Text style={[styles.bulletText, { color: colors.bulletText }]}>{option.id}</Text>
        )}
      </View>
      <Text style={[styles.optionText, { color: colors.text }]}>{option.text}</Text>
    </TouchableOpacity>
  );
}

function stateColors(state: OptionState, accent: string) {
  switch (state) {
    case 'correct':
      return {
        bg: Colors.success + '18',
        border: Colors.success,
        bulletBg: Colors.success,
        bulletText: Colors.white,
        text: Colors.gray900,
      };
    case 'wrong':
      return {
        bg: Colors.error + '12',
        border: Colors.error,
        bulletBg: Colors.error,
        bulletText: Colors.white,
        text: Colors.gray900,
      };
    case 'selected':
      return {
        bg: accent + '12',
        border: accent,
        bulletBg: accent,
        bulletText: Colors.white,
        text: Colors.gray900,
      };
    default:
      return {
        bg: Colors.white,
        border: Colors.border,
        bulletBg: Colors.white,
        bulletText: accent,
        text: Colors.textPrimary,
      };
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 12,
    borderWidth: 1.5,
    paddingHorizontal: 14,
    paddingVertical: 13,
    gap: 12,
  },
  bullet: {
    width: 32,
    height: 32,
    borderRadius: 16,
    borderWidth: 1.5,
    justifyContent: 'center',
    alignItems: 'center',
    flexShrink: 0,
  },
  bulletText: { fontSize: 13, fontWeight: '700' },
  optionText: { flex: 1, fontSize: 14, lineHeight: 20 },
});
