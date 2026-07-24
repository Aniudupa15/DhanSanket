import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/chat_response_dto.dart';

class ChatRemoteDataSource {
  final Dio _dio;

  ChatRemoteDataSource(this._dio);

  Future<ChatResponseDto> send(String message) async {
    final response = await _dio.post<Map<String, dynamic>>(ApiEndpoints.chat, data: {'message': message});
    return ChatResponseDto.fromJson(response.data!);
  }
}
