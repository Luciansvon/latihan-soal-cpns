// StreakRing — visualisasi minimalis streak: 7 dot mingguan + ring "X hari".
// Visual placeholder; akan diganti oleh UI Claude Design.

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';

interface Props {
  current: number;
  longest?: number;
  size?: number; // diameter ring
}

export function StreakRing({ current, longest, size = 80 }: Props) {
  const isActive = current > 0;
  return (
    <View style={styles.wrap}>
      <View
        style={[
          styles.ring,
          {
            width: size,
            height: size,
            borderRadius: size / 2,
            borderColor: isActive ? Colors.streakFire : Colors.border,
          },
        ]}
      >
        <Ionicons name="flame" size={size * 0.35} color={isActive ? Colors.streakFire : Colors.gray300} />
        <Text style={[styles.number, isActive && { color: Colors.streakFire }]}>{current}</Text>
        <Text style={styles.label}>hari</Text>
      </View>
      {typeof longest === 'number' ? (
        <Text style={styles.longest}>Rekor: {longest} hari</Text>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  wrap: { alignItems: 'center', gap: 6 },
  ring: {
    borderWidth: 4,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: Colors.white,
  },
  number: { fontSize: 18, fontWeight: '900', color: Colors.textPrimary, marginTop: -2 },
  label: { fontSize: 9, color: Colors.textMuted, marginTop: -3 },
  longest: { fontSize: 11, color: Colors.textSecondary, fontWeight: '500' },
});
