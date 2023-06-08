import 'package:clean_framework/clean_framework.dart';

import 'external_interface/get_random_data_external_interface.dart';
import 'external_interface/get_random_data_gateway.dart';
import 'domain/login_use_case.dart';

final loginUseCaseProvider = UseCaseProvider(LoginUseCase.new);

final loginGatewayProvider = GatewayProvider(
  GetRandomDataGateway.new,
  useCases: [
    loginUseCaseProvider,
  ],
);

final loginExternalInterfaceProvider = ExternalInterfaceProvider(
  GetRandomDataExternalInterface.new,
  gateways: [
    loginGatewayProvider,
  ],
);
