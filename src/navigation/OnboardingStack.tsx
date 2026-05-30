import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import type { OnboardingStackParams } from './types';
import { OnboardingScreen } from '../screens/onboarding/OnboardingScreen';
import { LearningStyleQuizScreen } from '../screens/onboarding/LearningStyleQuizScreen';
import { HasilAnalisisScreen } from '../screens/onboarding/HasilAnalisisScreen';

const Stack = createNativeStackNavigator<OnboardingStackParams>();

export function OnboardingStack() {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false, animation: 'slide_from_right' }}>
      <Stack.Screen name="Onboarding" component={OnboardingScreen} />
      <Stack.Screen name="LearningStyleQuiz" component={LearningStyleQuizScreen} />
      <Stack.Screen name="HasilAnalisis" component={HasilAnalisisScreen} />
    </Stack.Navigator>
  );
}
