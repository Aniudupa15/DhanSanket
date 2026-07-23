import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/storage/secure_token_storage.dart';
import 'package:dhan_sanket/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dhan_sanket/features/auth/data/dto/token_pair_dto.dart';
import 'package:dhan_sanket/features/auth/data/dto/user_profile_dto.dart';
import 'package:dhan_sanket/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockSecureTokenStorage extends Mock implements SecureTokenStorage {}

void main() {
  late MockAuthRemoteDataSource remote;
  late MockSecureTokenStorage tokenStorage;
  late AuthRepositoryImpl repository;

  final tokenPair = TokenPairDto(accessToken: 'access-token', refreshToken: 'refresh-token', tokenType: 'bearer');
  final profileDto = UserProfileDto(
    id: 'u1',
    email: 'test@example.com',
    displayName: 'Test User',
    createdAt: DateTime(2026, 1, 1),
  );

  setUp(() {
    remote = MockAuthRemoteDataSource();
    tokenStorage = MockSecureTokenStorage();
    repository = AuthRepositoryImpl(remote: remote, tokenStorage: tokenStorage);
  });

  group('login', () {
    test('persists tokens and returns the mapped profile on success', () async {
      when(() => remote.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => tokenPair);
      when(() => remote.getMe()).thenAnswer((_) async => profileDto);
      when(
        () => tokenStorage.saveTokens(accessToken: any(named: 'accessToken'), refreshToken: any(named: 'refreshToken')),
      ).thenAnswer((_) async {});

      final result = await repository.login(email: 'test@example.com', password: 'password123');

      expect(result, isA<Success>());
      expect((result as Success).data.email, 'test@example.com');
      verify(() => tokenStorage.saveTokens(accessToken: 'access-token', refreshToken: 'refresh-token')).called(1);
    });

    test('maps a DioException to an Error result', () async {
      when(() => remote.login(email: any(named: 'email'), password: any(named: 'password'))).thenThrow(
        DioException(requestOptions: RequestOptions(path: '/auth/login'), type: DioExceptionType.connectionError),
      );

      final result = await repository.login(email: 'test@example.com', password: 'wrong');

      expect(result, isA<Error>());
    });
  });

  group('restoreSession', () {
    test('returns Success(null) without a network call when no refresh token is stored', () async {
      when(() => tokenStorage.getRefreshToken()).thenAnswer((_) async => null);

      final result = await repository.restoreSession();

      expect(result, isA<Success>());
      expect((result as Success).data, isNull);
      verifyNever(() => remote.getMe());
    });

    test('fetches the profile when a refresh token exists', () async {
      when(() => tokenStorage.getRefreshToken()).thenAnswer((_) async => 'stored-refresh-token');
      when(() => remote.getMe()).thenAnswer((_) async => profileDto);

      final result = await repository.restoreSession();

      expect(result, isA<Success>());
      expect((result as Success).data?.email, 'test@example.com');
    });

    test('clears tokens and returns Error when getMe fails', () async {
      when(() => tokenStorage.getRefreshToken()).thenAnswer((_) async => 'stored-refresh-token');
      when(() => remote.getMe()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/auth/me'),
          response: Response(requestOptions: RequestOptions(path: '/auth/me'), statusCode: 401),
          type: DioExceptionType.badResponse,
        ),
      );
      when(() => tokenStorage.clear()).thenAnswer((_) async {});

      final result = await repository.restoreSession();

      expect(result, isA<Error>());
      verify(() => tokenStorage.clear()).called(1);
    });
  });

  group('logout', () {
    test('calls remote logout with the stored refresh token and clears local tokens', () async {
      when(() => tokenStorage.getRefreshToken()).thenAnswer((_) async => 'stored-refresh-token');
      when(() => remote.logout(any())).thenAnswer((_) async {});
      when(() => tokenStorage.clear()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, isA<Success>());
      verify(() => remote.logout('stored-refresh-token')).called(1);
      verify(() => tokenStorage.clear()).called(1);
    });

    test('still clears local tokens even if the server call fails', () async {
      when(() => tokenStorage.getRefreshToken()).thenAnswer((_) async => 'stored-refresh-token');
      when(() => remote.logout(any())).thenThrow(
        DioException(requestOptions: RequestOptions(path: '/auth/logout'), type: DioExceptionType.connectionError),
      );
      when(() => tokenStorage.clear()).thenAnswer((_) async {});

      final result = await repository.logout();

      expect(result, isA<Error>());
      verify(() => tokenStorage.clear()).called(1);
    });
  });
}
