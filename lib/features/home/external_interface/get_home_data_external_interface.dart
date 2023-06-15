import 'package:clean_framework/clean_framework.dart';

import '../../../core/requests/data_request.dart';
import '../../../core/responses/data_success_response.dart';

class GetHomeDataExternalInterface extends ExternalInterface<DataRequest, DataSuccessResponse> {
  @override
  void handleRequest() {
    on<DataRequest>(
      (request, send) async {
        send(const DataSuccessResponse(data: {}));
      },
    );
  }

  @override
  FailureResponse onError(Object error) {
    return UnknownFailureResponse(error);
  }
}


// write a test for the external interface
// Path: test/features/home/external_interface/get_home_data_external_interface_test.dart
// Compare this snippet from test/features/login/external_interface/get_random_data_external_interface_test.dart:
// import 'package:clean_framework/clean_framework.dart';
// import 'package:clean_framework_demo/core/dependency_providers.dart';
// import 'package:clean_framework_demo/core/requests/data_request.dart';

// import 'package:clean_framework_demo/features/login/external_interface/get_random_data_external_interface.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('GetRandomDataExternalInterface success', () async {
//     final externalInterface = GetRandomDataExternalInterface();
//     final request = DataRequest();

//     final response = await externalInterface.request(request);

//     expect(response, isA<DataSuccessResponse>());
//   });

//   test('GetRandomDataExternalInterface failure', () async {
//     final externalInterface = GetRandomDataExternalInterface();
//     final request = DataRequest();

//     final response = await externalInterface.request(request);

//     expect(response, isA<UnknownFailureResponse>());
//   });