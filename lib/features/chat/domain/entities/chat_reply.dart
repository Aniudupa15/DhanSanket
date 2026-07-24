import 'chat_intent.dart';

class ChatReply {
  final ChatIntent intent;
  final String answer;

  const ChatReply({required this.intent, required this.answer});
}
