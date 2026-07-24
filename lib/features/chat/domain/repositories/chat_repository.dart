import '../../../../core/error/result.dart';
import '../entities/chat_reply.dart';

abstract class ChatRepository {
  Future<Result<ChatReply>> send(String message);
}
