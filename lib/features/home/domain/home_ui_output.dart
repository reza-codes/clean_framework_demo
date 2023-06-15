import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';

class HomeUIOutput extends Output {
  const HomeUIOutput({
    required this.bgColor,
  });

  final Color bgColor;

  @override
  List<Object?> get props => [bgColor];
}

class CounterUIOutput extends Output {
  const CounterUIOutput({
    required this.counter,
  });

  final int counter;

  @override
  List<Object?> get props => [counter];
}
