import 'package:clean_framework/clean_framework.dart';

import 'domain/home_use_case.dart';
import 'external_interface/get_home_data_external_interface.dart';
import 'external_interface/home_gateway.dart';

final homeUseCaseProvider = UseCaseProvider(HomeUseCase.new);

final homeGatewayProvider = GatewayProvider(
  HomeDataGateway.new,
  useCases: [
    homeUseCaseProvider,
  ],
);

final homeExternalInterfaceProvider = ExternalInterfaceProvider(
  GetHomeDataExternalInterface.new,
  gateways: [
    homeGatewayProvider,
  ],
);
