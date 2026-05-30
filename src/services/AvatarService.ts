import * as ImagePicker from 'expo-image-picker';
import { Alert } from 'react-native';
import { supabase } from './supabase';
import { useStore } from '../store';

// expo-file-system v18 changed default export; use legacy import biar API
// readAsStringAsync stabil di SDK 56.
import * as FileSystem from 'expo-file-system/legacy';

const BUCKET = 'avatars';

interface PickResult {
  uri: string;
  mimeType: string;
}

async function pickFromGallery(): Promise<PickResult | null> {
  const perm = await ImagePicker.requestMediaLibraryPermissionsAsync();
  if (!perm.granted) {
    Alert.alert(
      'Izin diperlukan',
      'Beri akses galeri di Setelan untuk mengganti foto profil.',
    );
    return null;
  }

  const result = await ImagePicker.launchImageLibraryAsync({
    mediaTypes: ImagePicker.MediaTypeOptions.Images,
    allowsEditing: true,
    aspect: [1, 1],
    quality: 0.7,
    selectionLimit: 1,
  });

  if (result.canceled || !result.assets?.[0]) return null;
  const asset = result.assets[0];
  return {
    uri: asset.uri,
    mimeType: asset.mimeType ?? 'image/jpeg',
  };
}

async function pickFromCamera(): Promise<PickResult | null> {
  const perm = await ImagePicker.requestCameraPermissionsAsync();
  if (!perm.granted) {
    Alert.alert(
      'Izin diperlukan',
      'Beri akses kamera di Setelan untuk mengambil foto profil.',
    );
    return null;
  }

  const result = await ImagePicker.launchCameraAsync({
    allowsEditing: true,
    aspect: [1, 1],
    quality: 0.7,
  });

  if (result.canceled || !result.assets?.[0]) return null;
  const asset = result.assets[0];
  return {
    uri: asset.uri,
    mimeType: asset.mimeType ?? 'image/jpeg',
  };
}

function showPickerSheet(): Promise<PickResult | null> {
  return new Promise((resolve) => {
    Alert.alert('Ganti Foto Profil', 'Pilih sumber gambar', [
      { text: 'Batal', style: 'cancel', onPress: () => resolve(null) },
      { text: 'Galeri', onPress: () => resolve(pickFromGallery()) },
      { text: 'Kamera', onPress: () => resolve(pickFromCamera()) },
    ]);
  });
}

/**
 * Upload file ke Supabase Storage `avatars/{userId}/avatar.{ext}`, dapat
 * public URL + cache-buster query, simpan ke profiles.avatar_url, update
 * profile di Zustand store.
 */
async function uploadAndPersist(
  userId: string,
  pick: PickResult,
): Promise<string> {
  // Read file as base64, kemudian decode ke ArrayBuffer untuk upload.
  // supabase-js native fetch tidak handle file:// URI di React Native;
  // base64 → ArrayBuffer adalah pattern Supabase resmi (lihat docs RN).
  const base64 = await FileSystem.readAsStringAsync(pick.uri, {
    encoding: FileSystem.EncodingType.Base64,
  });
  const bytes = decodeBase64(base64);

  // Tentukan ekstensi dari mimeType; fallback ke jpg.
  const ext = pick.mimeType.split('/')[1]?.split('+')[0] ?? 'jpg';
  const path = `${userId}/avatar.${ext}`;

  const { error: upErr } = await supabase.storage
    .from(BUCKET)
    .upload(path, bytes, {
      contentType: pick.mimeType,
      upsert: true,
    });
  if (upErr) throw new Error(`Upload gagal: ${upErr.message}`);

  const { data: pub } = supabase.storage.from(BUCKET).getPublicUrl(path);
  // Bust CDN cache supaya gambar baru langsung tampil.
  const publicUrl = `${pub.publicUrl}?t=${Date.now()}`;

  const { error: dbErr } = await supabase
    .from('profiles')
    .update({ avatar_url: publicUrl })
    .eq('id', userId);
  if (dbErr) throw new Error(`Simpan profil gagal: ${dbErr.message}`);

  const currentProfile = useStore.getState().profile;
  if (currentProfile && currentProfile.id === userId) {
    useStore.getState().setProfile({ ...currentProfile, avatarUrl: publicUrl });
  }

  return publicUrl;
}

// Minimal base64 → Uint8Array tanpa polyfill atom. Cocok untuk image upload.
function decodeBase64(b64: string): Uint8Array {
  const binary = globalThis.atob ? globalThis.atob(b64) : nodeAtobFallback(b64);
  const len = binary.length;
  const out = new Uint8Array(len);
  for (let i = 0; i < len; i++) out[i] = binary.charCodeAt(i);
  return out;
}

// atob fallback (RN biasanya punya, tapi safety net untuk Hermes lama).
function nodeAtobFallback(b64: string): string {
  const chars =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  let str = b64.replace(/=+$/, '');
  let output = '';
  for (
    let bc = 0, bs = 0, buffer: number, i = 0;
    (buffer = str.charCodeAt(i++));
    ~buffer && ((bs = bc % 4 ? bs * 64 + buffer : buffer), bc++ % 4)
      ? (output += String.fromCharCode(255 & (bs >> ((-2 * bc) & 6))))
      : 0
  ) {
    buffer = chars.indexOf(String.fromCharCode(buffer));
  }
  return output;
}

export const AvatarService = {
  /**
   * Trigger flow: tampilkan sheet pilih sumber → pick → upload → persist.
   * Return URL final atau null kalau user batal / belum ada userId.
   */
  async changeAvatar(): Promise<string | null> {
    const userId = useStore.getState().userId;
    if (!userId) return null;

    const pick = await showPickerSheet();
    if (!pick) return null;

    try {
      return await uploadAndPersist(userId, pick);
    } catch (e: any) {
      Alert.alert('Gagal ganti foto', e?.message ?? 'Coba lagi nanti.');
      return null;
    }
  },
};
