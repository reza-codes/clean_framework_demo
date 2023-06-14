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
    return const HomeUIOutput();
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
    return entity.copyWith();
  }
}
