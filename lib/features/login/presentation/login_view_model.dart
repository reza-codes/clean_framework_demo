import 'package:clean_framework/clean_framework.dart';

class LoginViewModel extends ViewModel {
  const LoginViewModel({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.onLogin,
    required this.isValidEmail,
    required this.isValidPassword,
    this.errorMsg,
  });

  final String email;
  final String password;
  final bool isLoading;
  final String? errorMsg;

  final Function(String email, String password) onLogin;
  final bool Function(String? email) isValidEmail;
  final bool Function(String? password) isValidPassword;

  @override
  List<Object?> get props => [email, password, isLoading, errorMsg];
}
