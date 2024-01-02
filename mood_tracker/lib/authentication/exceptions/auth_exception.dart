class AuthException {
  final String message;
  final String code;

  AuthException({required this.message, required this.code});

  @override
  String toString() {
    return '[AuthException/$code] $message';
  }
}
