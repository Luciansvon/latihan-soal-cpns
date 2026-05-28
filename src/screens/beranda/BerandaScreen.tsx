import React, { useCallback, useEffect, useRef, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  RefreshControl,
  Animated,
  Image,
  Easing,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { Colors, Stitch, Fonts } from '../../constants/colors';
import { useStore } from '../../store';
import { bootstrapProfile } from '../../services/profileBootstrap';
import { EXAM_CONFIGS, type ExamType } from '../../types/exam.types';

const XP_PER_LEVEL = 500;

function Skeleton({ style }: { style?: object }) {
  const opacity = useRef(new Animated.Value(0.4)).current;
  useEffect(() => {
    const loop = Animated.loop(
      Animated.sequence([
        Animated.timing(opacity, { toValue: 1, duration: 700, easing: Easing.inOut(Easing.ease), useNativeDriver: true }),
        Animated.timing(opacity, { toValue: 0.4, duration: 700, easing: Easing.inOut(Easing.ease), useNativeDriver: true }),
      ]),
    );
    loop.start();
    return () => loop.stop();
  }, [opacity]);
  return <Animated.View style={[styles.skeletonBase, style, { opacity }]} />;
}

function HomeSkeleton() {
  return (
    <View style={styles.scroll}>
      <View style={{ gap: 8 }}>
        <Skeleton style={{ height: 24, width: 140 }} />
        <Skeleton style={{ height: 16, width: 200 }} />
      </View>
      <Skeleton style={{ height: 90, borderRadius: 16 }} />
      <Skeleton style={{ height: 88, borderRadius: 16 }} />
      <Skeleton style={{ height: 70, borderRadius: 16 }} />
      <Skeleton style={{ height: 20, width: 120, marginTop: 4 }} />
      <View style={{ gap: 12 }}>
        <Skeleton style={{ height: 96, borderRadius: 14 }} />
        <Skeleton style={{ height: 96, borderRadius: 14 }} />
        <Skeleton style={{ height: 96, borderRadius: 14 }} />
      </View>
    </View>
  );
}

function Toast({ message, onHide }: { message: string; onHide: () => void }) {
  const translateY = useRef(new Animated.Value(20)).current;
  const opacity = useRef(new Animated.Value(0)).current;
  useEffect(() => {
    Animated.parallel([
      Animated.timing(translateY, { toValue: 0, duration: 250, useNativeDriver: true }),
      Animated.timing(opacity, { toValue: 1, duration: 250, useNativeDriver: true }),
    ]).start();
    const t = setTimeout(() => {
      Animated.parallel([
        Animated.timing(translateY, { toValue: 20, duration: 250, useNativeDriver: true }),
        Animated.timing(opacity, { toValue: 0, duration: 250, useNativeDriver: true }),
      ]).start(onHide);
    }, 1800);
    return () => clearTimeout(t);
  }, [translateY, opacity, onHide]);

  return (
    <Animated.View style={[styles.toast, { opacity, transform: [{ translateX: -110 }, { translateY }] }]}>
      <Ionicons name="checkmark-circle" size={20} color="#4ADE80" />
      <Text style={styles.toastText}>{message}</Text>
    </Animated.View>
  );
}

function XPBar({ xpTotal, level }: { xpTotal: number; level: number }) {
  const xpInCurrentLevel = xpTotal % XP_PER_LEVEL;
  const progress = xpInCurrentLevel / XP_PER_LEVEL;
  return (
    <View style={xpStyles.container}>
      <View style={xpStyles.labelRow}>
        <Text style={xpStyles.levelText}>Level {level}</Text>
        <Text style={xpStyles.xpText}>{xpInCurrentLevel} / {XP_PER_LEVEL} XP</Text>
      </View>
      <View style={xpStyles.track}>
        <View style={[xpStyles.fill, { width: `${Math.min(progress * 100, 100)}%` }]} />
      </View>
    </View>
  );
}

const xpStyles = StyleSheet.create({
  container: { gap: 6 },
  labelRow: { flexDirection: 'row', justifyContent: 'space-between' },
  levelText: { fontFamily: Fonts.bold, fontSize: 13, color: Colors.levelBadge },
  xpText: { fontFamily: Fonts.regular, fontSize: 12, color: Colors.textSecondary },
  track: { height: 8, backgroundColor: Colors.gray200, borderRadius: 4, overflow: 'hidden' },
  fill: { height: '100%', backgroundColor: Colors.xpGold, borderRadius: 4 },
});

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function BerandaScreen() {
  const { profile, xpTotal, level, streakCurrent, userId } = useStore();
  const navigation = useNavigation<any>();

  const [loading, setLoading] = useState(!profile);
  const [refreshing, setRefreshing] = useState(false);
  const [showToast, setShowToast] = useState(false);

  useEffect(() => {
    let active = true;
    if (!profile && userId) {
      bootstrapProfile(userId).finally(() => { if (active) setLoading(false); });
    } else {
      setLoading(false);
    }
    return () => { active = false; };
  }, [profile, userId]);

  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    try {
      if (userId) await bootstrapProfile(userId);
      setShowToast(true);
    } finally {
      setRefreshing(false);
    }
  }, [userId]);

  const goToLatihan = () => navigation.navigate('Latihan');

  const displayName = profile?.fullName ?? profile?.username ?? 'Pejuang CPNS';
  const hour = new Date().getHours();
  const greeting =
    hour < 11 ? 'Selamat pagi' : hour < 15 ? 'Selamat siang' : hour < 18 ? 'Selamat sore' : 'Selamat malam';

  return (
    <SafeAreaView style={styles.safe} edges={['top']}>
      {/* Brand header */}
      <View style={styles.brandBar}>
        <Image source={require('../../../assets/wirago-logo.png')} style={styles.brandLogo} resizeMode="contain" />
        <Text style={styles.brandName}>Wirago Academy</Text>
      </View>

      {loading ? (
        <HomeSkeleton />
      ) : (
        <ScrollView
          contentContainerStyle={styles.scroll}
          showsVerticalScrollIndicator={false}
          refreshControl={
            <RefreshControl refreshing={refreshing} onRefresh={onRefresh} tintColor={Stitch.primary} colors={[Stitch.primary]} />
          }
        >
          {/* Greeting */}
          <View style={styles.header}>
            <View>
              <Text style={styles.greeting}>{greeting},</Text>
              <Text style={styles.username}>{displayName} 👋</Text>
            </View>
            <View style={styles.streakBadge}>
              <Text style={styles.streakFire}>🔥</Text>
              <Text style={styles.streakCount}>{streakCurrent}</Text>
            </View>
          </View>

          {/* XP Card */}
          <View style={styles.card}>
            <Text style={styles.cardLabel}>Perkembangan XP</Text>
            <XPBar xpTotal={xpTotal} level={level} />
            <Text style={styles.totalXP}>{xpTotal.toLocaleString('id-ID')} XP total</Text>
          </View>

          {/* Streak Info */}
          <View style={styles.streakCard}>
            <View style={styles.streakIcon}>
              <Ionicons name="flame" size={28} color={Colors.streakFire} />
            </View>
            <View style={styles.streakInfo}>
              <Text style={styles.streakTitle}>Streak Belajar</Text>
              <Text style={styles.streakDesc}>
                {streakCurrent > 0
                  ? `${streakCurrent} hari berturut-turut. Pertahankan!`
                  : 'Mulai belajar hari ini untuk streak pertamamu!'}
              </Text>
            </View>
            <Text style={styles.streakNumber}>{streakCurrent}</Text>
          </View>

          {/* Daily Challenge */}
          <View style={styles.challengeCard}>
            <View style={styles.challengeLeft}>
              <Ionicons name="trophy" size={22} color={Colors.xpGold} />
              <View style={styles.challengeText}>
                <Text style={styles.challengeTitle}>Daily Challenge</Text>
                <Text style={styles.challengeDesc}>10 soal acak • +50 XP bonus</Text>
              </View>
            </View>
            <TouchableOpacity style={styles.challengeBtn} activeOpacity={0.8} onPress={goToLatihan}>
              <Text style={styles.challengeBtnText}>Mulai</Text>
            </TouchableOpacity>
          </View>

          {/* Quick Practice Buttons */}
          <Text style={styles.sectionTitle}>Mulai Latihan</Text>
          <View style={styles.examGrid}>
            {(Object.keys(EXAM_CONFIGS) as ExamType[]).map((examType) => {
              const config = EXAM_CONFIGS[examType];
              return (
                <TouchableOpacity
                  key={examType}
                  style={[styles.examCard, { borderColor: EXAM_COLORS[examType] }]}
                  activeOpacity={0.8}
                  onPress={() => navigation.navigate('Latihan', { screen: 'CategoryList', params: { examType } })}
                >
                  <View style={[styles.examBadge, { backgroundColor: EXAM_COLORS[examType] }]}>
                    <Text style={styles.examBadgeText}>{config.label}</Text>
                  </View>
                  <Text style={styles.examDesc}>{config.description}</Text>
                  <View style={styles.examFooter}>
                    <Text style={styles.examSubjectCount}>{config.subjects.length} mata pelajaran</Text>
                    <Ionicons name="chevron-forward" size={14} color={EXAM_COLORS[examType]} />
                  </View>
                </TouchableOpacity>
              );
            })}
          </View>

          {/* Tip Section */}
          <View style={styles.tipCard}>
            <Ionicons name="bulb-outline" size={18} color={Colors.warning} />
            <Text style={styles.tipText}>
              Konsistensi lebih penting dari intensitas. Belajar 30 menit setiap hari lebih efektif dari 4 jam seminggu sekali.
            </Text>
          </View>
        </ScrollView>
      )}

      {showToast ? <Toast message="Berhasil memuat data" onHide={() => setShowToast(false)} /> : null}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },

  brandBar: {
    flexDirection: 'row', alignItems: 'center', gap: 10,
    paddingHorizontal: 20, height: 56,
    backgroundColor: Stitch.surface,
    borderBottomWidth: 1, borderBottomColor: Colors.border,
  },
  brandLogo: { width: 30, height: 30 },
  brandName: { fontFamily: Fonts.extrabold, fontSize: 20, color: Stitch.primary, letterSpacing: -0.3 },

  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  skeletonBase: { backgroundColor: Stitch.surfaceContainerHigh, borderRadius: 8 },

  toast: {
    position: 'absolute', bottom: 32, left: '50%', width: 220,
    flexDirection: 'row', alignItems: 'center', gap: 10,
    backgroundColor: Stitch.inverseSurface, paddingHorizontal: 16, paddingVertical: 12,
    borderRadius: 8, shadowColor: '#000', shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2, shadowRadius: 8, elevation: 6,
  },
  toastText: { fontFamily: Fonts.regular, fontSize: 14, color: Stitch.inverseOnSurface, flex: 1 },

  header: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start' },
  greeting: { fontFamily: Fonts.regular, fontSize: 14, color: Colors.textSecondary },
  username: { fontFamily: Fonts.extrabold, fontSize: 22, color: Colors.textPrimary, letterSpacing: -0.3 },
  streakBadge: {
    flexDirection: 'row', alignItems: 'center', backgroundColor: Colors.white,
    paddingHorizontal: 12, paddingVertical: 8, borderRadius: 20, gap: 4,
    shadowColor: Colors.black, shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06, shadowRadius: 4, elevation: 2,
  },
  streakFire: { fontSize: 16 },
  streakCount: { fontFamily: Fonts.extrabold, fontSize: 16, color: Colors.streakFire },

  card: {
    backgroundColor: Colors.white, borderRadius: 16, padding: 18, gap: 10,
    shadowColor: Colors.black, shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06, shadowRadius: 6, elevation: 2,
  },
  cardLabel: { fontFamily: Fonts.semibold, fontSize: 13, color: Colors.textSecondary },
  totalXP: { fontFamily: Fonts.regular, fontSize: 12, color: Colors.textMuted },

  streakCard: {
    backgroundColor: Colors.white, borderRadius: 16, padding: 16,
    flexDirection: 'row', alignItems: 'center', gap: 12,
    shadowColor: Colors.black, shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06, shadowRadius: 6, elevation: 2,
  },
  streakIcon: { width: 48, height: 48, borderRadius: 24, backgroundColor: '#FFF7ED', justifyContent: 'center', alignItems: 'center' },
  streakInfo: { flex: 1 },
  streakTitle: { fontFamily: Fonts.bold, fontSize: 14, color: Colors.textPrimary },
  streakDesc: { fontFamily: Fonts.regular, fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
  streakNumber: { fontFamily: Fonts.extrabold, fontSize: 28, color: Colors.streakFire },

  challengeCard: {
    backgroundColor: Colors.primary, borderRadius: 16, padding: 16,
    flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between',
  },
  challengeLeft: { flexDirection: 'row', alignItems: 'center', gap: 12, flex: 1 },
  challengeText: { flex: 1 },
  challengeTitle: { fontFamily: Fonts.bold, fontSize: 15, color: Colors.white },
  challengeDesc: { fontFamily: Fonts.regular, fontSize: 12, color: 'rgba(255,255,255,0.8)', marginTop: 2 },
  challengeBtn: { backgroundColor: Colors.white, paddingHorizontal: 18, paddingVertical: 9, borderRadius: 10 },
  challengeBtnText: { fontFamily: Fonts.bold, fontSize: 14, color: Colors.primary },

  sectionTitle: { fontFamily: Fonts.bold, fontSize: 16, color: Colors.textPrimary },
  examGrid: { gap: 12 },
  examCard: {
    backgroundColor: Colors.white, borderRadius: 14, padding: 16, gap: 8, borderWidth: 1.5,
    shadowColor: Colors.black, shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04, shadowRadius: 4, elevation: 1,
  },
  examBadge: { alignSelf: 'flex-start', paddingHorizontal: 10, paddingVertical: 4, borderRadius: 6 },
  examBadgeText: { fontFamily: Fonts.extrabold, fontSize: 12, color: Colors.white, letterSpacing: 0.5 },
  examDesc: { fontFamily: Fonts.regular, fontSize: 13, color: Colors.textSecondary },
  examFooter: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  examSubjectCount: { fontFamily: Fonts.regular, fontSize: 12, color: Colors.textMuted },

  tipCard: {
    backgroundColor: '#FFFBEB', borderRadius: 12, padding: 14,
    flexDirection: 'row', gap: 10, alignItems: 'flex-start',
    borderWidth: 1, borderColor: '#FDE68A',
  },
  tipText: { flex: 1, fontFamily: Fonts.regular, fontSize: 12, color: Colors.gray700, lineHeight: 18 },
});
