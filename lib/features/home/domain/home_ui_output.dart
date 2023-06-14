import 'package:clean_framework/clean_framework.dart';

class HomeUIOutput extends Output {
  const HomeUIOutput();

  @override
  List<Object?> get props => [];
}

class CounterUIOutput extends Output {
  const CounterUIOutput({
    required this.counter,
  });

  final int counter;

  @override
  List<Object?> get props => [counter];
}
