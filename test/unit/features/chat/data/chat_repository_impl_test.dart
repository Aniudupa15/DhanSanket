import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:dhan_sanket/features/chat/data/dto/chat_response_dto.dart';
import 'package:dhan_sanket/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:dhan_sanket/features/chat/domain/entities/chat_intent.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatRemoteDataSource extends Mock implements ChatRemoteDataSource {}

void main() {
  late MockChatRemoteDataSource remote;
  late ChatRepositoryImpl repository;

  setUp(() {
    remote = MockChatRemoteDataSource();
    repository = ChatRepositoryImpl(remote);
  });

  test('send maps the intent enum and answer', () async {
    when(() => remote.send(any())).thenAnswer(
      (_) async => const ChatResponseDto(intent: ChatIntentDto.portfolioSummary, answer: 'Your portfolio is up 5%.'),
    );

    final result = await repository.send('how is my portfolio doing');

    expect(result, isA<Success>());
    final reply = (result as Success).data;
    expect(reply.intent, ChatIntent.portfolioSummary);
    expect(reply.answer, 'Your portfolio is up 5%.');
  });

  test('send maps a DioException to an Error result', () async {
    when(() => remote.send(any())).thenThrow(DioException(requestOptions: RequestOptions(path: '/chat')));

    final result = await repository.send('hello');

    expect(result, isA<Error>());
  });
}
