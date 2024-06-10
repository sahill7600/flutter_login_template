import 'package:apex_missions/Utils/AppDateFormatters.dart';

class NewsFeedsDataModel {
  String? title;
  String? redirectLink;
  String? createdAt;
  String? date;
  String? time;
  String? guid;
  String? source;
  String? imgSource;

  NewsFeedsDataModel(
      {this.title,
      this.redirectLink,
      this.createdAt,
      this.guid,
      this.source,
      this.date,
      this.time,
      this.imgSource});

  NewsFeedsDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    redirectLink = json['redirect_link'];
    createdAt = json['created_at'];
    date = AppDateFormatters.formatDDMMMYYYY(json['created_at']);
    time = AppDateFormatters.formatHHMM(json['created_at']);
    guid = json['guid'];
    source = json['source'];
    imgSource = json['img_source'];
  }

  static List<NewsFeedsDataModel> fromJsonArray(List<dynamic> transactionList) {
    List<NewsFeedsDataModel> list = transactionList
        .map<NewsFeedsDataModel>((a) => NewsFeedsDataModel.fromJson(a))
        .toList();
    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['redirect_link'] = redirectLink;
    data['created_at'] = createdAt;
    date = AppDateFormatters.formatDDMMMYYYY(data['created_at']);
    time = AppDateFormatters.formatHHMM(data['created_at']);
    data['guid'] = guid;
    data['source'] = source;
    data['img_source'] = imgSource;
    return data;
  }
}
