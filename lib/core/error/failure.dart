/// Failures the presentation layer can render, mapped from whatever went
/// wrong at the network/data layer (see [DioErrorMapper]). Every Failure
/// carries a user-displayable [message] - never a raw exception string.
sealed class Failure {
  final String message;

  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error. Check your connection and try again.']);
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {this.statusCode});
}

/// A 422 response - [fieldErrors] maps a field name (best-effort, from the
/// backend's `loc` array) to its list of messages, for inline form display.
class ValidationFailure extends Failure {
  final Map<String, List<String>> fieldErrors;

  const ValidationFailure(super.message, this.fieldErrors);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired. Please log in again.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Something went wrong. Please try again.']);
}
