import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';

import '../domain/home_entity.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({
    required this.increment,
    required this.decrement,
    required this.reset,
    required this.setColor,
    required this.bgColor,
  }) : super();

  final Function() increment;
  final Function() decrement;
  final void Function(int counter) reset;
  final void Function(BgColor bgColor) setColor;
  final Color bgColor;

  @override
  List<Object?> get props => [bgColor];
}
