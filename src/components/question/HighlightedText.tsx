// HighlightedText
// Render teks dengan beberapa kata kunci di-highlight (warna + bold).
// Dipakai untuk TKP buzzword scan: kata "Pelayanan Publik / Profesionalisme /
// Jejaring / Anti Radikalisme / Teknologi Informasi / Sosial Budaya" di-tandai
// supaya mata bisa langsung lompat ke nilai inti tanpa baca lengkap (sesuai
// strategi peripheral scan dari TNI Efektif.md).

import React from 'react';
import { Text, type TextStyle, type StyleProp } from 'react-native';
import { Colors } from '../../constants/colors';

interface Props {
  text: string;
  keywords: string[];
  style?: StyleProp<TextStyle>;
  highlightColor?: string;
  highlightWeight?: TextStyle['fontWeight'];
}

/**
 * Kata kunci TKP — buzzwords yang dokumen TNI Efektif.md sebut sebagai
 * "beacon keywords" yang menandai nilai-nilai birokrasi profesional.
 */
export const TKP_BUZZWORDS = [
  'Pelayanan Publik',
  'Pelayanan',
  'Profesionalisme',
  'Profesional',
  'Integritas',
  'Jejaring Kerja',
  'Jejaring',
  'Kolaborasi',
  'Kolaboratif',
  'Sosial Budaya',
  'Teknologi Informasi',
  'Anti Radikalisme',
  'Radikalisme',
  'NKRI',
  'Bela Negara',
];

export function HighlightedText({
  text,
  keywords,
  style,
  highlightColor = Colors.primary,
  highlightWeight = '800',
}: Props) {
  if (keywords.length === 0) {
    return <Text style={style}>{text}</Text>;
  }

  // Sort keywords by length desc — match longer phrases first ("Pelayanan Publik"
  // sebelum "Pelayanan") supaya tidak salah pisah.
  const sorted = [...keywords].sort((a, b) => b.length - a.length);
  const pattern = new RegExp(
    `(${sorted.map((k) => escapeRegex(k)).join('|')})`,
    'gi'
  );

  const parts = text.split(pattern);
  return (
    <Text style={style}>
      {parts.map((part, i) => {
        const isMatch =
          sorted.some((k) => k.toLowerCase() === part.toLowerCase());
        if (!isMatch) return part;
        return (
          <Text
            key={i}
            style={{
              color: highlightColor,
              fontWeight: highlightWeight,
              backgroundColor: highlightColor + '15',
            }}
          >
            {part}
          </Text>
        );
      })}
    </Text>
  );
}

function escapeRegex(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}
