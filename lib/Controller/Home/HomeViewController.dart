import 'dart:developer';

import 'package:apex_missions/Constants/Enums/ViewState.dart';
import 'package:apex_missions/Controller/BaseController.dart';
import 'package:apex_missions/DataHandler/Network/APIEndpoints.dart';
import 'package:apex_missions/DataHandler/Network/Utils/ErrorParsingModel.dart';
import 'package:apex_missions/Model/API/NewsFeedsDataModel.dart';
import 'package:apex_missions/Services/ApiService.dart';

class HomeViewController extends BaseController {
  List<NewsFeedsDataModel> feedList = [];

  @override
  void onInit() {
    super.onInit();
    // getNewsFeeds();
  }

  /// TODO: here below code for GET method API calling
  void getNewsFeeds() async {
    setLoaderState(ViewStateEnum.busy);
    await ApiService.getRequest(
      url: "${APIEndpoints.newsFeedsUrl}?size=3",
      hasToken: true,
      onSuccess: (Map newsData) {
        log("News data is >>>>> $newsData");
        if (newsData != null && newsData['data'] != null) {
          feedList = NewsFeedsDataModel.fromJsonArray(newsData['data']['data']);
        }
        setLoaderState(ViewStateEnum.idle);
      },
      onError: (ErrorParsingModel error) {
        setLoaderState(ViewStateEnum.idle);
        showMessageInSnackBar(error.message!, true);
        print("Error is >>> ${error.message}");
      },
    );
    update();
  }
}
