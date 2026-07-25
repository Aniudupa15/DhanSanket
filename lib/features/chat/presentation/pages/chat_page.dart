import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  static const List<String> _suggestions = [
    'Top gainers today',
    'NIFTY 50 overview',
    'Portfolio summary',
    'RSI strategy for RELIANCE',
  ];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _send([String? customText]) {
    final text = (customText ?? _controller.text).trim();
    if (text.isEmpty) return;
    context.read<ChatBloc>().add(ChatMessageSent(text));
    if (customText == null) _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(Icons.smart_toy_outlined, size: 18, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 10),
            const Text('AI Financial Assistant'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state.failure != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure!.message)));
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_scrollController.hasClients) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                  }
                });
              },
              builder: (context, state) {
                if (state.messages.isEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 36,
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Icon(Icons.psychology_outlined, size: 40, color: theme.colorScheme.primary),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'How can I help your investments today?',
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ask about market trends, portfolio performance, stock quotes, technical signals, or price alerts.',
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: _suggestions.map((prompt) {
                              return ActionChip(
                                avatar: const Icon(Icons.auto_awesome, size: 14),
                                label: Text(prompt),
                                onPressed: () => _send(prompt),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) => ChatBubble(message: state.messages[index]),
                );
              },
            ),
          ),
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          textInputAction: TextInputAction.send,
                          decoration: const InputDecoration(
                            hintText: 'Ask AI assistant about stocks, portfolio, signals...',
                          ),
                          onSubmitted: (_) => _send(),
                          enabled: !state.isSending,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton.filled(
                        icon: state.isSending
                            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                            : const Icon(Icons.send_rounded, size: 20),
                        tooltip: 'Send message',
                        onPressed: state.isSending ? null : _send,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

