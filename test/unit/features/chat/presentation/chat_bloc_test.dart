import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/chat/domain/entities/chat_intent.dart';
import 'package:dhan_sanket/features/chat/domain/entities/chat_reply.dart';
import 'package:dhan_sanket/features/chat/domain/repositories/chat_repository.dart';
import 'package:dhan_sanket/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:dhan_sanket/features/chat/presentation/bloc/chat_event.dart';
import 'package:dhan_sanket/features/chat/presentation/bloc/chat_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late MockChatRepository repository;

  setUp(() {
    repository = MockChatRepository();
  });

  blocTest<ChatBloc, ChatState>(
    'appends the user message immediately, then the assistant reply on success',
    build: () {
      when(() => repository.send(any())).thenAnswer(
        (_) async => const Success(ChatReply(intent: ChatIntent.stockQuote, answer: 'RELIANCE is at 1300.')),
      );
      return ChatBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ChatMessageSent('quote for RELIANCE')),
    expect: () => [
      isA<ChatState>()
          .having((s) => s.messages.length, 'messages.length', 1)
          .having((s) => s.isSending, 'isSending', true),
      isA<ChatState>()
          .having((s) => s.messages.length, 'messages.length', 2)
          .having((s) => s.isSending, 'isSending', false),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'keeps the user message and surfaces a failure without an assistant reply',
    build: () {
      when(() => repository.send(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return ChatBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ChatMessageSent('hello')),
    expect: () => [
      isA<ChatState>()
          .having((s) => s.messages.length, 'messages.length', 1)
          .having((s) => s.isSending, 'isSending', true),
      isA<ChatState>()
          .having((s) => s.messages.length, 'messages.length', 1)
          .having((s) => s.isSending, 'isSending', false)
          .having((s) => s.failure, 'failure', isA<NetworkFailure>()),
    ],
  );
}
