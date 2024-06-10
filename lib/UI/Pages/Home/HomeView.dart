import 'package:apex_missions/Constants/AppColors.dart';
import 'package:apex_missions/Controller/Home/HomeViewController.dart';
import 'package:apex_missions/UI/Widgets/BaseCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseCommonWidget {
  HomeViewController model = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: model,
      initState: (state) {},
      builder: (HomeViewController controller) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: _getBody(),
        );
      },
    );
  }

  Widget _getBody() {
    return Stack(
      children: <Widget>[
        _getBaseContainer(),
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer() {
    return const Center(
      child: Text("Welcome to Home Screen!"),
    );
  }
}
