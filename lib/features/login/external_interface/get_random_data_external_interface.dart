import 'package:clean_framework/clean_framework.dart';
import 'package:dio/dio.dart';

import '../../../core/requests/data_request.dart';
import '../../../core/responses/data_success_response.dart';

class GetRandomDataExternalInterface extends ExternalInterface<DataRequest, DataSuccessResponse> {
  GetRandomDataExternalInterface({
    Dio? dio,
  }) : _dio = dio ?? Dio(BaseOptions(baseUrl: 'http://127.0.0.1:3001/'));

  final Dio _dio;

  @override
  void handleRequest() {
    on<DataRequest>(
      (request, send) async {
        final response = await _dio.get<Map<String, dynamic>>(
          request.resource,
          queryParameters: request.queryParams,
        );

        final data = response.data!;

        send(DataSuccessResponse(data: data));
      },
    );
  }

  @override
  FailureResponse onError(Object error) {
    return UnknownFailureResponse(error);
  }
}
