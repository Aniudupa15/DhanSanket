import 'chat_intent.dart';

enum ChatRole { user, assistant }

class ChatMessage {
  final ChatRole role;
  final String text;
  final ChatIntent? intent;
  final DateTime sentAt;

  const ChatMessage({required this.role, required this.text, this.intent, required this.sentAt});
}
