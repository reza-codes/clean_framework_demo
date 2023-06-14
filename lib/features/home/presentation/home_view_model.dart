import 'package:clean_framework/clean_framework.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({
    required this.increment,
    required this.decrement,
  }) : super();

  final Function() increment;
  final Function() decrement;

  @override
  List<Object?> get props => [];
}
