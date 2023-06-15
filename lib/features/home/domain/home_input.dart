import 'package:clean_framework/clean_framework.dart';

import 'home_entity.dart';

class HomeInput extends Input {
  HomeInput({
    this.counter,
    this.bgColor,
  });

  final int? counter;
  final BgColor? bgColor;
}
