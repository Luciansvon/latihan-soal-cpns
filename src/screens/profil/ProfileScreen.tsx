import React from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, ScrollView, Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { supabase } from '../../services/supabase';
import { useStore } from '../../store';
import { getLevelTitle } from '../../types/gamification.types';
import type { ProfilScreenProps } from '../../navigation/types';

export function ProfileScreen({ navigation }: ProfilScreenProps<'Profile'>) {
  const { profile, xpTotal, level, streakCurrent } = useStore();

  async function handleLogout() {
    Alert.alert('Keluar', 'Yakin mau keluar dari akun?', [
      { text: 'Batal', style: 'cancel' },
      {
        text: 'Keluar',
        style: 'destructive',
        onPress: () => supabase.auth.signOut(),
      },
    ]);
  }

  const levelTitle = getLevelTitle(level);
  const xpForNext = Math.pow(level + 1, 2) * 100;
  const xpForCurrent = Math.pow(level, 2) * 100;
  const xpProgress = xpTotal - xpForCurrent;
  const xpNeeded = xpForNext - xpForCurrent;
  const progressPct = Math.min(xpNeeded > 0 ? xpProgress / xpNeeded : 1, 1);

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Header */}
        <View style={styles.header}>
          <View style={styles.avatar}>
            <Text style={styles.avatarText}>
              {(profile?.fullName ?? profile?.username ?? 'U')[0].toUpperCase()}
            </Text>
          </View>
          <Text style={styles.name}>{profile?.fullName ?? profile?.username ?? 'Pejuang'}</Text>
          <View style={styles.levelBadge}>
            <Text style={styles.levelBadgeText}>Lv.{level} Â· {levelTitle}</Text>
          </View>
        </View>

        {/* XP Bar */}
        <View style={styles.xpCard}>
          <View style={styles.xpRow}>
            <Text style={styles.xpLabel}>XP</Text>
            <Text style={styles.xpValue}>{xpTotal.toLocaleString()} / {xpForNext.toLocaleString()}</Text>
          </View>
          <View style={styles.xpTrack}>
            <View style={[styles.xpFill, { width: `${progressPct * 100}%` }]} />
          </View>
        </View>

        {/* Stats */}
        <View style={styles.statsRow}>
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{streakCurrent}</Text>
            <Text style={styles.statLabel}>ðŸ”¥ Streak</Text>
          </View>
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{level}</Text>
            <Text style={styles.statLabel}>â­ Level</Text>
          </View>
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{profile?.targetExam ?? '-'}</Text>
            <Text style={styles.statLabel}>ðŸŽ¯ Target</Text>
          </View>
        </View>

        {/* Menu */}
        <View style={styles.menu}>
          {MENU_ITEMS.map((item) => (
            <TouchableOpacity
              key={item.label}
              style={styles.menuRow}
              onPress={() => {
                if (item.screen) navigation.navigate(item.screen as any);
                else if (item.action === 'logout') handleLogout();
              }}
              activeOpacity={0.7}
            >
              <View style={[styles.menuIcon, { backgroundColor: item.color + '20' }]}>
                <Ionicons name={item.icon as any} size={20} color={item.color} />
              </View>
              <Text style={styles.menuLabel}>{item.label}</Text>
              <Ionicons name="chevron-forward" size={16} color={Colors.gray300} />
            </TouchableOpacity>
          ))}
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

const MENU_ITEMS = [
  { label: 'Pencapaian', icon: 'trophy-outline', color: Colors.xpGold, screen: 'Achievement' },
  { label: 'Download Soal Offline', icon: 'download-outline', color: Colors.info, screen: 'DownloadManager' },
  { label: 'Pengaturan', icon: 'settings-outline', color: Colors.gray500, screen: 'Settings' },
  { label: 'Keluar', icon: 'log-out-outline', color: Colors.error, action: 'logout' },
];

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgSecondary },
  scroll: { flexGrow: 1, paddingBottom: 32 },
  header: { alignItems: 'center', paddingVertical: 28, backgroundColor: Colors.white, borderBottomWidth: 1, borderBottomColor: Colors.border },
  avatar: { width: 80, height: 80, borderRadius: 40, backgroundColor: Colors.primary, justifyContent: 'center', alignItems: 'center', marginBottom: 12 },
  avatarText: { fontSize: 32, fontWeight: '800', color: Colors.white },
  name: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, marginBottom: 6 },
  levelBadge: { backgroundColor: Colors.levelBadge + '20', paddingHorizontal: 14, paddingVertical: 4, borderRadius: 20 },
  levelBadgeText: { fontSize: 13, color: Colors.levelBadge, fontWeight: '700' },
  xpCard: { backgroundColor: Colors.white, marginHorizontal: 16, marginTop: 16, borderRadius: 16, padding: 16, borderWidth: 1, borderColor: Colors.border },
  xpRow: { flexDirection: 'row', justifyContent: 'space-between', marginBottom: 8 },
  xpLabel: { fontSize: 13, fontWeight: '700', color: Colors.textPrimary },
  xpValue: { fontSize: 13, color: Colors.textMuted },
  xpTrack: { height: 8, backgroundColor: Colors.gray100, borderRadius: 4, overflow: 'hidden' },
  xpFill: { height: '100%', backgroundColor: Colors.xpGold, borderRadius: 4 },
  statsRow: { flexDirection: 'row', marginHorizontal: 16, marginTop: 12, gap: 12 },
  statBox: { flex: 1, backgroundColor: Colors.white, borderRadius: 16, padding: 14, alignItems: 'center', borderWidth: 1, borderColor: Colors.border },
  statValue: { fontSize: 20, fontWeight: '800', color: Colors.textPrimary, marginBottom: 2 },
  statLabel: { fontSize: 11, color: Colors.textMuted, fontWeight: '500' },
  menu: { backgroundColor: Colors.white, marginHorizontal: 16, marginTop: 16, borderRadius: 16, borderWidth: 1, borderColor: Colors.border, overflow: 'hidden' },
  menuRow: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 16, paddingVertical: 14, gap: 14, borderBottomWidth: 1, borderBottomColor: Colors.border },
  menuIcon: { width: 36, height: 36, borderRadius: 10, justifyContent: 'center', alignItems: 'center' },
  menuLabel: { flex: 1, fontSize: 15, color: Colors.textPrimary, fontWeight: '500' },
});
