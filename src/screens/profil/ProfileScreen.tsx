import React, { useEffect, useState } from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, ScrollView, Alert, Image,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { Colors, Stitch, Fonts } from '../../constants/colors';
import { supabase } from '../../services/supabase';
import { useStore } from '../../store';
import { getLevelTitle } from '../../types/gamification.types';
import type { ProfilScreenProps } from '../../navigation/types';
import { AvatarService } from '../../services/AvatarService';

type MenuItem = {
  label: string;
  icon: keyof typeof Ionicons.glyphMap;
  screen: 'Achievement' | 'DownloadManager' | 'Settings';
};

const MENU_ITEMS: MenuItem[] = [
  { label: 'Pencapaian', icon: 'trophy-outline', screen: 'Achievement' },
  { label: 'Download Soal Offline', icon: 'download-outline', screen: 'DownloadManager' },
  { label: 'Pengaturan Akun', icon: 'person-circle-outline', screen: 'Settings' },
];

export function ProfileScreen({ navigation }: ProfilScreenProps<'Profile'>) {
  const { profile, xpTotal, level, streakCurrent } = useStore();
  const [email, setEmail] = useState<string>('');

  useEffect(() => {
    let active = true;
    supabase.auth.getUser().then(({ data }) => {
      if (active) setEmail(data.user?.email ?? '');
    });
    return () => { active = false; };
  }, []);

  function handleLogout() {
    Alert.alert('Keluar', 'Yakin mau keluar dari akun?', [
      { text: 'Batal', style: 'cancel' },
      { text: 'Keluar', style: 'destructive', onPress: () => supabase.auth.signOut() },
    ]);
  }

  const displayName = profile?.fullName ?? profile?.username ?? 'Pejuang';
  const initial = displayName.charAt(0).toUpperCase();
  const levelTitle = getLevelTitle(level);

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* Top App Bar */}
      <View style={styles.appBar}>
        <Text style={styles.appBarTitle}>Profil</Text>
      </View>

      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>
        {/* Identity card */}
        <View style={styles.identityCard}>
          <TouchableOpacity
            style={styles.avatarRing}
            activeOpacity={0.85}
            onPress={() => { void AvatarService.changeAvatar(); }}
          >
            {profile?.avatarUrl ? (
              <Image source={{ uri: profile.avatarUrl }} style={styles.avatarImg} />
            ) : (
              <View style={styles.avatarFallback}>
                <Text style={styles.avatarInitial}>{initial}</Text>
              </View>
            )}
            <View style={styles.avatarEditBadge}>
              <Ionicons name="camera" size={14} color={Stitch.onPrimary} />
            </View>
          </TouchableOpacity>
          <Text style={styles.name}>{displayName}</Text>
          {email ? <Text style={styles.email}>{email}</Text> : null}

          <View style={styles.levelChip}>
            <Ionicons name="ribbon" size={13} color={Stitch.primary} />
            <Text style={styles.levelChipText}>Lv.{level} · {levelTitle}</Text>
          </View>

          <TouchableOpacity
            style={styles.editBtn}
            activeOpacity={0.7}
            onPress={() => navigation.navigate('Settings')}
          >
            <Ionicons name="pencil" size={16} color={Stitch.primary} />
            <Text style={styles.editBtnText}>Edit Profil</Text>
          </TouchableOpacity>
        </View>

        {/* Stats strip */}
        <View style={styles.statsRow}>
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{streakCurrent}</Text>
            <Text style={styles.statLabel}>Streak</Text>
          </View>
          <View style={styles.statDivider} />
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{level}</Text>
            <Text style={styles.statLabel}>Level</Text>
          </View>
          <View style={styles.statDivider} />
          <View style={styles.statBox}>
            <Text style={styles.statValue}>{xpTotal.toLocaleString('id-ID')}</Text>
            <Text style={styles.statLabel}>XP</Text>
          </View>
        </View>

        {/* Menu list */}
        <View style={styles.menuCard}>
          {MENU_ITEMS.map((item, idx) => (
            <TouchableOpacity
              key={item.label}
              style={[styles.menuRow, idx < MENU_ITEMS.length - 1 && styles.menuRowBorder]}
              activeOpacity={0.7}
              onPress={() => navigation.navigate(item.screen)}
            >
              <View style={styles.menuIcon}>
                <Ionicons name={item.icon} size={20} color={Stitch.secondary} />
              </View>
              <Text style={styles.menuLabel}>{item.label}</Text>
              <Ionicons name="chevron-forward" size={20} color={Stitch.onSurfaceVariant} />
            </TouchableOpacity>
          ))}
        </View>

        {/* Logout */}
        <TouchableOpacity style={styles.logoutBtn} activeOpacity={0.85} onPress={handleLogout}>
          <Ionicons name="log-out-outline" size={20} color={Stitch.onPrimary} />
          <Text style={styles.logoutText}>Keluar</Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Stitch.background },

  appBar: {
    height: 56,
    backgroundColor: Stitch.surface,
    alignItems: 'center',
    justifyContent: 'center',
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  appBarTitle: { fontFamily: Fonts.semibold, fontSize: 18, color: Stitch.onSurface },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  identityCard: {
    backgroundColor: Stitch.surface,
    borderRadius: 12,
    padding: 24,
    alignItems: 'center',
    shadowColor: Stitch.shadow,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05,
    shadowRadius: 12,
    elevation: 2,
  },
  avatarRing: {
    width: 96, height: 96, borderRadius: 48,
    borderWidth: 4, borderColor: Stitch.surfaceContainerLowest,
    backgroundColor: Stitch.surfaceContainer,
    overflow: 'hidden', marginBottom: 14,
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.06, shadowRadius: 6, elevation: 2,
  },
  avatarImg: { width: '100%', height: '100%' },
  avatarFallback: { flex: 1, backgroundColor: Stitch.primary, alignItems: 'center', justifyContent: 'center' },
  avatarInitial: { fontFamily: Fonts.extrabold, fontSize: 36, color: Stitch.onPrimary },
  avatarEditBadge: {
    position: 'absolute', right: -2, bottom: -2,
    width: 30, height: 30, borderRadius: 15,
    backgroundColor: Stitch.primary,
    borderWidth: 3, borderColor: Stitch.surface,
    alignItems: 'center', justifyContent: 'center',
  },

  name: { fontFamily: Fonts.bold, fontSize: 20, color: Stitch.onSurface },
  email: { fontFamily: Fonts.regular, fontSize: 14, color: Stitch.onSurfaceVariant, marginTop: 2 },

  levelChip: {
    flexDirection: 'row', alignItems: 'center', gap: 5,
    backgroundColor: Stitch.primaryContainer + '14',
    paddingHorizontal: 12, paddingVertical: 5, borderRadius: 999, marginTop: 10,
  },
  levelChipText: { fontFamily: Fonts.semibold, fontSize: 12, color: Stitch.primary },

  editBtn: {
    flexDirection: 'row', alignItems: 'center', gap: 8,
    marginTop: 18, paddingHorizontal: 24, paddingVertical: 10,
    borderRadius: 8, borderWidth: 1, borderColor: Stitch.outlineVariant,
  },
  editBtnText: { fontFamily: Fonts.semibold, fontSize: 14, color: Stitch.primary, letterSpacing: 0.2 },

  statsRow: {
    flexDirection: 'row', alignItems: 'center',
    backgroundColor: Stitch.surface, borderRadius: 12, paddingVertical: 16,
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05, shadowRadius: 12, elevation: 2,
  },
  statBox: { flex: 1, alignItems: 'center', gap: 3 },
  statDivider: { width: 1, height: 28, backgroundColor: Stitch.outlineVariant + '4D' },
  statValue: { fontFamily: Fonts.bold, fontSize: 18, color: Stitch.onSurface },
  statLabel: { fontFamily: Fonts.medium, fontSize: 12, color: Stitch.onSurfaceVariant },

  menuCard: {
    backgroundColor: Stitch.surface, borderRadius: 12, overflow: 'hidden',
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05, shadowRadius: 12, elevation: 2,
  },
  menuRow: { flexDirection: 'row', alignItems: 'center', gap: 12, padding: 16 },
  menuRowBorder: { borderBottomWidth: 1, borderBottomColor: Stitch.outlineVariant + '4D' },
  menuIcon: {
    width: 40, height: 40, borderRadius: 20,
    backgroundColor: Stitch.secondaryContainer,
    alignItems: 'center', justifyContent: 'center',
  },
  menuLabel: { flex: 1, fontFamily: Fonts.regular, fontSize: 16, color: Stitch.onSurface },

  logoutBtn: {
    flexDirection: 'row', alignItems: 'center', justifyContent: 'center', gap: 8,
    backgroundColor: Stitch.primary, borderRadius: 12, paddingVertical: 15, marginTop: 4,
    shadowColor: Stitch.shadow, shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08, shadowRadius: 6, elevation: 2,
  },
  logoutText: { fontFamily: Fonts.semibold, fontSize: 14, color: Stitch.onPrimary, letterSpacing: 0.2 },
});
