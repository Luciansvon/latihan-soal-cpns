// NotificationService
// Daily reminder lokal pakai expo-notifications. Tidak ada server push.
// User opt-in via Settings (toggle). Schedule = jam 19:00 lokal tiap hari.

import * as Notifications from 'expo-notifications';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Platform } from 'react-native';

const KEY_ENABLED = 'notif:daily:enabled';
const KEY_ID = 'notif:daily:id';

const DEFAULT_HOUR = 19; // 7 PM
const DEFAULT_MINUTE = 0;

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
    shouldShowBanner: true,
    shouldShowList: true,
  }),
});

export const NotificationService = {
  async isEnabled(): Promise<boolean> {
    const v = await AsyncStorage.getItem(KEY_ENABLED);
    return v === '1';
  },

  /**
   * Request OS permission, schedule a daily reminder at the given hour/minute.
   * Persists the schedule's id so we can cancel later.
   */
  async enableDailyReminder(hour = DEFAULT_HOUR, minute = DEFAULT_MINUTE): Promise<void> {
    if (Platform.OS === 'web') {
      // Web has no expo-notifications scheduling.
      await AsyncStorage.setItem(KEY_ENABLED, '1');
      return;
    }
    const perm = await Notifications.getPermissionsAsync();
    let granted = perm.status === 'granted';
    if (!granted) {
      const req = await Notifications.requestPermissionsAsync();
      granted = req.status === 'granted';
    }
    if (!granted) {
      throw new Error('Izin notifikasi ditolak.');
    }

    // Cancel any previous schedule before booking a new one
    await this.disableDailyReminder();

    const id = await Notifications.scheduleNotificationAsync({
      content: {
        title: 'Saatnya latihan! 🔥',
        body: 'Jaga streak hari ini — 10 menit latihan sudah cukup.',
      },
      trigger: {
        type: Notifications.SchedulableTriggerInputTypes.DAILY,
        hour,
        minute,
      } as Notifications.DailyTriggerInput,
    });

    await AsyncStorage.setItem(KEY_ID, id);
    await AsyncStorage.setItem(KEY_ENABLED, '1');
  },

  async disableDailyReminder(): Promise<void> {
    const id = await AsyncStorage.getItem(KEY_ID);
    if (id) {
      try {
        await Notifications.cancelScheduledNotificationAsync(id);
      } catch {
        // ignore
      }
      await AsyncStorage.removeItem(KEY_ID);
    }
    await AsyncStorage.setItem(KEY_ENABLED, '0');
  },

  async toggle(enabled: boolean): Promise<void> {
    if (enabled) await this.enableDailyReminder();
    else await this.disableDailyReminder();
  },
};
