

import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/PurchaseInwModel/PurchaseInwPendingModel.dart';
import 'package:warehousemanagement/MODEL/ReportModel/reportmodel.dart';

class reportservice {
  static Future<ReportmodelPendingDetailheader> getdata(String? date,String? todata) async {
    int resCode = 500;
    try {
      log("${URL.queryApi}Inv/v1/InwardDetails?fromdate=${date}&todate=${todata}&whscode=${ConstantValues.branch}:::ConstantValues.token::" + ConstantValues.token.toString());
      final response = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/InwardDetails?fromdate=${date}&todate=${todata}&whscode=${ConstantValues.branch}"),
          headers: {
            "content-type": "application/json",
            "Authorization": 'bearer ${ConstantValues.token}',
          });
      resCode = response.statusCode;
      log("rescode::" + response.statusCode.toString());
      log("INWres::" + response.body.toString());

      if (response.statusCode == 200) {
        return ReportmodelPendingDetailheader.fromJson(
            json.decode(response.body), response.statusCode);
      } else {
        return ReportmodelPendingDetailheader.issues(
            json.decode(response.body), response.statusCode);
      }
    } catch (e) {
      log("INWres::" + e.toString());
      return ReportmodelPendingDetailheader.error(e.toString(), resCode);
    }
  }
}
