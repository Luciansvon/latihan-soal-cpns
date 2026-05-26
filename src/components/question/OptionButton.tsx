import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { Image } from 'expo-image';
import * as Haptics from 'expo-haptics';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { HighlightedText } from './HighlightedText';

export type OptionState = 'idle' | 'selected' | 'correct' | 'wrong' | 'disabled';

interface Props {
  optionId: string;
  text: string;
  imageUrl?: string;
  state: OptionState;
  accentColor: string;
  onPress: () => void;
  /** Kalau diset, kata-kata dalam list ini di-highlight di teks opsi. */
  highlightKeywords?: string[];
}

export function OptionButton({
  optionId,
  text,
  imageUrl,
  state,
  accentColor,
  onPress,
  highlightKeywords,
}: Props) {
  const isInteractive = state === 'idle' || state === 'selected';

  const handlePress = () => {
    if (!isInteractive) return;
    Haptics.selectionAsync().catch(() => {});
    onPress();
  };

  const colors = resolveColors(state, accentColor);

  return (
    <TouchableOpacity
      style={[styles.card, { borderColor: colors.border, backgroundColor: colors.bg }]}
      activeOpacity={isInteractive ? 0.8 : 1}
      onPress={handlePress}
      disabled={!isInteractive}
    >
      <View style={[styles.bullet, { borderColor: colors.bullet, backgroundColor: colors.bulletBg }]}>
        <Text style={[styles.bulletText, { color: colors.bulletText }]}>{optionId}</Text>
      </View>

      <View style={styles.body}>
        {highlightKeywords && highlightKeywords.length > 0 ? (
          <HighlightedText
            text={text}
            keywords={highlightKeywords}
            style={[styles.text, { color: colors.text }]}
            highlightColor={accentColor}
          />
        ) : (
          <Text style={[styles.text, { color: colors.text }]}>{text}</Text>
        )}
        {imageUrl ? (
          <Image
            source={{ uri: imageUrl }}
            style={styles.image}
            contentFit="contain"
            transition={120}
          />
        ) : null}
      </View>

      {state === 'correct' ? (
        <Ionicons name="checkmark-circle" size={22} color={Colors.success} />
      ) : state === 'wrong' ? (
        <Ionicons name="close-circle" size={22} color={Colors.error} />
      ) : null}
    </TouchableOpacity>
  );
}

function resolveColors(state: OptionState, accent: string) {
  switch (state) {
    case 'selected':
      return {
        border: accent,
        bg: accent + '10',
        bullet: accent,
        bulletBg: accent,
        bulletText: Colors.white,
        text: Colors.textPrimary,
      };
    case 'correct':
      return {
        border: Colors.success,
        bg: Colors.success + '14',
        bullet: Colors.success,
        bulletBg: Colors.success,
        bulletText: Colors.white,
        text: Colors.textPrimary,
      };
    case 'wrong':
      return {
        border: Colors.error,
        bg: Colors.error + '12',
        bullet: Colors.error,
        bulletBg: Colors.error,
        bulletText: Colors.white,
        text: Colors.textPrimary,
      };
    case 'disabled':
      return {
        border: Colors.border,
        bg: Colors.white,
        bullet: Colors.gray300,
        bulletBg: Colors.white,
        bulletText: Colors.textMuted,
        text: Colors.textMuted,
      };
    case 'idle':
    default:
      return {
        border: Colors.border,
        bg: Colors.white,
        bullet: accent + '60',
        bulletBg: Colors.white,
        bulletText: accent,
        text: Colors.textPrimary,
      };
  }
}

const styles = StyleSheet.create({
  card: {
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    borderWidth: 1.5,
  },
  bullet: {
    width: 34,
    height: 34,
    borderRadius: 17,
    borderWidth: 2,
    justifyContent: 'center',
    alignItems: 'center',
  },
  bulletText: { fontSize: 14, fontWeight: '700' },
  body: { flex: 1, gap: 8 },
  text: { fontSize: 14, lineHeight: 20, fontWeight: '500' },
  image: {
    width: '100%',
    aspectRatio: 16 / 10,
    borderRadius: 8,
    backgroundColor: Colors.gray100,
  },
});
