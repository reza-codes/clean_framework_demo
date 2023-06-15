import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';

import 'home_entity.dart';
import 'home_input.dart';
import 'home_ui_output.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [
            HomeUIOutputTransformer(),
            CounterUIOutputTransformer(),
            HomeInputTransfer(),
          ],
        );

  void increment() => entity = entity.copyWith(counter: entity.counter + 1);

  void decrement() => entity = entity.copyWith(counter: entity.counter - 1);
}

class HomeUIOutputTransformer extends OutputTransformer<HomeEntity, HomeUIOutput> {
  @override
  HomeUIOutput transform(HomeEntity entity) {
    late Color bgColor;

    switch (entity.bgColor) {
      case BgColor.white:
        bgColor = const Color.fromARGB(255, 255, 255, 255);
        break;
      case BgColor.lightBlue:
        bgColor = const Color.fromARGB(255, 183, 218, 255);
        break;
      case BgColor.lightRed:
        bgColor = const Color.fromARGB(255, 255, 183, 183);
        break;
      default:
    }

    return HomeUIOutput(
      bgColor: bgColor,
    );
  }
}

class CounterUIOutputTransformer extends OutputTransformer<HomeEntity, CounterUIOutput> {
  @override
  CounterUIOutput transform(HomeEntity entity) {
    return CounterUIOutput(
      counter: entity.counter,
    );
  }
}

class HomeInputTransfer extends InputTransformer<HomeEntity, HomeInput> {
  @override
  HomeEntity transform(HomeEntity entity, HomeInput input) {
    return entity.copyWith(
      counter: input.counter,
      bgColor: input.bgColor,
    );
  }
}
