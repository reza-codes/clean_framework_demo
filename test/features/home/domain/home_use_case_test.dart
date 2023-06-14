import 'package:clean_framework_demo/features/home/domain/home_entity.dart';
import 'package:clean_framework_demo/features/home/domain/home_input.dart';
import 'package:clean_framework_demo/features/home/domain/home_ui_output.dart';
import 'package:clean_framework_demo/features/home/domain/home_use_case.dart';
import 'package:clean_framework_demo/features/home/home_provider.dart';
import 'package:clean_framework_test/clean_framework_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeUseCase tests |', () {
    useCaseTest<HomeUseCase, HomeEntity, CounterUIOutput>(
      'increment counter',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.increment();
      },
      expect: () => [
        const CounterUIOutput(counter: 1),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(counter: 1));
      },
    );

    useCaseTest<HomeUseCase, HomeEntity, CounterUIOutput>(
      'decrement counter',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.decrement();
      },
      expect: () => [
        const CounterUIOutput(counter: -1),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(counter: -1));
      },
    );

    useCaseTest<HomeUseCase, HomeEntity, HomeUIOutput>(
      'setInput',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(HomeInput());
      },
      expect: () => [
        const HomeUIOutput(),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity());
      },
    );
  });
}
