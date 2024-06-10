import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Constants/Localization/Language.dart';
import 'package:apex_missions/Constants/PrefKeys.dart';
import 'package:apex_missions/DataHandler/Local/storage_helper.dart';
import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/Routing/Router.dart';
import 'package:apex_missions/Services/NavigationService.dart';
import 'package:apex_missions/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init();

  setupLocator();
  debugPrint(
      "Is login >>>> ${StorageHelper.instance.getBoolValue(PrefKeys.isLogin)}");
  runApp(const MyApp(defaultRoute: splashViewRoute));
  // runApp(const MyApp(defaultRoute: homeViewRoute));
}

class MyApp extends StatelessWidget {
  final String defaultRoute;

  const MyApp({Key? key, required this.defaultRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: defaultRoute,
      translations: Languages(),
      navigatorKey: NavigationService().navigationKey,
      onGenerateRoute: generateRoute,
      title: 'Apex Missions',
      locale: AppLanguagesConstant.defaultLocalization,
      fallbackLocale: AppLanguagesConstant.defaultLocalization,
      debugShowCheckedModeBanner: false,
      // theme: appTheme(),
    );
  }
}
