import 'react-native-gesture-handler';
import React, { useEffect, useRef } from 'react';
import { AppState, type AppStateStatus } from 'react-native';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import NetInfo from '@react-native-community/netinfo';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { RootNavigator } from './src/navigation/RootNavigator';
import { useStore } from './src/store';
import { getDatabase } from './src/db/database';
import { SyncManager } from './src/services/SyncManager';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5,   // 5 minutes
      retry: 2,
      networkMode: 'offlineFirst',
    },
  },
});

function AppInner() {
  const setOnline = useStore((s) => s.setOnline);

  useEffect(() => {
    // Initialize SQLite on app start
    getDatabase().catch(console.error);

    // Monitor network status
    const unsubscribe = NetInfo.addEventListener((state) => {
      setOnline(state.isConnected ?? false);
    });

    return unsubscribe;
  }, [setOnline]);

  useSyncTriggers();

  return <RootNavigator />;
}

/**
 * Drive SyncManager from online and AppState transitions.
 * - Online false → true: sync.
 * - AppState background/inactive → active: sync (if online + userId).
 */
function useSyncTriggers() {
  const userId = useStore((s) => s.userId);
  const isOnline = useStore((s) => s.isOnline);
  const prevOnlineRef = useRef<boolean>(isOnline);
  const prevAppStateRef = useRef<AppStateStatus>(AppState.currentState);

  // Reconnect-triggered sync
  useEffect(() => {
    const prev = prevOnlineRef.current;
    prevOnlineRef.current = isOnline;
    if (!prev && isOnline && userId) {
      void SyncManager.syncAll(userId);
    }
  }, [isOnline, userId]);

  // Foreground-triggered sync
  useEffect(() => {
    const sub = AppState.addEventListener('change', (state) => {
      const prev = prevAppStateRef.current;
      prevAppStateRef.current = state;
      if (prev !== 'active' && state === 'active' && isOnline && userId) {
        void SyncManager.syncAll(userId);
      }
    });
    return () => sub.remove();
  }, [isOnline, userId]);
}

export default function App() {
  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <SafeAreaProvider>
        <QueryClientProvider client={queryClient}>
          <AppInner />
        </QueryClientProvider>
      </SafeAreaProvider>
    </GestureHandlerRootView>
  );
}
