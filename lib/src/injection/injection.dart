import 'package:get_it/get_it.dart';
import 'package:meals_app/src/service/service_api.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ServiceApi>(ServiceApi());
}
