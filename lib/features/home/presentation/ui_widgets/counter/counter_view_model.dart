import 'package:clean_framework/clean_framework.dart';

class CounterViewModel extends ViewModel {
  const CounterViewModel({
    required this.counter,
  }) : super();

  final int counter;

  @override
  List<Object?> get props => [];
}
