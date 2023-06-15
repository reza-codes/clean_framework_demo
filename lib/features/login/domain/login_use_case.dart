import 'package:clean_framework/clean_framework.dart';

import '../external_interface/get_random_data_gateway.dart';
import 'login_entity.dart';
import 'login_input.dart';
import 'login_ui_output.dart';

class LoginUseCase extends UseCase<LoginEntity> {
  LoginUseCase()
      : super(
          entity: const LoginEntity(),
          transformers: [
            LoginUIOutputTransformer(),
            UpdateLoginInputTransfer(),
          ],
        );

  Future<void> fetchRandomData() async {
    entity = entity.copyWith(status: LoginStatus.loading);
    await Future.delayed(const Duration(seconds: 2));

    await request<LoginDataRandomGatewayInput>(
      RandomDataGatewayOutput(),
      onSuccess: (LoginDataRandomGatewayInput data) {
        return entity.copyWith(
          password: data.password,
          email: data.email,
          status: LoginStatus.loaded,
        );
      },
      onFailure: (FailureInput failure) {
        return entity.copyWith(
          error: failure.message,
          status: LoginStatus.loaded,
        );
      },
    );
  }

  bool isValidEmail(String? email) {
    if (email == null) return false;
    final RegExp emailValidatorRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    );
    return emailValidatorRegExp.hasMatch(email);
  }

  bool isValidPassword(String? password) {
    if (password == null) return false;
    if (password.isEmpty || password.length < 6) return false;
    return true;
  }
}

class LoginUIOutputTransformer extends OutputTransformer<LoginEntity, LoginUIOutput> {
  @override
  LoginUIOutput transform(LoginEntity entity) {
    return LoginUIOutput(
      email: entity.email,
      password: entity.password,
      status: entity.status,
    );
  }
}

class UpdateLoginInputTransfer extends InputTransformer<LoginEntity, LoginInput> {
  @override
  LoginEntity transform(LoginEntity entity, LoginInput input) {
    return entity.copyWith(
      email: input.email,
      password: input.password,
    );
  }
}
