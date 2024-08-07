class AppExceptions implements Exception {
  final message;
  final prefix;

  AppExceptions([
    this.message,
    this.prefix,
  ]);

  @override
  String toString() {
    return '$message$prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(
          message,
          'No Internet Connection!',
        );
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message])
      : super(
          message,
          "You don't have access to this.",
        );
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(
          message,
          'Request Time out!',
        );
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(
          message,
          '',
        );
}
