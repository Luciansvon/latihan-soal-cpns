// AITutorChat — chat persona "Pak Guru" yang panggil Edge Function ai-tutor (mode chat).
// Layout simple: list bubble + composer di bawah. Tujuan: bukan ChatGPT clone,
// tutor fokus ujian CPNS/TNI/Polri.

import React, { useCallback, useEffect, useRef, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  ActivityIndicator,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Colors } from '../../constants/colors';
import { AIService, AIError, type AIChatMessage } from '../../services/AIService';
import { useStore } from '../../store';
import type { ExamType } from '../../types/exam.types';

interface Props {
  examType?: ExamType;
  accentColor?: string;
}

interface UIMessage extends AIChatMessage {
  id: string;
  pending?: boolean;
  error?: string;
}

let msgIdCounter = 0;
const nextId = () => `m_${++msgIdCounter}`;

const GREETING: UIMessage = {
  id: 'm_0',
  role: 'assistant',
  content:
    'Halo! Saya Pak Guru, tutor virtualmu. Tanyakan konsep yang masih bingung, atau minta saya buatkan ringkasan strategi untuk subtes tertentu.',
};

export function AITutorChat({ examType = 'CPNS', accentColor = Colors.primary }: Props) {
  const isOnline = useStore((s) => s.isOnline);
  const profile = useStore((s) => s.profile);

  const [messages, setMessages] = useState<UIMessage[]>([GREETING]);
  const [input, setInput] = useState('');
  const [sending, setSending] = useState(false);
  const [usage, setUsage] = useState<{ used: number; limit: number } | null>(null);
  const scrollRef = useRef<ScrollView>(null);

  useEffect(() => {
    // Scroll to bottom when messages change
    setTimeout(() => scrollRef.current?.scrollToEnd({ animated: true }), 50);
  }, [messages]);

  const send = useCallback(async () => {
    const text = input.trim();
    if (!text || sending) return;

    const userMsg: UIMessage = { id: nextId(), role: 'user', content: text };
    const placeholder: UIMessage = { id: nextId(), role: 'assistant', content: '', pending: true };
    setMessages((prev) => [...prev, userMsg, placeholder]);
    setInput('');
    setSending(true);

    try {
      // Build history of REAL messages (no pending) to send to backend
      const history: AIChatMessage[] = messages
        .filter((m) => !m.pending && !m.error)
        .map(({ role, content }) => ({ role, content }));
      history.push({ role: 'user', content: text });

      const res = await AIService.chat({ examType, messages: history });
      setUsage({ used: res.usedToday, limit: res.dailyLimit });

      setMessages((prev) =>
        prev.map((m) => (m.id === placeholder.id ? { ...m, content: res.content, pending: false } : m))
      );
    } catch (e: any) {
      const msg =
        e instanceof AIError && e.rateLimited
          ? e.rateLimited.message
          : e?.message ?? 'Gagal menghubungi tutor AI.';
      if (e instanceof AIError && e.rateLimited) {
        setUsage({ used: e.rateLimited.usedToday, limit: e.rateLimited.dailyLimit });
      }
      setMessages((prev) =>
        prev.map((m) =>
          m.id === placeholder.id ? { ...m, content: '', pending: false, error: msg } : m
        )
      );
    } finally {
      setSending(false);
    }
  }, [input, sending, messages, examType]);

  const styleHint = profile?.learningStyle
    ? 'Profil gaya belajar terdeteksi — Pak Guru akan sesuaikan penjelasan.'
    : 'Profil gaya belajar belum ada. Jawaban memakai pendekatan netral.';

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      keyboardVerticalOffset={Platform.OS === 'ios' ? 80 : 0}
    >
      <View style={styles.header}>
        <View style={[styles.avatar, { backgroundColor: accentColor }]}>
          <Ionicons name="school" size={18} color={Colors.white} />
        </View>
        <View style={{ flex: 1 }}>
          <Text style={styles.headerTitle}>Pak Guru</Text>
          <Text style={styles.headerSub}>{styleHint}</Text>
        </View>
        {usage ? (
          <Text style={styles.usage}>
            {usage.used}/{usage.limit}
          </Text>
        ) : null}
      </View>

      <ScrollView
        ref={scrollRef}
        contentContainerStyle={styles.scroll}
        keyboardShouldPersistTaps="handled"
      >
        {messages.map((m) => (
          <Bubble key={m.id} message={m} accentColor={accentColor} />
        ))}
      </ScrollView>

      {!isOnline ? (
        <View style={styles.offlineBar}>
          <Ionicons name="cloud-offline-outline" size={14} color={Colors.warning} />
          <Text style={styles.offlineText}>Mode offline. Tutor AI butuh internet.</Text>
        </View>
      ) : null}

      <View style={styles.composer}>
        <TextInput
          style={styles.input}
          value={input}
          onChangeText={setInput}
          placeholder="Tanya apa saja… (mis. 'jelaskan silogisme')"
          placeholderTextColor={Colors.textMuted}
          editable={!sending && isOnline}
          multiline
          maxLength={500}
        />
        <TouchableOpacity
          style={[
            styles.sendBtn,
            { backgroundColor: accentColor },
            (!input.trim() || sending || !isOnline) && styles.sendBtnDisabled,
          ]}
          disabled={!input.trim() || sending || !isOnline}
          onPress={send}
        >
          {sending ? (
            <ActivityIndicator color={Colors.white} size="small" />
          ) : (
            <Ionicons name="send" size={18} color={Colors.white} />
          )}
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
}

