
class FirebaseFailure extends Failure {
  final String message;

  FirebaseFailure(this.message);

  @override
  List<Object?> get props => [message];
}

abstract class Failure {
  List<Object?> get props;
}