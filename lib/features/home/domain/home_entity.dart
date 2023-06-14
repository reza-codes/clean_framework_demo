import 'package:clean_framework/clean_framework.dart';

class HomeEntity extends Entity {
  const HomeEntity({
    this.counter = 0,
  });

  final int counter;

  @override
  List<Object?> get props => [counter];

  @override
  HomeEntity copyWith({
    int? counter,
    Object? error,
  }) {
    return HomeEntity(
      counter: counter ?? this.counter,
    );
  }
}
