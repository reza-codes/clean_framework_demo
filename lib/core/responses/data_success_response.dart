import 'package:clean_framework/clean_framework.dart';

class DataSuccessResponse extends SuccessResponse {
  const DataSuccessResponse({required this.data});

  final Map<String, dynamic> data;
}
