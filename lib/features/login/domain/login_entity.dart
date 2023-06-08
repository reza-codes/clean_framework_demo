import 'package:clean_framework/clean_framework.dart';

enum LoginStatus { initial, loading, loaded, failed }

class LoginEntity extends Entity {
  const LoginEntity({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.initial,
    this.error,
  });

  final String email;
  final String password;
  final LoginStatus status;
  final Object? error;

  @override
  List<Object?> get props => [email, password, status];

  @override
  LoginEntity copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    Object? error,
  }) {
    return LoginEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
