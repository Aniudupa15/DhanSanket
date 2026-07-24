import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/chat_message.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final bool isSending;
  final Failure? failure;

  const ChatState({this.messages = const [], this.isSending = false, this.failure});

  ChatState copyWith({List<ChatMessage>? messages, bool? isSending, Failure? failure, bool clearFailure = false}) {
    return ChatState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [messages, isSending, failure];
}
