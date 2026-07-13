import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:http/http.dart' as http;

class Display2sellableFinalApi {
  int rescode = 500;
  static Future<finaldisplay2sellableModel> getData(
      String? itemCode,
      String? serialNum,
      int? serialBatchQty,
      String? boxNo,
      String? productSerialNo) async {
    try {
      log("GetOutward body:::${ConstantValues.token.toString()}");
      final responce = await http.post(
        Uri.parse("${URL.queryApi}Inv/v1/AddDisplay"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "bearer ${ConstantValues.token}",
        },
        body: jsonEncode({
          "itemCode": "$itemCode",
          "serialNum": "$serialNum",
          "serialBatchQty": serialBatchQty,
          "boxNo": boxNo,
          "productSerialNo": "$productSerialNo"
        }),
      );
      log("requet::" +
          jsonEncode({
            "itemCode": "$itemCode",
            "serialNum": "$serialNum",
            "serialBatchQty": serialBatchQty,
            "boxNo": boxNo,
            "productSerialNo": "$productSerialNo"
          }));
      log("GetOutward body:::${responce.body.toString()}");
      log("GetOutward statusCode:::${responce.statusCode.toString()}");

      if (responce.statusCode == 200) {
        return finaldisplay2sellableModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return finaldisplay2sellableModel.exception(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("GetOutwardcatch:::${e.toString()}");
      return finaldisplay2sellableModel.issues(e.toString(), 500);
    }
  }
}

class finaldisplay2sellableModel {
  String? exception;
  int? stcode;

  finaldisplay2sellableModel({required this.exception, required this.stcode});
  factory finaldisplay2sellableModel.fromJson(
      Map<String, dynamic> json, int? stcode) {
    return finaldisplay2sellableModel(exception: null, stcode: stcode);
  }
  factory finaldisplay2sellableModel.exception(
      Map<String, dynamic> json, int? stcode) {
    return finaldisplay2sellableModel(
        exception: json['respDesc'], stcode: stcode);
  }
  factory finaldisplay2sellableModel.issues(String? json, int? stcode) {
    return finaldisplay2sellableModel(exception: json, stcode: stcode);
  }
}
