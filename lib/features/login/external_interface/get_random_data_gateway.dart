import 'package:clean_framework/clean_framework.dart';

import '../../../core/requests/data_request.dart';
import '../../../core/responses/data_success_response.dart';

class GetRandomDataGateway extends Gateway<RandomDataGatewayOutput, RandomDataRequest, DataSuccessResponse,
    LoginDataRandomGatewayInput> {
  @override
  RandomDataRequest buildRequest(RandomDataGatewayOutput output) {
    return RandomDataRequest();
  }

  @override
  LoginDataRandomGatewayInput onSuccess(DataSuccessResponse response) {
    return LoginDataRandomGatewayInput(
      email: response.data['email'],
      password: response.data['password'],
    );
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }
}

class RandomDataRequest extends DataRequest {
  @override
  String get resource => 'random';
}

class RandomDataGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class LoginDataRandomGatewayInput extends SuccessInput {
  const LoginDataRandomGatewayInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
