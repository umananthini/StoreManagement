

import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/MODEL/GetBoxSerialModel/getboxserial.dart';

class GetBoxDetailsSerialApi {
  int rescode = 500;
  static Future<GetboxSerialHeader> getData(String? serialnum) async {
    try {
       log("GetOutward body:::${"${URL.queryApi}Inv/v1/GetSerialAvailable?whscode=${ConstantValues.branch}&serialnum=$serialnum"}fff::${ConstantValues.token.toString()}");
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/GetSerialAvailable?whscode=${ConstantValues.branch}&serialnum=$serialnum"),
          headers: {"Authorization": "bearer ${ConstantValues.token}"});
      log("GetOutward bodyyy:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
       
      return  GetboxSerialHeader.fromjson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return 
        GetboxSerialHeader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return
      GetboxSerialHeader.issues(e.toString(), 500);
    }
  }
}
