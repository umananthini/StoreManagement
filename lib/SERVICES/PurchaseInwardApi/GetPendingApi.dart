import 'dart:convert';
import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/PurchaseInwModel/PurchaseInwPendingModel.dart';

class purchasePendingInwardApi {
  static Future<PurchaseInwPendingModel> getdata() async {
    int resCode = 500;
    try {
      log("ConstantValues.token::" + ConstantValues.token.toString());
      final response = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/LoadOpenPurchaseOrder?whscode=${ConstantValues.branch}&Fromdate=2024-11-10&Todate=${Config.currentDate()}"),    
              // ${Config.currentDate1()}
          headers: {
            "content-type": "application/json",
            "Authorization": 'bearer ${ConstantValues.token}',
          });
      resCode = response.statusCode;
      log("rescode::" + response.statusCode.toString());
      log("INWres::" + response.body.toString());

      if (response.statusCode == 200) {
        return PurchaseInwPendingModel.fromJson(
            json.decode(response.body), response.statusCode);
      } else {
        return PurchaseInwPendingModel.issues(
            json.decode(response.body), response.statusCode);
      }
    } catch (e) {
      log("INWres::" + e.toString());
      return PurchaseInwPendingModel.error(e.toString(), resCode);
    }
  }
}







