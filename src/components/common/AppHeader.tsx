import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  Platform,
  type ViewStyle,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { CognitiveCalm, HyperMinimal, Fonts } from '../../constants/colors';
import { useStore } from '../../store';

interface AppHeaderProps {
  /** 'warm' = Cognitive Calm surface (Latihan/Tryout/Profil); 'navy' = Hyper-Personalized glass (Progress) */
  theme?: 'warm' | 'navy';
  /** Show back button (sub-screen). Default false = top-level (avatar shown instead). */
  showBack?: boolean;
  onBackPress?: () => void;
  /** Override center wordmark with custom title. */
  title?: string;
  /** Avatar tap handler (top-level only). */
  onAvatarPress?: () => void;
  /** Bell tap handler. Pass undefined to hide. */
  onBellPress?: () => void | null;
  /** Show bell icon. Default true. */
  showBell?: boolean;
  style?: ViewStyle;
}

/**
 * Unified TopAppBar: avatar (or back) + "Wirago Academy" wordmark + bell.
 *
 * Theme picks surface bg + onSurface tint:
 *  - warm  → CognitiveCalm.surface + CognitiveCalm.onSurface
 *  - navy  → HyperMinimal.glassSurface + HyperMinimal.deepNavy
 *
 * Wordmark color tetap CognitiveCalm.primary di kedua tema biar brand red
 * konsisten — sesuai mockup ui_baru_apk yg pakai red wordmark di Progress
 * (navy bg).
 */
export function AppHeader({
  theme = 'warm',
  showBack = false,
  onBackPress,
  title,
  onAvatarPress,
  onBellPress,
  showBell = true,
  style,
}: AppHeaderProps) {
  const avatarUrl = useStore((s) => s.profile?.avatarUrl);
  const onSurface =
    theme === 'navy' ? HyperMinimal.deepNavy : CognitiveCalm.onSurface;
  const surface =
    theme === 'navy' ? HyperMinimal.glassSurface : CognitiveCalm.surface;
  const border =
    theme === 'navy'
      ? HyperMinimal.borderSubtle
      : CognitiveCalm.surfaceContainerHigh;

  return (
    <View
      style={[
        styles.bar,
        { backgroundColor: surface, borderBottomColor: border },
        style,
      ]}
    >
      {/* Left slot: back button OR avatar */}
      {showBack ? (
        <TouchableOpacity
          style={styles.iconBtn}
          onPress={onBackPress}
          activeOpacity={0.7}
        >
          <Ionicons name="arrow-back" size={22} color={onSurface} />
        </TouchableOpacity>
      ) : (
        <TouchableOpacity
          style={styles.avatarBtn}
          onPress={onAvatarPress}
          activeOpacity={0.85}
          disabled={!onAvatarPress}
        >
          {avatarUrl ? (
            <Image source={{ uri: avatarUrl }} style={styles.avatarImg} />
          ) : (
            <View style={styles.avatarFallback}>
              <Ionicons
                name="person-outline"
                size={16}
                color={CognitiveCalm.onSurfaceVariant}
              />
            </View>
          )}
        </TouchableOpacity>
      )}

      {/* Center: wordmark or title */}
      <View style={styles.center}>
        {title ? (
          <Text style={[styles.title, { color: onSurface }]} numberOfLines={1}>
            {title}
          </Text>
        ) : (
          <View style={styles.wordmarkRow}>
            <Image
              source={require('../../../assets/wirago-logo.png')}
              style={styles.brandIcon}
              resizeMode="contain"
            />
            <Text style={styles.wordmark}>Wirago Academy</Text>
          </View>
        )}
      </View>

      {/* Right slot: bell or spacer */}
      {showBell ? (
        <TouchableOpacity
          style={styles.iconBtn}
          onPress={onBellPress ?? undefined}
          activeOpacity={0.7}
        >
          <Ionicons
            name="notifications-outline"
            size={22}
            color={CognitiveCalm.error}
          />
        </TouchableOpacity>
      ) : (
        <View style={styles.iconBtn} />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  bar: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderBottomWidth: 1,
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.03,
        shadowRadius: 4,
      },
      android: { elevation: 1 },
    }),
  },
  iconBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  avatarBtn: {
    width: 36,
    height: 36,
    borderRadius: 18,
    overflow: 'hidden',
    backgroundColor: CognitiveCalm.surfaceContainer,
    alignItems: 'center',
    justifyContent: 'center',
  },
  avatarImg: { width: '100%', height: '100%' },
  avatarFallback: {
    width: '100%',
    height: '100%',
    alignItems: 'center',
    justifyContent: 'center',
  },
  center: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 8,
  },
  wordmarkRow: { flexDirection: 'row', alignItems: 'center', gap: 6 },
  brandIcon: { width: 28, height: 28 },
  wordmark: {
    fontFamily: Fonts.bold,
    fontSize: 18,
    color: CognitiveCalm.primary,
    letterSpacing: -0.3,
  },
  title: {
    fontFamily: Fonts.bold,
    fontSize: 18,
    letterSpacing: -0.3,
  },
});
