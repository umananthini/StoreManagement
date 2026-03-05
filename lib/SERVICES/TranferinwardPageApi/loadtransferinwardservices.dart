import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/MODEL/LoadTransferInwardModel/loadtransferinward.dart';

class LoadTransferInwaedServices{
  int rescode = 500;
  static Future<LoadTransferHeader> getdata(String TransNumber) async {
    log("awaa::"+"${URL.queryApi}Inv/v1/GetInwardDocment?transnum=$TransNumber");
    try{
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/GetInwardDocment?transnum=$TransNumber"),
          headers: {
            "Authorization": "bearer ${ConstantValues.token}",
          });
      log("catch::${responce.body}");
      log("catch::${responce.statusCode}");

      if(responce.statusCode == 200){
        return LoadTransferHeader.fromJson(
            json.decode(responce.body), responce.statusCode);
      }else{
        return LoadTransferHeader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    }catch(e){
      log("catch::${e.toString()}");
      return LoadTransferHeader.issues(e.toString(), 500);
    }
  }
}
