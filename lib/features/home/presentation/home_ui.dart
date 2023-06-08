import 'package:auto_route/auto_route.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'home_presenter.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeUI extends UI<HomeViewModel> {
  HomeUI({super.key});

  @override
  HomePresenter create(WidgetBuilder builder) {
    return HomePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: const Center(
        heightFactor: 2,
        child: Text(
          "Welcome to home page 😃",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
