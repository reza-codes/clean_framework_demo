import 'package:clean_framework/clean_framework.dart';

import '../../../core/requests/data_request.dart';
import '../../../core/responses/data_success_response.dart';

class HomeDataGateway
    extends Gateway<HomeGatewayOutput, HomeDataRequest, DataSuccessResponse, HomeDataGatewayInput> {
  @override
  HomeDataRequest buildRequest(HomeGatewayOutput output) {
    return HomeDataRequest();
  }

  @override
  HomeDataGatewayInput onSuccess(DataSuccessResponse response) {
    return const HomeDataGatewayInput();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }
}

class HomeDataRequest extends DataRequest {
  @override
  String get resource => 'home';
}

class HomeGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class HomeDataGatewayInput extends SuccessInput {
  const HomeDataGatewayInput();
}
