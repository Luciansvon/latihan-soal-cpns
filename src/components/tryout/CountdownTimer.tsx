import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';

interface Props {
  secondsLeft: number;
  totalSeconds: number;
  warningAtSeconds?: number; // default 300 (5 min)
}

export function CountdownTimer({ secondsLeft, totalSeconds, warningAtSeconds = 300 }: Props) {
  const color = colorFor(secondsLeft, totalSeconds, warningAtSeconds);
  const isWarning = secondsLeft <= warningAtSeconds && secondsLeft > 0;

  return (
    <View style={styles.wrap}>
      <View
        style={[
          styles.badge,
          { borderColor: color + '40', backgroundColor: color + '12' },
        ]}
      >
        <Ionicons name="time-outline" size={16} color={color} />
        <Text style={[styles.text, { color }]}>{formatTime(secondsLeft)}</Text>
      </View>
      {isWarning ? <Text style={styles.warning}>Waktu hampir habis!</Text> : null}
    </View>
  );
}

export function formatTime(seconds: number): string {
  const safe = Math.max(0, Math.floor(seconds));
  const h = Math.floor(safe / 3600);
  const m = Math.floor((safe % 3600) / 60);
  const s = safe % 60;
  if (h > 0) {
    return `${pad(h)}:${pad(m)}:${pad(s)}`;
  }
  return `${pad(m)}:${pad(s)}`;
}

function pad(n: number) {
  return String(n).padStart(2, '0');
}

function colorFor(left: number, total: number, warning: number): string {
  if (left <= 0) return Colors.error;
  if (left <= warning) return Colors.error;
  if (left / total <= 0.25) return Colors.warning;
  return Colors.success;
}

const styles = StyleSheet.create({
  wrap: { alignItems: 'center', gap: 2 },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 14,
    paddingVertical: 8,
    borderRadius: 18,
    borderWidth: 1.5,
  },
  text: {
    fontSize: 18,
    fontWeight: '800',
    letterSpacing: 0.5,
    fontVariant: ['tabular-nums'],
  },
  warning: { fontSize: 11, color: Colors.error, fontWeight: '600' },
});
