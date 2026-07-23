import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../dto/token_pair_dto.dart';
import '../dto/user_profile_dto.dart';

/// Raw Dio calls for every auth endpoint except `/auth/refresh` - that one
/// is owned by `core/network/token_refresh_coordinator.dart` instead, which
/// needs a bare (non-intercepted) Dio instance to avoid recursive
/// interception, so it doesn't go through this class.
class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<TokenPairDto> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.register,
      data: {'email': email, 'password': password, 'display_name': displayName},
    );
    return TokenPairDto.fromJson(response.data!);
  }

  Future<TokenPairDto> login({required String email, required String password}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return TokenPairDto.fromJson(response.data!);
  }

  Future<void> logout(String refreshToken) async {
    await _dio.post<void>(ApiEndpoints.logout, data: {'refresh_token': refreshToken});
  }

  Future<UserProfileDto> getMe() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.me);
    return UserProfileDto.fromJson(response.data!);
  }

  Future<UserProfileDto> updateMe({String? displayName, String? email}) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      ApiEndpoints.me,
      data: {
        'display_name': ?displayName,
        'email': ?email,
      },
    );
    return UserProfileDto.fromJson(response.data!);
  }
}
