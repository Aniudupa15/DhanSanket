import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _repository;

  ChatBloc({required ChatRepository repository}) : _repository = repository, super(const ChatState()) {
    on<ChatMessageSent>(_onMessageSent);
  }

  Future<void> _onMessageSent(ChatMessageSent event, Emitter<ChatState> emit) async {
    final userMessage = ChatMessage(role: ChatRole.user, text: event.text, sentAt: DateTime.now());
    emit(state.copyWith(messages: [...state.messages, userMessage], isSending: true, clearFailure: true));

    final result = await _repository.send(event.text);
    switch (result) {
      case Success(data: final reply):
        final assistantMessage = ChatMessage(
          role: ChatRole.assistant,
          text: reply.answer,
          intent: reply.intent,
          sentAt: DateTime.now(),
        );
        emit(state.copyWith(messages: [...state.messages, assistantMessage], isSending: false));
      case Error(failure: final failure):
        emit(state.copyWith(isSending: false, failure: failure));
    }
  }
}
