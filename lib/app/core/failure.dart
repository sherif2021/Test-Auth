abstract class Failure {}

class ServerFailure extends Failure {}

class CustomFailure extends Failure {
  final String message;

  CustomFailure(this.message);
}

class UnknownFailure extends Failure {}
