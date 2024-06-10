
class LoginArgumentModel {
  String? mobile;
  String? email;
  String? displayName;
  String? fName;
  String? lName;

  LoginArgumentModel(
      {this.mobile, this.email, this.displayName, this.fName,this.lName});

  LoginArgumentModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
    displayName = json['displayName'];
    fName = json['fName'];
    lName = json['lName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['email'] = email;
    data['displayName'] = displayName;
    data['fName'] = fName;
    data['lName'] = lName;
    return data;
  }
}
