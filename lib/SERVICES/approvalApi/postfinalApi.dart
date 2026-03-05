import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;

class FinalApprovalApi {
  int rescode = 500;
  static Future<finalpostModel> getData(
    String? itemCode,
    String? serialNum,
  ) async {
    try {
      log("GetOutward body:::${ConstantValues.token.toString()}");
      final responce = await http.post(
        Uri.parse(
            "${URL.queryApi}Inv/v1/DisplaytoSellableApprove"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer ${ConstantValues.token}",
        },
        body: jsonEncode({"itemCode": "$itemCode", "serialNum": "$serialNum"}),
      );
      log("requet::" +
         jsonEncode({"itemCode": "$itemCode", "serialNum": "$serialNum"}));
      log("GetOutward body:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
        return finalpostModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return finalpostModel.exception(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return finalpostModel.issues(e.toString(), 500);
    }
  }
}

class finalpostModel {
  String? exception;
  int? stcode;

  finalpostModel({required this.exception, required this.stcode});
  factory finalpostModel.fromJson(
      Map<String, dynamic> json, int? stcode) {
    return finalpostModel(exception: null, stcode: stcode);
  }
  factory finalpostModel.exception(
      Map<String, dynamic> json, int? stcode) {
    return finalpostModel(
        exception: json['respDesc'], stcode: stcode);
  }
  factory finalpostModel.issues(String? json, int? stcode) {
    return finalpostModel(exception: json, stcode: stcode);
  }
}
