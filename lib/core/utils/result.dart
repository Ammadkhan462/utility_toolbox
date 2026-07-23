/// Standard async operation state used across all feature screens.
sealed class Result<T> {
  const Result();
}

class Idle<T> extends Result<T> {
  const Idle();
}

class Loading<T> extends Result<T> {
  const Loading();
}

class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

class ErrorResult<T> extends Result<T> {
  const ErrorResult(this.message);
  final String message;
}
