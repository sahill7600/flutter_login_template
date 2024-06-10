import 'package:apex_missions/Routing/RouteNames.dart';
import 'package:apex_missions/UI/Pages/Forgot%20Password/ForgotPasswordView.dart';
import 'package:apex_missions/UI/Pages/Home/BottomNavigationBarView.dart';
import 'package:apex_missions/UI/Pages/Login/LoginView.dart';
import 'package:apex_missions/UI/Pages/Register/RegisterView.dart';
import 'package:apex_missions/UI/Pages/Splash/SplashView.dart';
import 'package:apex_missions/ViewBindings/Forgot%20Password/ForgotPasswordViewBindings.dart';
import 'package:apex_missions/ViewBindings/Home/BottomNavigationBarViewBindings.dart';
import 'package:apex_missions/ViewBindings/Login/LoginViewBindings.dart';
import 'package:apex_missions/ViewBindings/Register/RegisterViewBindings.dart';
import 'package:apex_missions/ViewBindings/Splash/SplashViewBindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case splashViewRoute:
      return getPageRoutes(
          routeName: splashViewRoute,
          settings: settings,
          // page: () => const HomeView(),
          page: () => SplashView(),
          bindings: [SplashViewBindings()]);

    case loginViewRoute:
      return getPageRoutes(
          routeName: loginViewRoute,
          settings: settings,
          page: () => const LoginView(),
          bindings: [LoginViewBindings()]);

    case homeViewRoute:
      return getPageRoutes(
          routeName: homeViewRoute,
          settings: settings,
          // page: () => const HomeView(),
          page: () => BottomNavigationBarView(
                index:
                    settings.arguments == null ? 0 : settings.arguments as int,
              ),
          bindings: [BottomNavigationBarViewBindings()]);


    case registerViewRoute:
      return getPageRoutes(
          routeName: registerViewRoute,
          settings: settings,
          page: () => const RegisterView(),
          bindings: [RegisterViewBindings()]);

    case forgotPasswordViewRoute:
      return getPageRoutes(
          routeName: forgotPasswordViewRoute,
          settings: settings,
          page: () => const ForgotPasswordView(),
          bindings: [ForgotPasswordViewBindings()]);

    default:
      return GetPageRoute(
        page: () => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

/// Use This Method To Call Pages
PageRoute getPageRoutes(
    {required String routeName,
    required Function page,
    required RouteSettings settings,
    List<Bindings>? bindings}) {
  return GetPageRoute(
    page: () => page(),
    // transition: Transition.rightToLeft,
    routeName: routeName,
    settings: settings,
    bindings: bindings,
  );
}
//
// /// Assign This Function to Set The URL Slugs
// void setUrlSlug({String? slug}) {
//   SystemChrome.setApplicationSwitcherDescription(
//     ApplicationSwitcherDescription(
//       label: slug,
//     ),
//   );
// }
