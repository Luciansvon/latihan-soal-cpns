import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, StatusBar, Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Colors } from '../../constants/colors';
import type { AuthScreenProps } from '../../navigation/types';

export function WelcomeScreen({ navigation }: AuthScreenProps<'Welcome'>) {
  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="dark-content" backgroundColor={Colors.bgPrimary} />

      {/* Hero section */}
      <View style={styles.hero}>
        <Image
          source={require('../../../assets/wirago-logo.png')}
          style={styles.logoImage}
          resizeMode="contain"
        />
        <Text style={styles.appName}>Wirago Academy</Text>
        <Text style={styles.appSubtitle}>CPNS · TNI · Polri</Text>
        <Text style={styles.tagline}>
          Persiapkan dirimu dengan cerdas.{'\n'}Belajar sesuai cara otakmu bekerja.
        </Text>
      </View>

      {/* Features */}
      <View style={styles.features}>
        {FEATURES.map((f) => (
          <View key={f.label} style={styles.featureRow}>
            <Text style={styles.featureIcon}>{f.icon}</Text>
            <Text style={styles.featureText}>{f.label}</Text>
          </View>
        ))}
      </View>

      {/* CTA */}
      <View style={styles.cta}>
        <TouchableOpacity
          style={styles.primaryBtn}
          onPress={() => navigation.navigate('Register')}
          activeOpacity={0.85}
        >
          <Text style={styles.primaryBtnText}>Mulai Belajar</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.secondaryBtn}
          onPress={() => navigation.navigate('Login')}
          activeOpacity={0.7}
        >
          <Text style={styles.secondaryBtnText}>Sudah punya akun? Masuk</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const FEATURES = [
  { icon: '🧠', label: 'Analisis gaya belajar personal' },
  { icon: '📚', label: 'Bank soal CPNS, TNI, dan Polri' },
  { icon: '⏱', label: 'Simulasi tryout seperti ujian asli' },
  { icon: '📶', label: 'Bisa belajar offline' },
  { icon: '🤖', label: 'AI tutor adaptif' },
];

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.bgPrimary,
    paddingHorizontal: 28,
  },
  hero: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 20,
  },
  logoImage: {
    width: 220,
    height: 120,
    marginBottom: 12,
  },
  appName: {
    fontSize: 30,
    fontWeight: '800',
    color: Colors.textPrimary,
    letterSpacing: -0.5,
  },
  appSubtitle: {
    fontSize: 15,
    fontWeight: '600',
    color: Colors.primary,
    marginTop: 4,
    letterSpacing: 1.5,
    textTransform: 'uppercase',
  },
  tagline: {
    fontSize: 15,
    color: Colors.textSecondary,
    textAlign: 'center',
    marginTop: 16,
    lineHeight: 22,
  },
  features: {
    paddingVertical: 24,
    gap: 10,
  },
  featureRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  featureIcon: {
    fontSize: 20,
    width: 28,
    textAlign: 'center',
  },
  featureText: {
    fontSize: 14,
    color: Colors.textSecondary,
    fontWeight: '500',
  },
  cta: {
    paddingBottom: 16,
    gap: 12,
  },
  primaryBtn: {
    backgroundColor: Colors.primary,
    paddingVertical: 16,
    borderRadius: 14,
    alignItems: 'center',
  },
  primaryBtnText: {
    color: Colors.white,
    fontSize: 16,
    fontWeight: '700',
  },
  secondaryBtn: {
    paddingVertical: 12,
    alignItems: 'center',
  },
  secondaryBtnText: {
    color: Colors.textSecondary,
    fontSize: 14,
    fontWeight: '500',
  },
});
