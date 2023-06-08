import 'package:clean_framework/clean_framework.dart';

import '../domain/home_ui_output.dart';
import '../domain/home_use_case.dart';
import '../home_provider.dart';
import 'home_view_model.dart';

class HomePresenter extends Presenter<HomeViewModel, HomeUIOutput, HomeUseCase> {
  HomePresenter({
    super.key,
    required super.builder,
  }) : super(provider: HomeUseCaseProvider);

  @override
  HomeViewModel createViewModel(HomeUseCase useCase, HomeUIOutput output) {
    return const HomeViewModel();
  }
}