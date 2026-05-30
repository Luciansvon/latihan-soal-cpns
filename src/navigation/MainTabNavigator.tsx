import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Platform } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { Colors, CognitiveCalm } from '../constants/colors';
import type { MainTabParams, LatihanStackParams, TryoutStackParams, ProgressStackParams, ProfilStackParams } from './types';

// Screens - Beranda
import { BerandaScreen } from '../screens/beranda/BerandaScreen';

// Screens - Latihan
import { LatihanHomeScreen } from '../screens/latihan/LatihanHomeScreen';
import { CategoryListScreen } from '../screens/latihan/CategoryListScreen';
import { SubtopicListScreen } from '../screens/latihan/SubtopicListScreen';
import { PracticeSessionScreen } from '../screens/latihan/PracticeSessionScreen';
import { SessionResultScreen } from '../screens/latihan/SessionResultScreen';
import { SkimTrainerScreen } from '../screens/latihan/SkimTrainerScreen';

// Screens - Tryout
import { TryoutListScreen } from '../screens/tryout/TryoutListScreen';
import { TryoutDetailScreen } from '../screens/tryout/TryoutDetailScreen';
import { TryoutSessionScreen } from '../screens/tryout/TryoutSessionScreen';
import { TryoutResultScreen } from '../screens/tryout/TryoutResultScreen';

// Screens - Progress
import { ProgressDashboardScreen } from '../screens/progress/ProgressDashboardScreen';
import { HistoryListScreen } from '../screens/progress/HistoryListScreen';
import { SessionDetailScreen } from '../screens/progress/SessionDetailScreen';

// Screens - Profil
import { ProfileScreen } from '../screens/profil/ProfileScreen';
import { DownloadManagerScreen } from '../screens/profil/DownloadManagerScreen';
import { SettingsScreen } from '../screens/profil/SettingsScreen';
import { AchievementScreen } from '../screens/profil/AchievementScreen';

// Tab icons
import { TabIcon } from '../components/common/TabIcon';

const Tab = createBottomTabNavigator<MainTabParams>();
const LatihanStack = createNativeStackNavigator<LatihanStackParams>();
const TryoutStack = createNativeStackNavigator<TryoutStackParams>();
const ProgressStack = createNativeStackNavigator<ProgressStackParams>();
const ProfilStack = createNativeStackNavigator<ProfilStackParams>();

function LatihanNavigator() {
  return (
    <LatihanStack.Navigator screenOptions={{ headerShown: false }}>
      <LatihanStack.Screen name="LatihanHome" component={LatihanHomeScreen} />
      <LatihanStack.Screen name="CategoryList" component={CategoryListScreen} />
      <LatihanStack.Screen name="SubtopicList" component={SubtopicListScreen} />
      <LatihanStack.Screen name="PracticeSession" component={PracticeSessionScreen} />
      <LatihanStack.Screen name="SessionResult" component={SessionResultScreen} />
      <LatihanStack.Screen name="SkimTrainer" component={SkimTrainerScreen} />
    </LatihanStack.Navigator>
  );
}

function TryoutNavigator() {
  return (
    <TryoutStack.Navigator screenOptions={{ headerShown: false }}>
      <TryoutStack.Screen name="TryoutList" component={TryoutListScreen} />
      <TryoutStack.Screen name="TryoutDetail" component={TryoutDetailScreen} />
      <TryoutStack.Screen name="TryoutSession" component={TryoutSessionScreen} options={{ gestureEnabled: false }} />
      <TryoutStack.Screen name="TryoutResult" component={TryoutResultScreen} />
    </TryoutStack.Navigator>
  );
}

function ProgressNavigator() {
  return (
    <ProgressStack.Navigator screenOptions={{ headerShown: false }}>
      <ProgressStack.Screen name="ProgressDashboard" component={ProgressDashboardScreen} />
      <ProgressStack.Screen name="HistoryList" component={HistoryListScreen} />
      <ProgressStack.Screen name="SessionDetail" component={SessionDetailScreen} />
    </ProgressStack.Navigator>
  );
}

function ProfilNavigator() {
  return (
    <ProfilStack.Navigator screenOptions={{ headerShown: false }}>
      <ProfilStack.Screen name="Profile" component={ProfileScreen} />
      <ProfilStack.Screen name="Achievement" component={AchievementScreen} />
      <ProfilStack.Screen name="DownloadManager" component={DownloadManagerScreen} />
      <ProfilStack.Screen name="Settings" component={SettingsScreen} />
    </ProfilStack.Navigator>
  );
}

export function MainTabNavigator() {
  const insets = useSafeAreaInsets();
  // Tambahin inset bottom (gesture navigation bar) ke padding & height tab bar
  // supaya gak ketutupan tombol home/back Android.
  const bottomInset = Platform.OS === 'ios' ? Math.max(insets.bottom, 20) : insets.bottom;
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown: false,
        tabBarIcon: ({ focused, color }) => (
          <TabIcon name={route.name as any} focused={focused} color={color} />
        ),
        tabBarActiveTintColor: CognitiveCalm.primary,
        tabBarInactiveTintColor: Colors.gray400,
        tabBarStyle: {
          backgroundColor: Colors.white,
          borderTopColor: Colors.border,
          borderTopWidth: 1,
          paddingBottom: bottomInset + 8,
          paddingTop: 8,
          height: 65 + bottomInset,
        },
        tabBarLabelStyle: {
          fontSize: 11,
          fontWeight: '600',
        },
      })}
    >
      <Tab.Screen name="Beranda" component={BerandaScreen} options={{ tabBarLabel: 'Beranda' }} />
      <Tab.Screen name="Latihan" component={LatihanNavigator} options={{ tabBarLabel: 'Latihan' }} />
      <Tab.Screen name="Tryout" component={TryoutNavigator} options={{ tabBarLabel: 'Tryout' }} />
      <Tab.Screen name="Progress" component={ProgressNavigator} options={{ tabBarLabel: 'Progress' }} />
      <Tab.Screen name="Profil" component={ProfilNavigator} options={{ tabBarLabel: 'Profil' }} />
    </Tab.Navigator>
  );
}
