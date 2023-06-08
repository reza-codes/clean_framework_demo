// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:clean_framework_demo/features/home/presentation/home_ui.dart'
    as _i1;
import 'package:clean_framework_demo/features/login/presentation/login_ui.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeUI.name: (routeData) {
      final args =
          routeData.argsAs<HomeUIArgs>(orElse: () => const HomeUIArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeUI(key: args.key),
      );
    },
    LoginUI.name: (routeData) {
      final args =
          routeData.argsAs<LoginUIArgs>(orElse: () => const LoginUIArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginUI(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeUI]
class HomeUI extends _i3.PageRouteInfo<HomeUIArgs> {
  HomeUI({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomeUI.name,
          args: HomeUIArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeUI';

  static const _i3.PageInfo<HomeUIArgs> page = _i3.PageInfo<HomeUIArgs>(name);
}

class HomeUIArgs {
  const HomeUIArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'HomeUIArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginUI]
class LoginUI extends _i3.PageRouteInfo<LoginUIArgs> {
  LoginUI({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          LoginUI.name,
          args: LoginUIArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginUI';

  static const _i3.PageInfo<LoginUIArgs> page = _i3.PageInfo<LoginUIArgs>(name);
}

class LoginUIArgs {
  const LoginUIArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'LoginUIArgs{key: $key}';
  }
}
