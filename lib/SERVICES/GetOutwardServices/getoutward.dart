import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/getoutward.dart';
import 'package:http/http.dart' as http;

class GetOutwardApi {
  int rescode = 500;
  static Future<GetOutwardHeader> getData(String? tobranch) async {
    log("wwww::${URL.queryApi}Inv/v1/GetOutwardDocment?FromBranch=$tobranch&LoginBranch=${ConstantValues.branch}");
    try {
      final responce = await http.get(
          Uri.parse(
               "${URL.queryApi}Inv/v1/GetOutwardDocment?FromBranch=$tobranch&LoginBranch=${ConstantValues.branch}"),
          headers: {"Authorization": "bearer ${ConstantValues.token}"});
      log("GetOutward body:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
        return GetOutwardHeader.fromjson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return GetOutwardHeader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return GetOutwardHeader.issues(e.toString(), 500);
    }                                                                                                                                                                                                                                   
  }


}
