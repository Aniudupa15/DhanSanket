import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../../../core/storage/secure_token_storage.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../dto/user_profile_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final SecureTokenStorage _tokenStorage;

  AuthRepositoryImpl({required AuthRemoteDataSource remote, required SecureTokenStorage tokenStorage})
      : _remote = remote,
        _tokenStorage = tokenStorage;

  UserProfile _toEntity(UserProfileDto dto) {
    return UserProfile(id: dto.id, email: dto.email, displayName: dto.displayName, createdAt: dto.createdAt);
  }

  @override
  Future<Result<UserProfile>> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final tokens = await _remote.register(email: email, password: password, displayName: displayName);
      await _tokenStorage.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);
      final profile = await _remote.getMe();
      return Success(_toEntity(profile));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<UserProfile>> login({required String email, required String password}) async {
    try {
      final tokens = await _remote.login(email: email, password: password);
      await _tokenStorage.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);
      final profile = await _remote.getMe();
      return Success(_toEntity(profile));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    try {
      if (refreshToken != null) {
        await _remote.logout(refreshToken);
      }
      await _tokenStorage.clear();
      return const Success(null);
    } on DioException catch (e) {
      // Logout ends the local session even if the server call fails (e.g.
      // the token was already revoked/expired) - it's a client-side
      // guarantee, not conditional on network success.
      await _tokenStorage.clear();
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<UserProfile?>> restoreSession() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) {
      return const Success(null);
    }
    try {
      // No access token needed here even if expired/missing - the auth
      // interceptor transparently refreshes using the stored refresh token
      // on the resulting 401 and retries this call.
      final profile = await _remote.getMe();
      return Success(_toEntity(profile));
    } on DioException catch (e) {
      await _tokenStorage.clear();
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<UserProfile>> updateProfile({String? displayName, String? email}) async {
    try {
      final profile = await _remote.updateMe(displayName: displayName, email: email);
      return Success(_toEntity(profile));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }
}
