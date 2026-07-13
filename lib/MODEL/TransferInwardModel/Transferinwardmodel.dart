import 'dart:convert';

class TransferInwardDataModelHeader {
  int? rescode;
  String? execption;
  List<TransferInwardDataModel>? data;
  TransferInwardDataModelHeader({
    required this.data,
    required this.execption,
    required this.rescode,
  });
  factory TransferInwardDataModelHeader.fromJson(
      Map<String, dynamic> jsons, int rescode) {
    if (jsons != null) {
      var Listt = json.decode(jsons['data']) as List;
      List<TransferInwardDataModel> finaldata =
          Listt.map((e) => TransferInwardDataModel.fromJson(e)).toList();
      return TransferInwardDataModelHeader(
          data: finaldata, execption: null, rescode: rescode);
    } else {
      return TransferInwardDataModelHeader(
          data: null, execption: "No Data", rescode: rescode);
    }
  }
  factory TransferInwardDataModelHeader.execption(
      Map<String, dynamic> jsons, int rescode) {
    return TransferInwardDataModelHeader(
        data: null, execption: "API Error", rescode: rescode);
  }
  factory TransferInwardDataModelHeader.issues(String jsons, int rescode) {
    return TransferInwardDataModelHeader(
        data: null, execption: "NetWork Issue", rescode: 500);
  }
}

class TransferInwardDataModel {
  int? TransNo;
  String? Status;
  String? FromBranch;
  String? Remarks;
  String? TransDate;
  TransferInwardDataModel({
    required this.FromBranch,
    required this.Remarks,
    required this.Status,
    required this.TransDate,
    required this.TransNo,
  });
  factory TransferInwardDataModel.fromJson(Map<String, dynamic> jsons) {
    return TransferInwardDataModel(
        FromBranch: jsons["FromBranch"] ?? "",
        Remarks: jsons["Remarks"] ?? "",
        Status: jsons["Status"] ?? "",
        TransDate: jsons["TransDate"] ?? "",
        TransNo: jsons["TransNo"] ?? 0);
  }
}
