import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/chat_intent.dart';
import '../../domain/entities/chat_reply.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../dto/chat_response_dto.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remote;

  ChatRepositoryImpl(this._remote);

  @override
  Future<Result<ChatReply>> send(String message) async {
    try {
      final dto = await _remote.send(message);
      return Success(ChatReply(intent: _intentToEntity(dto.intent), answer: dto.answer));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  ChatIntent _intentToEntity(ChatIntentDto dto) {
    return switch (dto) {
      ChatIntentDto.portfolioSummary => ChatIntent.portfolioSummary,
      ChatIntentDto.stockQuote => ChatIntent.stockQuote,
      ChatIntentDto.indicatorSummary => ChatIntent.indicatorSummary,
      ChatIntentDto.watchlistSummary => ChatIntent.watchlistSummary,
      ChatIntentDto.alertsSummary => ChatIntent.alertsSummary,
      ChatIntentDto.unknown => ChatIntent.unknown,
    };
  }
}
