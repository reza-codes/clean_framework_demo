import 'package:clean_framework/clean_framework.dart';
import 'package:dio/dio.dart';

final restClientProvider = DependencyProvider(
  (_) => Dio(BaseOptions(baseUrl: 'http://127.0.0.1:3001/')),
);
