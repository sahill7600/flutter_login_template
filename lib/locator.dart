import 'package:apex_missions/Services/ApiService.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  await ApiService.init();
}
