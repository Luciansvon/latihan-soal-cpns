import React from 'react';
import { View, Text, StyleSheet, SafeAreaView, ScrollView, TouchableOpacity, Alert } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { supabase } from '../../services/supabase';
import { getDatabase } from '../../db/database';
import type { ProfilScreenProps } from '../../navigation/types';

export function SettingsScreen({ navigation }: ProfilScreenProps<'Settings'>) {
  async function handleClearLocalData() {
    Alert.alert(
      'Hapus Data Lokal',
      'Ini akan menghapus semua soal yang didownload dan riwayat offline. Progress yang sudah tersync ke server tetap aman. Lanjutkan?',
      [
        { text: 'Batal', style: 'cancel' },
        {
          text: 'Hapus',
          style: 'destructive',
          onPress: async () => {
            const db = await getDatabase();
            await db.execAsync(`
              DELETE FROM local_questions;
              DELETE FROM local_question_packs;
              DELETE FROM download_queue;
            `);
            Alert.alert('Selesai', 'Data lokal berhasil dihapus.');
          },
        },
      ]
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <TouchableOpacity onPress={() => navigation.goBack()} style={styles.backBtn}>
          <Ionicons name="arrow-back" size={22} color={Colors.textPrimary} />
        </TouchableOpacity>
        <Text style={styles.title}>Pengaturan</Text>
        <View style={{ width: 40 }} />
      </View>
      <ScrollView contentContainerStyle={styles.scroll}>

        <View style={styles.section}>
          <Text style={styles.sectionLabel}>AKUN</Text>
          <TouchableOpacity style={styles.row} onPress={() => supabase.auth.signOut()}>
            <Ionicons name="log-out-outline" size={20} color={Colors.error} />
            <Text style={[styles.rowLabel, { color: Colors.error }]}>Keluar dari Akun</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionLabel}>DATA</Text>
          <TouchableOpacity style={styles.row} onPress={handleClearLocalData}>
            <Ionicons name="trash-outline" size={20} color={Colors.warning} />
            <Text style={[styles.rowLabel, { color: Colors.warning }]}>Hapus Data Lokal (Soal & Cache)</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionLabel}>TENTANG</Text>
          <View style={styles.row}>
            <Ionicons name="information-circle-outline" size={20} color={Colors.gray500} />
            <Text style={styles.rowLabel}>Versi Aplikasi</Text>
            <Text style={styles.rowValue}>1.0.0</Text>
          </View>
          <View style={[styles.row, { borderBottomWidth: 0 }]}>
            <Ionicons name="book-outline" size={20} color={Colors.gray500} />
            <Text style={styles.rowLabel}>Referensi Ilmiah Gaya Belajar</Text>
          </View>
          <Text style={styles.scienceNote}>
            VARK Model: Fleming & Mills (1992){'\n'}
            Honey & Mumford Learning Styles (1982)
          </Text>
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgSecondary },
  header: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 16, paddingVertical: 12, borderBottomWidth: 1, borderBottomColor: Colors.border, backgroundColor: Colors.white },
  backBtn: { width: 40, height: 40, justifyContent: 'center' },
  title: { flex: 1, fontSize: 18, fontWeight: '700', color: Colors.textPrimary, textAlign: 'center' },
  scroll: { flexGrow: 1, paddingBottom: 32 },
  section: { backgroundColor: Colors.white, marginHorizontal: 16, marginTop: 20, borderRadius: 16, borderWidth: 1, borderColor: Colors.border, overflow: 'hidden' },
  sectionLabel: { fontSize: 11, fontWeight: '700', color: Colors.textMuted, letterSpacing: 1, textTransform: 'uppercase', paddingHorizontal: 16, paddingTop: 12, paddingBottom: 4 },
  row: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 16, paddingVertical: 14, gap: 12, borderBottomWidth: 1, borderBottomColor: Colors.border },
  rowLabel: { flex: 1, fontSize: 15, color: Colors.textPrimary, fontWeight: '500' },
  rowValue: { fontSize: 14, color: Colors.textMuted },
  scienceNote: { fontSize: 12, color: Colors.textMuted, paddingHorizontal: 16, paddingBottom: 14, lineHeight: 18 },
});
