import 'package:clean_framework/clean_framework.dart';

enum BgColor { white, lightBlue, lightRed }

class HomeEntity extends Entity {
  const HomeEntity({
    this.counter = 0,
    this.bgColor = BgColor.white,
  });

  final int counter;
  final BgColor bgColor;

  @override
  List<Object?> get props => [counter, bgColor];

  @override
  HomeEntity copyWith({
    int? counter,
    BgColor? bgColor,
    Object? error,
  }) {
    return HomeEntity(
      counter: counter ?? this.counter,
      bgColor: bgColor ?? this.bgColor,
    );
  }
}
