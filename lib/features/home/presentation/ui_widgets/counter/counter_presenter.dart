import 'package:clean_framework/clean_framework.dart';

import '../../../domain/home_ui_output.dart';
import '../../../domain/home_use_case.dart';
import '../../../home_provider.dart';
import 'counter_view_model.dart';

class CounterPresenter extends Presenter<CounterViewModel, CounterUIOutput, HomeUseCase> {
  CounterPresenter({
    super.key,
    required super.builder,
  }) : super(provider: homeUseCaseProvider);

  @override
  CounterViewModel createViewModel(HomeUseCase useCase, CounterUIOutput output) {
    return CounterViewModel(
      counter: output.counter,
    );
  }
}
