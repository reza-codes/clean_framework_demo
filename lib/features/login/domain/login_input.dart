import 'package:clean_framework/clean_framework.dart';

class LoginInput extends Input {
  LoginInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
