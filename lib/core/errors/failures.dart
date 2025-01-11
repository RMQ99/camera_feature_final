abstract class Failure {}

class CameraFailure extends Failure {
  final String message;
  CameraFailure(this.message);
}