import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/serialnum.dart';
import 'package:http/http.dart' as http;

class SerialnumApi {
  int rescode = 500;
  static Future<serialnumheader> getdata(
      String? branch, String? itemcode) async {
    try {
      log("${URL.queryApi}Inv/v1/SerialNum:::kkk::${ConstantValues.token}" +
          "");
      log("ajsja::" +
          jsonEncode({
            "whscode": "${ConstantValues.branch}",
            "itemCode": "${itemcode}"
          }));
      final responce = await http.post(
        Uri.parse("${URL.queryApi}Inv/v1/SerialNum"),
        headers: {
          "Authorization": "bearer ${ConstantValues.token}",
          "Content-Type": "application/json"
        },
        body: jsonEncode(
            {"whscode": "${ConstantValues.branch}", "itemCode": "${itemcode}"}),
      );
      log("Serialnum body :::${responce.body}");
      log("Serialnum body :::${responce.statusCode}");

      if (responce.statusCode == 200) {
        return serialnumheader.fromjson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return serialnumheader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("Serialnum Catch :::${e.toString()}");
      return serialnumheader.issues(e.toString(), 500);
    }
  }
}
