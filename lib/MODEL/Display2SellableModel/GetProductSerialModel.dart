




import 'dart:convert';

class GetProductSerialHeader{
  int?rescode;
  String?execption;
  List<GetProductSerial>? data;
  GetProductSerialHeader({
    required this.data,
    required this.execption,
    required this.rescode
  });
  factory GetProductSerialHeader.fromjson(Map<String,dynamic>jsons,int rescode){
    if(jsons !=null){
var list =json.decode(jsons['data']) as List;
List<GetProductSerial> datalist=list.map((e) => GetProductSerial.fromjson(e)).toList();
return GetProductSerialHeader(
  data: datalist,
   execption: null,
    rescode: rescode);
    }else{
      return GetProductSerialHeader(
  data: null,
   execption: "No Data",
    rescode: rescode);
    }

  }
  factory GetProductSerialHeader.execption(Map<String,dynamic>jsons,int rescode){
    return GetProductSerialHeader(
      data: null, 
      execption: "API Error",
       rescode: rescode);
  }
    factory GetProductSerialHeader.issues(String json,int rescode){
    return GetProductSerialHeader(
      data: null, 
      execption: "NetWork Error",
       rescode: rescode);
  }
}


class GetProductSerial{
  String? ItemCode;
  String? ItemName;
  String? DistNumber;
  String? BoxNo;

  GetProductSerial({
    required this.ItemCode,
    required this.ItemName,
    required this.DistNumber,
    required this.BoxNo,

  });
  factory GetProductSerial.fromjson(Map<String,dynamic>jsons){
    return GetProductSerial(
      ItemCode: jsons['ItemCode']??"", 
      ItemName: jsons['ItemName']??"", 
      DistNumber: jsons['DistNumber']??"", 
      BoxNo: jsons['BoxNo']??""
      );
  }
}