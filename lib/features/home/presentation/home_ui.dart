import 'package:auto_route/auto_route.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_demo/features/home/presentation/ui_widgets/counter/counter_ui.dart';
import 'package:flutter/material.dart';

import 'home_presenter.dart';
import 'home_view_model.dart';
import 'ui_widgets/colored_button/colored_button_widget.dart';

@RoutePage()
class HomeUI extends UI<HomeViewModel> {
  HomeUI({super.key});

  @override
  HomePresenter create(WidgetBuilder builder) {
    return HomePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    print("Built from home ui");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Center(
        heightFactor: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Welcome to home page 😃",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CounterUI(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: viewModel.increment,
                  child: const Text('Increment +'),
                ),
                ElevatedButton(
                  onPressed: viewModel.decrement,
                  child: const Text('Decrement -'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ColoredButtonWidget(),
          ],
        ),
      ),
    );
  }
}
