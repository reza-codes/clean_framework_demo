import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'counter_presenter.dart';
import 'counter_view_model.dart';

class CounterUI extends UI<CounterViewModel> {
  CounterUI({super.key});

  @override
  CounterPresenter create(WidgetBuilder builder) {
    return CounterPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    print("Built from counter ui");
    return Text(
      viewModel.counter.toString(),
      style: const TextStyle(fontSize: 20),
    );
  }
}
