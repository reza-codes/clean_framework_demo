import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_demo/core/responses/data_success_response.dart';
import 'package:clean_framework_demo/features/login/external_interface/get_random_data_gateway.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetRandomDataGateway tests |', () {
    test('verify request', () async {
      final gateway = GetRandomDataGateway();
      final gatewayOutput = RandomDataGatewayOutput();

      final request = gateway.buildRequest(gatewayOutput);

      expect(request.resource, equals('random'));

      expect(gatewayOutput, RandomDataGatewayOutput());
    });

    test('success', () async {
      final gateway = GetRandomDataGateway()
        ..feedResponse(
          (request) async => const Either.right(
            DataSuccessResponse(
              data: {
                'email': 'example@email.com',
                'password': '1234abc@#!',
              },
            ),
          ),
        );

      final input = await gateway.buildInput(RandomDataGatewayOutput());

      expect(input.isRight, isTrue);

      expect(input.right.email, equals('example@email.com'));
      expect(input.right.password, equals('1234abc@#!'));
    });

    test('failure', () async {
      final gateway = GetRandomDataGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input = await gateway.buildInput(RandomDataGatewayOutput());

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
