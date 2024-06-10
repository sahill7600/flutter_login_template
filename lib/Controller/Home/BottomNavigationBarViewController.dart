import 'package:apex_missions/Controller/BaseController.dart';
import 'package:apex_missions/UI/Pages/AboutView.dart';
import 'package:apex_missions/UI/Pages/ContactView.dart';
import 'package:apex_missions/UI/Pages/Home/HomeView.dart';

class BottomNavigationBarViewController extends BaseController {
  final pages = [
    const HomeView(),
    const AboutView(),
    const ContactView(),
  ];

  String? version = "";
}
