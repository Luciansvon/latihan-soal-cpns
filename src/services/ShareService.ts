// ShareService — share hasil sesi sebagai teks via system share sheet,
// dengan shortcut langsung ke WhatsApp jika memungkinkan.
//
// React Native built-in `Share` sudah cukup untuk semua platform. WhatsApp
// dipisah supaya bisa langsung buka chat picker.

import { Share, Linking, Platform } from 'react-native';
import type { PracticeSession } from '../types/session.types';
import { getScorePercentage } from '../utils/ScoreCalculator';

export const ShareService = {
  /**
   * Build share text dari hasil sesi.
   */
  buildSessionMessage(session: PracticeSession): string {
    const pct = getScorePercentage(session.totalScore, session.maxScore);
    const isTryout = session.sessionType === 'TRYOUT';
    const label = isTryout ? 'tryout' : 'latihan';
    const subject = session.subject ? ` ${session.subject}` : '';
    const accuracy =
      session.answeredCount > 0
        ? Math.round((session.correctCount / session.answeredCount) * 100)
        : 0;

    return [
      `Habis ${label}${subject} di LatihanSoal — skor ${session.totalScore}/${session.maxScore} (${pct}%).`,
      `Benar ${session.correctCount} dari ${session.answeredCount} soal · akurasi ${accuracy}%.`,
      'Yuk siap-siap CPNS bareng! 💪',
    ].join('\n');
  },

  /**
   * Buka system share sheet. Di Android share = sheet pilihan app;
   * di iOS share = Activity View.
   */
  async share(message: string): Promise<void> {
    await Share.share({ message });
  },

  /**
   * Buka WhatsApp langsung dengan pesan ter-prefill. Fallback ke share sheet
   * kalau WhatsApp belum terpasang.
   */
  async shareToWhatsApp(message: string): Promise<void> {
    const url = `whatsapp://send?text=${encodeURIComponent(message)}`;
    const can = await Linking.canOpenURL(url).catch(() => false);
    if (can) {
      await Linking.openURL(url);
      return;
    }
    // Fallback: wa.me works in browser; on iOS without WA it goes to wa.me web flow.
    const webUrl = `https://wa.me/?text=${encodeURIComponent(message)}`;
    const canWeb = await Linking.canOpenURL(webUrl).catch(() => false);
    if (canWeb) {
      await Linking.openURL(webUrl);
      return;
    }
    // Final fallback: native share sheet
    await this.share(message);
  },
};

// Tiny platform hint export (unused logic suppression friendly)
void Platform;
