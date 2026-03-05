import 'dart:convert';

class GetOutwardHeader {
  int? stcode;
  String? execption;
  List<GetOutWardModel>? Data;
  GetOutwardHeader(
      {required this.Data, required this.execption, required this.stcode});
  factory GetOutwardHeader.fromjson(Map<String, dynamic> jsons, int stcode) {
    if (jsons != null) {
      var dataList = json.decode(jsons["data"]) as List;
      List<GetOutWardModel> finalDataList =
          dataList.map((e) => GetOutWardModel.fromjson(e)).toList();
      return GetOutwardHeader(
          Data: finalDataList, execption: null, stcode: stcode);
    } else {
      return GetOutwardHeader(Data: null, execption: "No Data", stcode: stcode);
    }
  }
  factory GetOutwardHeader.execption(Map<String, dynamic> jsons, int stcode) {
    return GetOutwardHeader(Data: null, execption: "Api Error", stcode: stcode);
  }
  factory GetOutwardHeader.issues(String json, int stcode) {
    return GetOutwardHeader(
        Data: null, execption: "Net Work Error", stcode: 500);
  }
}

class GetOutWardModel {
  int? TransNo;
  int? BaseEntry;
  String? ItemDetails;
  int? baseline;
  double? ReqQty;
  double? InStock;
  String? ItemCode;
  String? TransDate;
  String? ManageBy;

  GetOutWardModel({
    required this.BaseEntry,
    required this.baseline,
    required this.InStock,
    required this.ItemCode,
    required this.ItemDetails,
    required this.ReqQty,
    required this.TransDate,
    required this.TransNo,
    required this.ManageBy
  });
  factory GetOutWardModel.fromjson(Map<String, dynamic> jsons) {
    return GetOutWardModel(
        baseline: jsons["baseline"] ?? 0,
        BaseEntry: jsons["BaseEntry"] ?? 0,
        InStock: jsons["InStock"] ?? 0.0,
        ItemCode: jsons["ItemCode"] ?? "",
        ItemDetails: jsons["ItemDetails"] ?? "",
        ReqQty: jsons["ReqQty"] ?? 0.0,
        TransDate: jsons["TransDate"] ?? "",
        TransNo: jsons["TransNo"] ?? 0,
        ManageBy: jsons["ManageBy"]
        );
   
  }
}
