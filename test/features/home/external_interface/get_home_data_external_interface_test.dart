import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_demo/core/requests/data_request.dart';
import 'package:clean_framework_demo/features/home/home_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetHomeDataExternalInterface tests |', () {
    test('get request success', () async {
      final container = ProviderContainer();

      final interface = homeExternalInterfaceProvider.read(container);

      final result = await interface.request(TestHomeDataRequest());
      expect(result.isRight, isTrue);
      expect(result.right.data, equals({}));
    });

    // test('get request failure', () async {
    //   final container = ProviderContainer();

    //   final interface = homeExternalInterfaceProvider.read(container);

    //   final result = await interface.request(TestHomeDataRequest());

    //   expect(result.isLeft, isTrue);
    //   expect(
    //     result.left.message,
    //     equals(const HttpException('No Internet').toString()),
    //   );
    // });
  });
}

class TestHomeDataRequest extends DataRequest {
  @override
  String get resource => '';
}
