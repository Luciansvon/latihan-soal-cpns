import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Ionicons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { Colors } from '../../constants/colors';
import { useStore } from '../../store';
import { EXAM_CONFIGS, type ExamType } from '../../types/exam.types';

const XP_PER_LEVEL = 500;

function XPBar({ xpTotal, level }: { xpTotal: number; level: number }) {
  const xpInCurrentLevel = xpTotal % XP_PER_LEVEL;
  const progress = xpInCurrentLevel / XP_PER_LEVEL;

  return (
    <View style={xpStyles.container}>
      <View style={xpStyles.labelRow}>
        <Text style={xpStyles.levelText}>Level {level}</Text>
        <Text style={xpStyles.xpText}>
          {xpInCurrentLevel} / {XP_PER_LEVEL} XP
        </Text>
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
  levelText: { fontSize: 13, fontWeight: '700', color: Colors.levelBadge },
  xpText: { fontSize: 12, color: Colors.textSecondary },
  track: {
    height: 8,
    backgroundColor: Colors.gray200,
    borderRadius: 4,
    overflow: 'hidden',
  },
  fill: {
    height: '100%',
    backgroundColor: Colors.xpGold,
    borderRadius: 4,
  },
});

const EXAM_COLORS: Record<ExamType, string> = {
  CPNS: Colors.cpns,
  TNI: Colors.tni,
  POLRI: Colors.polri,
};

export function BerandaScreen() {
  const { profile, xpTotal, level, streakCurrent } = useStore();
  const navigation = useNavigation<any>();

  const goToLatihan = () => navigation.navigate('Latihan');

  const displayName = profile?.fullName ?? profile?.username ?? 'Pejuang CPNS';
  const hour = new Date().getHours();
  const greeting =
    hour < 11 ? 'Selamat pagi' : hour < 15 ? 'Selamat siang' : hour < 18 ? 'Selamat sore' : 'Selamat malam';

  return (
    <SafeAreaView style={styles.safe}>
      <ScrollView contentContainerStyle={styles.scroll} showsVerticalScrollIndicator={false}>

        {/* Header */}
        <View style={styles.header}>
          <View>
            <Text style={styles.greeting}>{greeting},</Text>
            <Text style={styles.username}>{displayName} ðŸ‘‹</Text>
          </View>
          <View style={styles.streakBadge}>
            <Text style={styles.streakFire}>ðŸ”¥</Text>
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
              <Text style={styles.challengeDesc}>10 soal acak â€¢ +50 XP bonus</Text>
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
                onPress={goToLatihan}
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
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: Colors.bgSecondary },
  scroll: { padding: 20, gap: 16, paddingBottom: 40 },

  header: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start' },
  greeting: { fontSize: 14, color: Colors.textSecondary },
  username: { fontSize: 22, fontWeight: '800', color: Colors.textPrimary, letterSpacing: -0.3 },
  streakBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: Colors.white,
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 20,
    gap: 4,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 4,
    elevation: 2,
  },
  streakFire: { fontSize: 16 },
  streakCount: { fontSize: 16, fontWeight: '800', color: Colors.streakFire },

  card: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 18,
    gap: 10,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  cardLabel: { fontSize: 13, fontWeight: '600', color: Colors.textSecondary },
  totalXP: { fontSize: 12, color: Colors.textMuted },

  streakCard: {
    backgroundColor: Colors.white,
    borderRadius: 16,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.06,
    shadowRadius: 6,
    elevation: 2,
  },
  streakIcon: {
    width: 48,
    height: 48,
    borderRadius: 24,
    backgroundColor: '#FFF7ED',
    justifyContent: 'center',
    alignItems: 'center',
  },
  streakInfo: { flex: 1 },
  streakTitle: { fontSize: 14, fontWeight: '700', color: Colors.textPrimary },
  streakDesc: { fontSize: 12, color: Colors.textSecondary, marginTop: 2 },
  streakNumber: { fontSize: 28, fontWeight: '800', color: Colors.streakFire },

  challengeCard: {
    backgroundColor: Colors.primary,
    borderRadius: 16,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  challengeLeft: { flexDirection: 'row', alignItems: 'center', gap: 12, flex: 1 },
  challengeText: { flex: 1 },
  challengeTitle: { fontSize: 15, fontWeight: '700', color: Colors.white },
  challengeDesc: { fontSize: 12, color: 'rgba(255,255,255,0.8)', marginTop: 2 },
  challengeBtn: {
    backgroundColor: Colors.white,
    paddingHorizontal: 18,
    paddingVertical: 9,
    borderRadius: 10,
  },
  challengeBtnText: { fontSize: 14, fontWeight: '700', color: Colors.primary },

  sectionTitle: { fontSize: 16, fontWeight: '700', color: Colors.textPrimary },
  examGrid: { gap: 12 },
  examCard: {
    backgroundColor: Colors.white,
    borderRadius: 14,
    padding: 16,
    gap: 8,
    borderWidth: 1.5,
    shadowColor: Colors.black,
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.04,
    shadowRadius: 4,
    elevation: 1,
  },
  examBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 6,
  },
  examBadgeText: { fontSize: 12, fontWeight: '800', color: Colors.white, letterSpacing: 0.5 },
  examDesc: { fontSize: 13, color: Colors.textSecondary },
  examFooter: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  examSubjectCount: { fontSize: 12, color: Colors.textMuted },

  tipCard: {
    backgroundColor: '#FFFBEB',
    borderRadius: 12,
    padding: 14,
    flexDirection: 'row',
    gap: 10,
    alignItems: 'flex-start',
    borderWidth: 1,
    borderColor: '#FDE68A',
  },
  tipText: { flex: 1, fontSize: 12, color: Colors.gray700, lineHeight: 18 },
});
