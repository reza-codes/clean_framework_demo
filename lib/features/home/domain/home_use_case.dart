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
            HomeInputTransfer(),
          ],
        );
}

class HomeUIOutputTransformer extends OutputTransformer<HomeEntity, HomeUIOutput> {
  @override
  HomeUIOutput transform(HomeEntity entity) {
    return const HomeUIOutput();
  }
}

class HomeInputTransfer extends InputTransformer<HomeEntity, HomeInput> {
  @override
  HomeEntity transform(HomeEntity entity, HomeInput input) {
    return entity.copyWith();
  }
}
