import 'package:auto_route/auto_route.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../routing/app_router.gr.dart';
import '../domain/login_entity.dart';
import '../domain/login_input.dart';
import '../login_provider.dart';
import '../domain/login_ui_output.dart';
import '../domain/login_use_case.dart';
import 'login_view_model.dart';

class LoginPresenter extends Presenter<LoginViewModel, LoginUIOutput, LoginUseCase> {
  LoginPresenter({
    super.key,
    required super.builder,
  }) : super(provider: loginUseCaseProvider);

  @override
  void onLayoutReady(BuildContext context, LoginUseCase useCase) {
    useCase.fetchRandomData();
  }

  @override
  LoginViewModel createViewModel(LoginUseCase useCase, LoginUIOutput output) {
    return LoginViewModel(
      email: output.email,
      password: output.password,
      isValidEmail: useCase.isValidEmail,
      isValidPassword: useCase.isValidPassword,
      onLogin: (email, password) => useCase.setInput(LoginInput(email: email, password: password)),
      navigateToHomePage: navigateToHomePage,
      isLoading: output.status == LoginStatus.loading,
    );
  }

  void navigateToHomePage(BuildContext context, bool validate) {
    if (validate) {
      context.router.replace(HomeUI());
    }
  }
}
