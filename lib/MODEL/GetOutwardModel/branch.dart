import 'dart:convert';

class BranchListheader {
  int? stcode;
  String? execption;
  List<BranchList>? BranchListdata;
  BranchListheader(
      {required this.BranchListdata,
      required this.execption,
      required this.stcode});
  factory BranchListheader.fromjson(Map<String, dynamic> jsons, int rescode) {
    if (jsons != null) {
      var Branchdata = json.decode(jsons["data"]) as List;
      List<BranchList> finalBranchdata =
          Branchdata.map((e) => BranchList.fromjson(e)).toList();

      return BranchListheader(
          BranchListdata: finalBranchdata, execption: null, stcode: rescode);
    } else {
      return BranchListheader(
          BranchListdata: null, execption: "No Data", stcode: rescode);
    }
  }
  factory BranchListheader.execption(Map<String, dynamic> jsons, int rescode) {
    return BranchListheader(
        BranchListdata: null, execption: "Api Error", stcode: rescode);
  }
  factory BranchListheader.issues(String jsons, int rescode) {
    return BranchListheader(
        BranchListdata: null, execption: "Net Work Error", stcode: rescode);
  }
}

class BranchList {
  String? ToWhsCode;
  String? WhsName;

  BranchList({
    required this.ToWhsCode,
    required this.WhsName,
  });
  factory BranchList.fromjson(Map<String, dynamic> jsons) {
    return BranchList(
      ToWhsCode: jsons["ToWhsCode"] ?? "",
      WhsName: jsons["WhsName"] ?? "",
    );
  }
}
