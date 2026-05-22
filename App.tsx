import 'react-native-gesture-handler';
import React, { useEffect } from 'react';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import NetInfo from '@react-native-community/netinfo';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { RootNavigator } from './src/navigation/RootNavigator';
import { useStore } from './src/store';
import { getDatabase } from './src/db/database';

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
  const { setOnline } = useStore();

  useEffect(() => {
    // Initialize SQLite on app start
    getDatabase().catch(console.error);

    // Monitor network status
    const unsubscribe = NetInfo.addEventListener((state) => {
      setOnline(state.isConnected ?? false);
    });

    return unsubscribe;
  }, []);

  return <RootNavigator />;
}

export default function App() {
  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <QueryClientProvider client={queryClient}>
        <AppInner />
      </QueryClientProvider>
    </GestureHandlerRootView>
  );
}
