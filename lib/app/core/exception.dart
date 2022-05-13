class ServerException implements Exception {}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);
}

class UnknownException implements Exception {}
