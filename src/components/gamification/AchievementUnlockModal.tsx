// AchievementUnlockModal — modal yang muncul saat user unlock 1+ achievement.
// Auto-cycle kalau >1 achievement: tampilkan satu per satu dengan tombol "Lanjut".

import React, { useState } from 'react';
import { Modal, View, Text, StyleSheet, TouchableOpacity, Pressable } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import type { Achievement } from '../../types/gamification.types';

interface Props {
  achievements: Achievement[];
  onClose: () => void;
}

export function AchievementUnlockModal({ achievements, onClose }: Props) {
  const [idx, setIdx] = useState(0);
  const visible = achievements.length > 0;
  const current = achievements[idx];
  const isLast = idx === achievements.length - 1;

  const handleNext = () => {
    if (isLast) {
      onClose();
      setTimeout(() => setIdx(0), 200);
    } else {
      setIdx((i) => i + 1);
    }
  };

  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={onClose}>
      <Pressable style={styles.backdrop} onPress={onClose}>
        <Pressable style={styles.card} onPress={(e) => e.stopPropagation()}>
          {current ? (
            <>
              <View style={styles.iconBox}>
                <Ionicons name={(current.iconName as any) ?? 'trophy'} size={36} color={Colors.xpGold} />
              </View>
              <Text style={styles.label}>ACHIEVEMENT UNLOCKED!</Text>
              <Text style={styles.title}>{current.title}</Text>
              <Text style={styles.desc}>{current.description}</Text>
              <View style={styles.xpRow}>
                <Ionicons name="star" size={14} color={Colors.xpGold} />
                <Text style={styles.xpText}>+{current.xpReward} XP</Text>
              </View>
              {achievements.length > 1 ? (
                <Text style={styles.counter}>
                  {idx + 1} / {achievements.length}
                </Text>
              ) : null}
              <TouchableOpacity style={styles.btn} onPress={handleNext}>
                <Text style={styles.btnText}>{isLast ? 'Mantap!' : 'Lanjut'}</Text>
              </TouchableOpacity>
            </>
          ) : null}
        </Pressable>
      </Pressable>
    </Modal>
  );
}

const styles = StyleSheet.create({
  backdrop: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.5)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 32,
  },
  card: {
    backgroundColor: Colors.white,
    borderRadius: 20,
    padding: 24,
    alignItems: 'center',
    gap: 10,
    width: '100%',
    maxWidth: 320,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.25,
    shadowRadius: 20,
    elevation: 8,
  },
  iconBox: {
    width: 76,
    height: 76,
    borderRadius: 38,
    backgroundColor: '#FFFBEB',
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 3,
    borderColor: Colors.xpGold + '40',
  },
  label: {
    fontSize: 10,
    fontWeight: '800',
    color: Colors.xpGold,
    letterSpacing: 1.2,
    marginTop: 2,
  },
  title: { fontSize: 20, fontWeight: '900', color: Colors.textPrimary, textAlign: 'center' },
  desc: { fontSize: 13, color: Colors.textSecondary, textAlign: 'center', lineHeight: 19 },
  xpRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    backgroundColor: '#FFFBEB',
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 8,
    marginTop: 4,
  },
  xpText: { fontSize: 13, fontWeight: '800', color: Colors.xpGold },
  counter: { fontSize: 11, color: Colors.textMuted },
  btn: {
    marginTop: 6,
    backgroundColor: Colors.primary,
    paddingHorizontal: 32,
    paddingVertical: 12,
    borderRadius: 10,
  },
  btnText: { fontSize: 14, fontWeight: '700', color: Colors.white },
});
