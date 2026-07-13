import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;

class SellableFinalApi {
  int rescode = 500;
  static Future<finalsellableModel> getData(String? itemCode, String? serialNum,
      int? serialBatchQty, String? productSerialNo) async {
    try {
      log("GetOutward body:::${ConstantValues.token.toString()}");
      final responce = await http.post(
        Uri.parse("${URL.queryApi}Inv/v1/AddSellable"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer ${ConstantValues.token}",
        },
        body: jsonEncode({
          "itemCode": "$itemCode",
          "serialNum": "$serialNum",
          "serialBatchQty": serialBatchQty,
          "boxNo": "",
          "productSerialNo": "$productSerialNo"
        }),
      );
      log("FinalsaveApi requet::" +
          jsonEncode({
            "itemCode": "$itemCode",
            "serialNum": "$serialNum",
            "serialBatchQty": serialBatchQty,
            "boxNo": "",
            "productSerialNo": "$productSerialNo"
          }));
      log("FinalsaveApi body:::${responce.body.toString()}");
      log("FinalsaveApi statusCode 200:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
        return finalsellableModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return finalsellableModel.exception(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("FinalsaveApi 500 catch:::${e.toString()}");
      return finalsellableModel.issues(e.toString(), 500);
    }
  }
}

class finalsellableModel {
  String? exception;
  int? stcode;

  finalsellableModel({required this.exception, required this.stcode});
  factory finalsellableModel.fromJson(Map<String, dynamic> json, int? stcode) {
    return finalsellableModel(exception: null, stcode: stcode);
  }
  factory finalsellableModel.exception(Map<String, dynamic> json, int? stcode) {
    return finalsellableModel(exception: json['respDesc'], stcode: stcode);
  }
  factory finalsellableModel.issues(String? json, int? stcode) {
    return finalsellableModel(exception: json, stcode: stcode);
  }
}
