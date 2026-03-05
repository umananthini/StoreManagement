import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/Requestmodel/requestApprovalModel.dart';
import 'package:warehousemanagement/MODEL/Requestmodel/request_model.dart';

class RequestListApi{
  int rescode = 500;
  static Future<RequestModel> getData() async {
    try {

      final responce = await http.post(
          Uri.parse(
              "http://tvcpos.sapcloudcenter.in/TICK/Services/Tick.svc/GetCReqts"),
          headers: {
            "Content-Type": "application/json"},
            body: jsonEncode(
              {
      "DeviceCode": "TVCELAPRHO38",
      "IMEINum": "4c957af8cbe3410f",
     "ResCode": "",
    "Response": ""
}
            )
            
            );
    print("ReuestBody:${json.decode(responce.body)}");

      if (responce.statusCode == 200) { 
   
      return  
      RequestModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return 
        RequestModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("RequestModel:::${e.toString()}");
      return 
      RequestModel.issues(e.toString(), 500);
    }
  }




  static Future<RequestApprovalModel> getApprovalData(String cardCode,String value,String id,String sp) async {
    try {
   log(jsonEncode(
       {
    "CardCode": cardCode,
    "CreditVal": value,
    "DeviceCode": ConstantValues.constantdevicecode,
    "IMEI": "IMEI",
    "IsApproval": "Y",
    "RequestID": id,
    "ResCode": "",
    "Response": "",
    "SP_Name": sp
}
            ));

      final responce = await http.post(
          Uri.parse(
              "http://tvcpos.sapcloudcenter.in/TICK/Services/Tick.svc/CA"),
          headers: {
            "Content-Type": "application/json"},
            body: jsonEncode(
       {
    "CardCode": cardCode,
    "CreditVal": value,
    "DeviceCode": ConstantValues.constantdevicecode,
    "IMEI": "IMEI",
    "IsApproval": "Y",
    "RequestID": id,
    "ResCode": "",
    "Response": "",
    "SP_Name": sp
}
            )
            
            );
    print("getApprovalData:${json.decode(responce.body)}");

      if (responce.statusCode == 200) { 
   
      return  
      RequestApprovalModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return 
        RequestApprovalModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("getApprovalData:::${e.toString()}");
      return 
      RequestApprovalModel();
    }
  }



static Future<RequestApprovalModel> getRejectData(String cardCode,String value,String id,String sp) async {
    try {
   

      final responce = await http.post(
          Uri.parse(
              "http://tvcpos.sapcloudcenter.in/TICK/Services/Tick.svc/CA"),
          headers: {
            "Content-Type": "application/json"},
            body: jsonEncode(
       {
    "CardCode": cardCode,
    "CreditVal": value,
    "DeviceCode": ConstantValues.constantdevicecode,
    "IMEI": "IMEI",
    "IsApproval": "N",
    "RequestID": id,
    "ResCode": "",
    "Response": "",
    "SP_Name": sp
}
            )
            
            );
    print("getRejectData:${json.decode(responce.body)}");

      if (responce.statusCode == 200) { 
   
      return  
      RequestApprovalModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return 
        RequestApprovalModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("getRejectData:::${e.toString()}");
      return 
      RequestApprovalModel();
    }
  }
 
  
}



