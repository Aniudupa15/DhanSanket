import 'package:dio/dio.dart';

import '../error/failure.dart';

/// Translates a [DioException] into a displayable [Failure], parsing the
/// backend's two documented error shapes: `{"detail": "message"}` (domain
/// errors) and `{"detail": [{"loc": [...], "msg": "...", "type": "..."}]}`
/// (FastAPI/Pydantic 422 validation errors).
class DioErrorMapper {
  DioErrorMapper._();

  static Failure map(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badCertificate:
        return const NetworkFailure('Secure connection failed.');
      case DioExceptionType.cancel:
        return const UnknownFailure('Request cancelled.');
      case DioExceptionType.badResponse:
        return _mapResponse(error);
      case DioExceptionType.unknown:
        return const NetworkFailure();
    }
  }

  static Failure _mapResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (statusCode == 401) {
      return UnauthorizedFailure(_extractDetailMessage(data) ?? 'Session expired. Please log in again.');
    }

    if (statusCode == 422) {
      final validation = _tryMapValidation(data);
      if (validation != null) return validation;
    }

    final message = _extractDetailMessage(data) ?? 'Server error${statusCode != null ? ' ($statusCode)' : ''}.';
    return ServerFailure(message, statusCode: statusCode);
  }

  static ValidationFailure? _tryMapValidation(dynamic data) {
    if (data is! Map || data['detail'] is! List) return null;

    final fieldErrors = <String, List<String>>{};
    final messages = <String>[];
    for (final entry in data['detail'] as List) {
      if (entry is! Map) continue;
      final msg = entry['msg']?.toString() ?? 'Invalid value';
      final loc = entry['loc'];
      final field = (loc is List && loc.isNotEmpty) ? loc.last.toString() : 'field';
      fieldErrors.putIfAbsent(field, () => []).add(msg);
      messages.add(msg);
    }
    return ValidationFailure(messages.isEmpty ? 'Validation failed.' : messages.join(', '), fieldErrors);
  }

  static String? _extractDetailMessage(dynamic data) {
    if (data is Map && data['detail'] is String) {
      return data['detail'] as String;
    }
    return null;
  }
}
