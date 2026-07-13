import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/MODEL/Display2SellableModel/GetProductSerialModel.dart';

class GetProductSerialApi {
  int rescode = 500;
  static Future<GetProductSerialHeader> getData(String? serialnum) async {
    try {
      log("GetOutward body:::${ConstantValues.token.toString()}");
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/GetProductSerialAvailable?whscode=${ConstantValues.branch}&serialnum=$serialnum"),
          headers: {"Authorization": "bearer ${ConstantValues.token}"});
      log("GetOutward body:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
        return GetProductSerialHeader.fromjson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return GetProductSerialHeader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return GetProductSerialHeader.issues(e.toString(), 500);
    }
  }
}
