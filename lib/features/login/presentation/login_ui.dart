import 'package:auto_route/auto_route.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../routing/app_router.gr.dart';
import 'login_presenter.dart';
import 'login_view_model.dart';

@RoutePage()
class LoginUI extends UI<LoginViewModel> {
  LoginUI({super.key});

  @override
  LoginPresenter create(WidgetBuilder builder) {
    return LoginPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Center(
        heightFactor: 2,
        child: viewModel.isLoading ? const _LoadingWidget() : _LoginForm(viewModel: viewModel),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 20),
        Text(
          "Fetching random data 😃",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({required this.viewModel});

  final LoginViewModel viewModel;
  late final emailController = TextEditingController(text: viewModel.email);
  late final passwordController = TextEditingController(text: viewModel.password);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (viewModel.errorMsg != null) Text(viewModel.errorMsg!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: TextFormField(
              key: const Key('email-fail-key'),
              validator: (value) {
                if (!viewModel.isValidEmail(value)) {
                  return 'Please enter valid email';
                }
                return null;
              },
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: TextFormField(
              key: const Key('password-fail-key'),
              validator: (value) {
                if (!viewModel.isValidPassword(value)) {
                  return 'Please enter valid password';
                }
                return null;
              },
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton.icon(
            key: const Key('login-button-key'),
            onPressed: () {
              viewModel.onLogin(emailController.text, passwordController.text);
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data is valid ✅')),
                );
                context.router.replace(HomeUI());
              }
            },
            icon: const Icon(Icons.login),
            label: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
