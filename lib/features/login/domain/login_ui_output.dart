import 'package:clean_framework/clean_framework.dart';

import 'login_entity.dart';

class LoginUIOutput extends Output {
  const LoginUIOutput({
    required this.email,
    required this.password,
    required this.status,
    this.error,
  });

  final String email;
  final String password;
  final LoginStatus status;
  final Object? error;

  @override
  List<Object?> get props => [
        password,
        email,
        status,
      ];
}
