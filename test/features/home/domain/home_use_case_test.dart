import 'dart:ui';

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

    useCaseTest<HomeUseCase, HomeEntity, CounterUIOutput>(
      'setInput reset counter',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(HomeInput(counter: 0));
      },
      expect: () => [
        const CounterUIOutput(counter: 0),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(counter: 0));
      },
    );

    useCaseTest<HomeUseCase, HomeEntity, HomeUIOutput>(
      'setInput setColor white',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(HomeInput(bgColor: BgColor.white));
      },
      expect: () => [
        const HomeUIOutput(bgColor: Color.fromARGB(255, 255, 255, 255)),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(bgColor: BgColor.white));
      },
    );

    useCaseTest<HomeUseCase, HomeEntity, HomeUIOutput>(
      'setInput setColor lightBlue',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(HomeInput(bgColor: BgColor.lightBlue));
      },
      expect: () => [
        const HomeUIOutput(bgColor: Color.fromARGB(255, 183, 218, 255)),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(bgColor: BgColor.lightBlue));
      },
    );

    useCaseTest<HomeUseCase, HomeEntity, HomeUIOutput>(
      'setInput setColor lightRed',
      provider: homeUseCaseProvider,
      execute: (useCase) {
        useCase.setInput(HomeInput(bgColor: BgColor.lightRed));
      },
      expect: () => [
        const HomeUIOutput(bgColor: Color.fromARGB(255, 255, 183, 183)),
      ],
      verify: (useCase) {
        expect(useCase.debugEntity, const HomeEntity(bgColor: BgColor.lightRed));
      },
    );
  });
}