function Bubble({ message, accentColor }: { message: UIMessage; accentColor: string }) {
  const isUser = message.role === 'user';
  return (
    <View
      style={[
        styles.bubbleRow,
        isUser ? styles.bubbleRowUser : styles.bubbleRowAssistant,
      ]}
    >
      <View
        style={[
          styles.bubble,
          isUser
            ? { backgroundColor: accentColor, borderTopRightRadius: 4 }
            : { backgroundColor: Colors.white, borderTopLeftRadius: 4, borderWidth: 1, borderColor: Colors.border },
        ]}
      >
        {message.pending ? (
          <ActivityIndicator color={isUser ? Colors.white : accentColor} />
        ) : message.error ? (
          <Text style={[styles.bubbleText, { color: Colors.error }]}>{message.error}</Text>
        ) : (
          <Text
            style={[
              styles.bubbleText,
              { color: isUser ? Colors.white : Colors.textPrimary },
            ]}
          >
            {message.content}
          </Text>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bgSecondary },

  header: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    padding: 12,
    backgroundColor: Colors.white,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  avatar: {
    width: 36,
    height: 36,
    borderRadius: 18,
    justifyContent: 'center',
    alignItems: 'center',
  },
  headerTitle: { fontSize: 15, fontWeight: '800', color: Colors.textPrimary },
  headerSub: { fontSize: 11, color: Colors.textSecondary },
  usage: { fontSize: 11, color: Colors.textMuted, fontWeight: '600' },

  scroll: { padding: 14, gap: 10, paddingBottom: 24 },

  bubbleRow: { flexDirection: 'row' },
  bubbleRowUser: { justifyContent: 'flex-end' },
  bubbleRowAssistant: { justifyContent: 'flex-start' },
  bubble: {
    maxWidth: '80%',
    paddingHorizontal: 12,
    paddingVertical: 10,
    borderRadius: 14,
  },
  bubbleText: { fontSize: 14, lineHeight: 20 },

  offlineBar: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 14,
    paddingVertical: 8,
    backgroundColor: '#FFFBEB',
  },
  offlineText: { fontSize: 12, color: Colors.warning, fontWeight: '500' },

  composer: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    gap: 8,
    padding: 10,
    backgroundColor: Colors.white,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
  },
  input: {
    flex: 1,
    minHeight: 40,
    maxHeight: 100,
    paddingHorizontal: 12,
    paddingVertical: 10,
    borderRadius: 12,
    backgroundColor: Colors.gray50,
    borderWidth: 1,
    borderColor: Colors.border,
    fontSize: 14,
    color: Colors.textPrimary,
  },
  sendBtn: {
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  sendBtnDisabled: { opacity: 0.45 },
});
