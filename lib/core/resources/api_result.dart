sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T>{
  T response;
  Success(this.response);
}

class Failure<T> extends ApiResult<T>{
  String message;
  Failure(this.message);
}