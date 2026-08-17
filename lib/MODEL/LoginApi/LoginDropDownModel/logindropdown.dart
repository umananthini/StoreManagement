import 'dart:convert';

class LoginDropDownHeader {
  int? rescode;
  String? execption;
  List<LoginDropDownModel>? data;
  LoginDropDownHeader({
    required this.data,
    required this.execption,
    required this.rescode,
  });
  factory LoginDropDownHeader.fromJson(
      Map<String, dynamic> jsons, int rescode) {
    if (jsons != null) {
      var Listts = json.decode(jsons["data"]) as List;
      List<LoginDropDownModel> finalLists =
          Listts.map((e) => LoginDropDownModel.fromJson(e)).toList();
      return LoginDropDownHeader(
          data: finalLists, execption: null, rescode: rescode);
    } else {
      return LoginDropDownHeader(
          data: null, execption: "No Data", rescode: rescode);
    }
  }
  factory LoginDropDownHeader.execption(
      Map<String, dynamic> jsons, int rescode) {
    return LoginDropDownHeader(
        data: null, execption: "API Error", rescode: rescode);
  }
  factory LoginDropDownHeader.issues(String jsons, int rescode) {
    return LoginDropDownHeader(
        data: null, execption: "Network Issue", rescode: 500);
  }
}

class LoginDropDownModel {
  String? CompanyName;
  String? Database;
  LoginDropDownModel({required this.CompanyName, required this.Database});
  factory LoginDropDownModel.fromJson(Map<String, dynamic> jsons) {
    return LoginDropDownModel(
        CompanyName: jsons["CompanyName"] ?? "",
        Database: jsons["Database"] ?? "");
  }
}
