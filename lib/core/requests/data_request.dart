import 'package:clean_framework/clean_framework.dart';

abstract class MapRequest extends Request {
  Map<String, dynamic> get queryParams => {};
}

abstract class DataRequest extends MapRequest {
  String get resource;
}
