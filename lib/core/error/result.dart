import 'failure.dart';

/// A repository call either [Success]es with data or [Error]s with a
/// [Failure] - forces every call site to handle both, no thrown exceptions
/// crossing the repository boundary into the Bloc layer.
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;

  const Error(this.failure);
}
