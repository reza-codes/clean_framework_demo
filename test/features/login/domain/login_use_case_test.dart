import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_demo/features/login/domain/login_entity.dart';
import 'package:clean_framework_demo/features/login/domain/login_input.dart';
import 'package:clean_framework_demo/features/login/domain/login_ui_output.dart';
import 'package:clean_framework_demo/features/login/domain/login_use_case.dart';
import 'package:clean_framework_demo/features/login/external_interface/get_random_data_gateway.dart';
import 'package:clean_framework_demo/features/login/login_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_framework_test/clean_framework_test.dart';

void main() {
  group('LoginUseCase test |', () {
    useCaseTest<LoginUseCase, LoginEntity, LoginUIOutput>(
      'fetch Random data; on success',
      provider: loginUseCaseProvider,
      execute: (useCase) {
        _mockSuccess(useCase);
        return useCase.fetchRandomData();
      },
      expect: () => [
        const LoginUIOutput(
          email: '',
          password: '',
          status: LoginStatus.loading,
        ),
        const LoginUIOutput(
          password: '1234abc@#!',
          email: 'example@email.com',
          status: LoginStatus.loaded,
        ),
      ],
      verify: (useCase) {
        expect(
          useCase.debugEntity,
          const LoginEntity(
            password: '1234abc@#!',
            email: 'example@email.com',
            status: LoginStatus.loaded,
          ),
        );
      },
    );

    useCaseTest<LoginUseCase, LoginEntity, LoginUIOutput>(
      'fetch Random data; on Failure',
      provider: loginUseCaseProvider,
      execute: (useCase) {
        _mockFailure(useCase);
        return useCase.fetchRandomData();
      },
      expect: () => [
        const LoginUIOutput(
          email: '',
          password: '',
          status: LoginStatus.loading,
        ),
        const LoginUIOutput(
          email: '',
          password: '',
          error: 'No Internet',
          status: LoginStatus.loaded,
        ),
      ],
      verify: (useCase) {
        expect(
          useCase.debugEntity,
          const LoginEntity(
            password: '',
            email: '',
            error: 'No Internet',
            status: LoginStatus.loaded,
          ),
        );
      },
    );

    useCaseTest<LoginUseCase, LoginEntity, LoginUIOutput>(
      'isValidEmail - test',
      provider: loginUseCaseProvider,
      execute: (useCase) {
        useCase.isValidEmail('example@email.com');
      },
      expect: () => anything,
      verify: (useCase) {
        expect(
          [
            useCase.isValidEmail('example@email.com'),
            useCase.isValidEmail('exampleemail.com'),
          ],
          [
            isTrue,
            isFalse,
          ],
        );
      },
    );

    useCaseTest<LoginUseCase, LoginEntity, LoginUIOutput>(
      'isValidPassword - test',
      provider: loginUseCaseProvider,
      execute: (useCase) {
        useCase.isValidPassword('123@!abc');
      },
      expect: () => anything,
      verify: (useCase) {
        expect(
          [
            useCase.isValidPassword('123!abc'),
            useCase.isValidPassword(''),
          ],
          [
            isTrue,
            isFalse,
          ],
        );
      },
    );

    useCaseTest<LoginUseCase, LoginEntity, LoginUIOutput>(
      'onLogin - test',
      provider: loginUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(LoginInput(password: '1234abc@#!', email: 'example@email.com'));
      },
      expect: () => [
        const LoginUIOutput(
          password: '1234abc@#!',
          email: 'example@email.com',
          status: LoginStatus.initial,
        ),
      ],
      verify: (useCase) {
        expect(
          useCase.debugEntity,
          const LoginEntity(
            password: '1234abc@#!',
            email: 'example@email.com',
            status: LoginStatus.initial,
          ),
        );
      },
    );
  });
}

void _mockSuccess(LoginUseCase useCase) {
  useCase.subscribe<RandomDataGatewayOutput, LoginDataRandomGatewayInput>(
    (_) async {
      return const Either.right(
        LoginDataRandomGatewayInput(
          password: '1234abc@#!',
          email: 'example@email.com',
        ),
      );
    },
  );
}

void _mockFailure(LoginUseCase useCase) {
  useCase.subscribe<RandomDataGatewayOutput, LoginDataRandomGatewayInput>(
    (_) async {
      return const Either.left(FailureInput(message: 'No Internet'));
    },
  );
}
