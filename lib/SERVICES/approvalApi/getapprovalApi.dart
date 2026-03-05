





import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/MODEL/getApprovalModel/getApprovalModel.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';

class GetApprovalApi {
  int rescode = 500;
  static Future<getapprovehead> getData() async {
    try {
       log("GetOutward body:::${ConstantValues.token.toString()}");
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/DisplayToSellable_ForApproval"),
          headers: {"Authorization": "bearer ${ConstantValues.token}"});
      log("GetOutward body:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");     

      if (responce.statusCode == 200) { 
       
      return  
      getapprovehead.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return 
        getapprovehead.errors(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return 
      getapprovehead.issues(e.toString(), 500);
    }
  }
}
