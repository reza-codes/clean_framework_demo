import 'package:clean_framework/clean_framework.dart';

import '../../../core/dependency_providers.dart';
import '../../../core/requests/data_request.dart';
import '../../../core/responses/data_success_response.dart';

class GetRandomDataExternalInterface extends ExternalInterface<DataRequest, DataSuccessResponse> {
  @override
  void handleRequest() {
    final client = locate(restClientProvider);
    on<DataRequest>(
      (request, send) async {
        final response = await client.get<Map<String, dynamic>>(
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
