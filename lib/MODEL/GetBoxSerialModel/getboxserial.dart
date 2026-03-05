


import 'dart:convert';

class GetboxSerialHeader{
  int?rescode;
  String?execption;
  List<GetboxSerial>? data;
  GetboxSerialHeader({
    required this.data,
    required this.execption,
    required this.rescode
  });
  factory GetboxSerialHeader.fromjson(Map<String,dynamic>jsons,int rescode){
    if(jsons !=null){
var list =json.decode(jsons['data']) as List;
List<GetboxSerial> datalist=list.map((e) => GetboxSerial.fromjson(e)).toList();
return GetboxSerialHeader(
  data: datalist,
   execption: null,
    rescode: rescode);
    }else{
      return GetboxSerialHeader(
  data: null,
   execption: "No Data",
    rescode: rescode);
    }

  }
  factory GetboxSerialHeader.execption(Map<String,dynamic>jsons,int rescode){
    return GetboxSerialHeader(
      data: null, 
      execption: jsons["respDesc"],
       rescode: rescode);
  }
    factory GetboxSerialHeader.issues(String json,int rescode){
    return GetboxSerialHeader(
      data: null, 
      execption: json,
       rescode: rescode);
  }
}


class GetboxSerial{
  String? ItemCode;
  String? ItemName;
  String? DistNumber;
  String? BoxNo;
  String?Division;

  GetboxSerial({
    required this.ItemCode,
    required this.ItemName,
    required this.DistNumber,
    required this.BoxNo,
    required this.Division,

  });
  factory GetboxSerial.fromjson(Map<String,dynamic>jsons){
    return GetboxSerial(
      ItemCode: jsons['ItemCode']??"", 
      ItemName: jsons['ItemName']??"", 
      DistNumber: jsons['DistNumber']??"", 
      BoxNo: jsons['BoxNo']??"",
      Division: jsons["Division"]??"",
      );
  }
}