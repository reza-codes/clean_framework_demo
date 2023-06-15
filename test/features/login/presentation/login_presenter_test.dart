import 'package:clean_framework_demo/features/login/domain/login_entity.dart';
import 'package:clean_framework_demo/features/login/domain/login_input.dart';
import 'package:clean_framework_demo/features/login/domain/login_ui_output.dart';
import 'package:clean_framework_demo/features/login/domain/login_use_case.dart';
import 'package:clean_framework_demo/features/login/login_provider.dart';
import 'package:clean_framework_demo/features/login/presentation/login_presenter.dart';
import 'package:clean_framework_demo/features/login/presentation/login_view_model.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(LoginInput(email: 'example@email.com', password: '123@abc!'));
  });

  group('HomePresenter tests |', () {
    presenterTest<LoginViewModel, LoginUIOutput, LoginUseCase>(
      'creates proper view model',
      create: (builder) => LoginPresenter(builder: builder),
      overrides: [
        loginUseCaseProvider.overrideWith(LoginUseCaseFake()),
      ],
      setup: (useCase) {
        useCase.debugEntityUpdate(
          (entity) => entity.copyWith(
            password: '',
            email: '',
            status: LoginStatus.initial,
          ),
        );
      },
      expect: () => [
        isA<LoginViewModel>().having((vm) => vm.email, '', isEmpty),
      ],
    );

    presenterCallbackTest<LoginViewModel, LoginUIOutput, LoginUseCase>(
      'sets on login input',
      useCase: LoginUseCaseMock(),
      create: (builder) => LoginPresenter(builder: builder),
      setup: (useCase) {
        when(() => useCase.setInput<LoginInput>(any()));
      },
      verify: (useCase, vm) {
        vm.onLogin('example@email.com', '123@abc!');

        final input = verify(
          () => useCase.setInput<LoginInput>(captureAny()),
        ).captured.last as LoginInput;

        expect(input.email, equals('example@email.com'));
        expect(input.password, equals('123@abc!'));
      },
    );
  });
}

class LoginUseCaseFake extends LoginUseCase {
  @override
  Future<void> fetchRandomData() async {}
}

class LoginUseCaseMock extends UseCaseMock<LoginEntity> implements LoginUseCase {
  LoginUseCaseMock()
      : super(
          entity: const LoginEntity(),
          transformers: [LoginUIOutputTransformer()],
        );
}
