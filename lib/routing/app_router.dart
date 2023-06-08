import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        Routes.loginPage,
        Routes.homePage,
      ];
}

class Routes {
  // initial route
  static final loginPage = AutoRoute(page: LoginUI.page, initial: true);

  static final homePage = AutoRoute(page: HomeUI.page);
}
