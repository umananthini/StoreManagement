import 'dart:convert';

class serialnumheader {
  int? rescode;
  String? execption;
  List<serialnumber>? serialnumberdata;
  serialnumheader(
      {required this.execption,
      required this.rescode,
      required this.serialnumberdata});
  factory serialnumheader.fromjson(Map<String, dynamic> jsons, int stcode) {
    if (jsons != null) {
      var seriallist = json.decode(jsons['data']) as List;
      List<serialnumber> finalseriallist =
          seriallist.map((e) => serialnumber.fromjson(e)).toList();
      return serialnumheader(
          execption: null, rescode: stcode, serialnumberdata: finalseriallist);
    } else {
      return serialnumheader(
          execption: 'No Data', rescode: stcode, serialnumberdata: null);
    }
  }
  factory serialnumheader.execption(Map<String, dynamic> jsons, int stcode) {
    return serialnumheader(
        execption: "API Error", rescode: stcode, serialnumberdata: null);
  }
  factory serialnumheader.issues(String jsons, int stcode) {
    return serialnumheader(
        execption: "NetWork Error", rescode: 500, serialnumberdata: null);
  }
}

class serialnumber {
  String? AvailSerialNum;
  serialnumber({required this.AvailSerialNum});
  factory serialnumber.fromjson(Map<String, dynamic> jsons) {
    return serialnumber(AvailSerialNum: jsons["AvailSerialNum"]);
  }
}
