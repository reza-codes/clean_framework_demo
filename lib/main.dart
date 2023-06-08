import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/login/login_provider.dart';
import 'routing/app_router.dart';

void main() {
  runApp(
    AppProviderScope(
      externalInterfaceProviders: [
        loginExternalInterfaceProvider,
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Clean Framework Demo',
      theme: ThemeData(useMaterial3: true),
    );
  }
}
