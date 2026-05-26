// XPBar — progress bar dari XP sekarang ke threshold level berikutnya.
// Threshold formula: levelN butuh N²×100 XP.

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { xpForLevel, getLevelTitle } from '../../types/gamification.types';

interface Props {
  xpTotal: number;
  level: number;
  showTitle?: boolean;
}

export function XPBar({ xpTotal, level, showTitle = true }: Props) {
  const currentLevelXp = xpForLevel(level);
  const nextLevelXp = xpForLevel(level + 1);
  const into = Math.max(0, xpTotal - currentLevelXp);
  const span = Math.max(1, nextLevelXp - currentLevelXp);
  const pct = Math.min(100, Math.round((into / span) * 100));
  const remaining = Math.max(0, nextLevelXp - xpTotal);

  return (
    <View style={styles.wrap}>
      <View style={styles.row}>
        <View style={styles.levelBadge}>
          <Ionicons name="ribbon" size={14} color={Colors.white} />
          <Text style={styles.levelText}>Level {level}</Text>
        </View>
        {showTitle ? <Text style={styles.title}>{getLevelTitle(level)}</Text> : null}
        <Text style={styles.xpText}>{xpTotal.toLocaleString('id-ID')} XP</Text>
      </View>
      <View style={styles.track}>
        <View style={[styles.fill, { width: `${pct}%` }]} />
      </View>
      <Text style={styles.hint}>
        {remaining > 0
          ? `${remaining.toLocaleString('id-ID')} XP lagi ke Level ${level + 1}`
          : `Level ${level + 1} akan terbuka!`}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  wrap: { gap: 6 },
  row: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  levelBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    backgroundColor: Colors.levelBadge,
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 6,
  },
  levelText: { fontSize: 11, fontWeight: '800', color: Colors.white, letterSpacing: 0.3 },
  title: { flex: 1, fontSize: 12, fontWeight: '600', color: Colors.textSecondary },
  xpText: { fontSize: 12, fontWeight: '700', color: Colors.textPrimary },
  track: {
    height: 8,
    backgroundColor: Colors.gray100,
    borderRadius: 4,
    overflow: 'hidden',
  },
  fill: { height: '100%', backgroundColor: Colors.xpGold, borderRadius: 4 },
  hint: { fontSize: 10, color: Colors.textMuted },
});
