class Failure {
  int code; // 200 or 400
  String message; // error or success
  String? serverMessage;

  Failure(this.code, this.message);

  factory Failure.defaultF(String message) {
    return Failure(-1, message);
  }
}
