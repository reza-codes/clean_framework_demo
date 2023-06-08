import 'package:clean_framework/clean_framework.dart';

class HomeEntity extends Entity {
  const HomeEntity();

  @override
  List<Object?> get props => [];

  @override
  HomeEntity copyWith({
    Object? error,
  }) {
    return const HomeEntity();
  }
}
