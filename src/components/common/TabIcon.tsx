import React from 'react';
import { View, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';

type TabName = 'Beranda' | 'Latihan' | 'Tryout' | 'Progress' | 'Profil';

const ICONS: Record<TabName, { active: string; inactive: string }> = {
  Beranda: { active: 'home', inactive: 'home-outline' },
  Latihan: { active: 'book', inactive: 'book-outline' },
  Tryout: { active: 'timer', inactive: 'timer-outline' },
  Progress: { active: 'bar-chart', inactive: 'bar-chart-outline' },
  Profil: { active: 'person', inactive: 'person-outline' },
};

interface TabIconProps {
  name: TabName;
  focused: boolean;
  color: string;
}

export function TabIcon({ name, focused, color }: TabIconProps) {
  const icons = ICONS[name] ?? { active: 'ellipse', inactive: 'ellipse-outline' };
  const iconName = focused ? icons.active : icons.inactive;
  return <Ionicons name={iconName as any} size={22} color={color} />;
}
