import 'dart:io';

import 'package:clean_framework/clean_framework.dart' hide Response;
import 'package:clean_framework_demo/core/dependency_providers.dart';
import 'package:clean_framework_demo/core/requests/data_request.dart';
import 'package:clean_framework_demo/features/login/login_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('GetRandomDataExternalInterface tests |', () {
    test('get request success', () async {
      final container = ProviderContainer(
        overrides: [
          restClientProvider.overrideWith(DioMock()),
        ],
      );

      final interface = loginExternalInterfaceProvider.read(container);
      final dio = restClientProvider.read(container);

      when(
        () => dio.get<Map<String, dynamic>>(
          'test/random',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: {
            'email': 'example@email.com',
            'password': '123abc@!',
          },
          requestOptions: RequestOptions(path: 'test/random'),
        ),
      );

      final result = await interface.request(TestRandomDataRequest());
      expect(result.isRight, isTrue);
      expect(
          result.right.data,
          equals({
            'email': 'example@email.com',
            'password': '123abc@!',
          }));
    });

    test('get request failure', () async {
      final container = ProviderContainer(
        overrides: [
          restClientProvider.overrideWith(DioMock()),
        ],
      );

      final interface = loginExternalInterfaceProvider.read(container);
      final dio = restClientProvider.read(container);

      when(
        () => dio.get<Map<String, dynamic>>(
          'test/random',
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(const HttpException('No Internet'));

      final result = await interface.request(TestRandomDataRequest());

      expect(result.isLeft, isTrue);
      expect(
        result.left.message,
        equals(const HttpException('No Internet').toString()),
      );
    });
  });
}

class DioMock extends Mock implements Dio {}

class TestRandomDataRequest extends DataRequest {
  @override
  String get resource => 'test/random';
}
