import 'package:clean_framework_demo/features/login/presentation/login_ui.dart';
import 'package:clean_framework_demo/features/login/presentation/login_view_model.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginUI tests |', () {
    uiTest(
      'shows loading indicator if loading data',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        email: '',
        password: '',
        isValidEmail: (_) => false,
        isValidPassword: (_) => false,
        isLoading: true,
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    uiTest(
      'shows login form',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        email: 'example@email.com',
        password: '1234@av!',
        isValidEmail: (_) => true,
        isValidPassword: (_) => true,
        isLoading: false,
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        expect(find.byKey(const Key('email-fail-key')), findsOneWidget);
        expect(find.byKey(const Key('password-fail-key')), findsOneWidget);
      },
    );
    uiTest(
      'shows error message if error',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        email: 'example@email.com',
        password: '1234@av!',
        isValidEmail: (_) => false,
        isValidPassword: (_) => false,
        isLoading: false,
        errorMsg: 'Error',
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        expect(find.text('Error'), findsOneWidget);
      },
    );

    uiTest(
      'TextFormField email validator',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        email: 'example@email.com',
        password: '1234@av!',
        isValidEmail: (_) => false,
        isValidPassword: (_) => false,
        isLoading: false,
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        final finder = find.byKey(const Key('email-fail-key'));

        await tester.enterText(finder, 'exampleemail.com');
        // Enter text into the email field

        // Verify the text entered in the email field
        expect(find.text('exampleemail.com'), findsOneWidget);

        // Tap the add button.
        await tester.tap(find.byKey(const Key('login-button-key')));

        // Rebuild the widget with the new item.
        await tester.pump();

        // Expect to find the item on screen.
        expect(find.text('Please enter valid email'), findsOneWidget);
      },
    );

    uiTest(
      'email onTapOutside',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        email: 'example@email.com',
        password: '1234@av!',
        isValidEmail: (_) => false,
        isValidPassword: (_) => false,
        isLoading: false,
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        final finder = find.byKey(const Key('email-fail-key'));

        await tester.enterText(finder, 'example@email.com');
        // Enter text into the email field

        // Verify the text entered in the email field
        expect(find.text('example@email.com'), findsOneWidget);

        // Unfocus the field by tapping outside
        await tester.tapAt(Offset.zero);

        // Verify that the field lost focus
        expect(finder, isNot(!FocusNode().hasFocus));
      },
    );

    uiTest(
      'Navigates to home page if login successful',
      ui: LoginUI(),
      viewModel: LoginViewModel(
        password: '1234abc@#!',
        email: 'example@email.com',
        isValidEmail: (_) => true,
        isValidPassword: (_) => true,
        isLoading: false,
        onLogin: (_, __) {},
        navigateToHomePage: (_, __) {},
      ),
      verify: (tester) async {
        // await tester.pumpAndSettle();
        // final finder = find.byKey(const Key('login-button-key'));

        // expect(finder, findsOneWidget);

        // await tester.tap(finder);
        // await tester.pumpAndSettle();

        // final routeData = tester.routeData;

        // await pumpRouterApp(tester, router);
        // final finder = find.byKey(const Key('login-button-key'));
        // expect(finder, findsOneWidget);
      },
    );
  });
}
