import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/network/dio_error_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

RequestOptions _options([String path = '/test']) => RequestOptions(path: path);

void main() {
  group('DioErrorMapper', () {
    test('connection timeout maps to NetworkFailure', () {
      final error = DioException(requestOptions: _options(), type: DioExceptionType.connectionTimeout);
      expect(DioErrorMapper.map(error), isA<NetworkFailure>());
    });

    test('connection error maps to NetworkFailure', () {
      final error = DioException(requestOptions: _options(), type: DioExceptionType.connectionError);
      expect(DioErrorMapper.map(error), isA<NetworkFailure>());
    });

    test('401 with a detail string maps to UnauthorizedFailure carrying that message', () {
      final response = Response(requestOptions: _options(), statusCode: 401, data: {'detail': 'Invalid credentials'});
      final error = DioException(requestOptions: _options(), response: response, type: DioExceptionType.badResponse);

      final failure = DioErrorMapper.map(error);

      expect(failure, isA<UnauthorizedFailure>());
      expect(failure.message, 'Invalid credentials');
    });

    test('422 with a validation detail list maps to ValidationFailure with field errors', () {
      final response = Response(
        requestOptions: _options(),
        statusCode: 422,
        data: {
          'detail': [
            {
              'loc': ['body', 'email'],
              'msg': 'value is not a valid email address',
              'type': 'value_error',
            },
          ],
        },
      );
      final error = DioException(requestOptions: _options(), response: response, type: DioExceptionType.badResponse);

      final failure = DioErrorMapper.map(error);

      expect(failure, isA<ValidationFailure>());
      expect((failure as ValidationFailure).fieldErrors['email'], ['value is not a valid email address']);
    });

    test('404 with a detail string maps to ServerFailure carrying the status code', () {
      final response = Response(requestOptions: _options(), statusCode: 404, data: {'detail': 'Not found'});
      final error = DioException(requestOptions: _options(), response: response, type: DioExceptionType.badResponse);

      final failure = DioErrorMapper.map(error);

      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'Not found');
      expect((failure as ServerFailure).statusCode, 404);
    });

    test('500 with no body maps to a generic ServerFailure', () {
      final response = Response(requestOptions: _options(), statusCode: 500);
      final error = DioException(requestOptions: _options(), response: response, type: DioExceptionType.badResponse);

      final failure = DioErrorMapper.map(error);

      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 500);
    });
  });
}
