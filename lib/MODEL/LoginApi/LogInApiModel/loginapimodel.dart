import 'dart:developer';

class LoginmodelHeader {
  int? rescode;
  String? execption;
  LoginModelData? loginitems;

  LoginmodelHeader({
    required this.execption,
    required this.loginitems,
    required this.rescode,
  });

  factory LoginmodelHeader.fromJson(Map<String, dynamic> jsons, int rescode) {
    log("jsons:::${jsons}");
    return LoginmodelHeader(
        execption: null,
        loginitems: LoginModelData.fromJson(jsons),
        rescode: rescode);
  }
  factory LoginmodelHeader.issues(Map<String, dynamic> jsons, int rescode) {
    return LoginmodelHeader(
        execption: jsons['respDesc'], loginitems: null, rescode: rescode);
  }
  factory LoginmodelHeader.error(String exec, int rescode) {
    return LoginmodelHeader(
        execption: exec, loginitems: null, rescode: rescode);
  }
}

class LoginModelData {
  String? licencekey;

  String Username;

  String UserCode;
  String SAPDb;
  String Branch;
  String FcmToken;
  String devicecode;
  String? IsApprover;

  LoginModelData(
      {required this.IsApprover,
      required this.licencekey,
      required this.Branch,
      required this.FcmToken,
      required this.SAPDb,
      required this.UserCode,
      required this.Username,
      required this.devicecode});

  factory LoginModelData.fromJson(Map<String, dynamic> json) {
    return LoginModelData(
        IsApprover: json['IsApprover'] ?? '',
        licencekey: json[
                'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'] ??
            '',
        Branch: json['Branch'] ?? '',
        FcmToken: json['FcmToken'] ?? '',
        SAPDb: json['SAPDb'] ?? '',
        UserCode: json['UserCode'] ?? '',
        Username: json['Username'] ?? '',
        devicecode: json['DeviceCode'] ?? '');
  }
}
