import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/PAGES/PurchaseInward1/PurchaseInwardSecondPage.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

class savefinalPurchaseInwApi {
  static Future<finalsaveModel> getdata(
    List<ltPurinwitem> itemlist,
    String? cardcode,
    String? cardname,
    String? numAtCard,
    String? docType,
    String? docDate,
    double? docTotal,
    String? reference1,
    String? reference2,
    String? taxDate,
    String towhse,
    String? Comments,
    List<PostAttachment> images,
  ) async {
    int rescode = 500;
    try {
      log("API CAll::" +
          jsonEncode({
            "cardCode": "$cardcode",
            "cardName": "$cardname",
            "numAtCard": "$numAtCard",
            "docType": "$docType",
            "docDate": "$docDate",
            "docTotal": docTotal,
            "reference1": "$reference1",
            "reference2": "$reference2",
            "comments": "$Comments",
            "taxDate": "$taxDate",
            "attachment": images,
            "documentLines": itemlist.map((e) => e.toJson()).toList()
          }));
      log("${URL.queryApi}Inv/v1/AddPurchaseInward?type=P::::ConstantValues.token::" +
          ConstantValues.token.toString());
      final responce = await http.post(
          Uri.parse("${URL.queryApi}Inv/v1/AddPurchaseInward?type=P"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer " + ConstantValues.token,
          },
          body: jsonEncode({
            "cardCode": "$cardcode",
            // "cardCode": "$cardcode",
            "cardName": "$cardname",
            "numAtCard": "$numAtCard",
            "docType": "$docType",
            "docDate": "$docDate",
            "docTotal": docTotal,
            "reference1": "$reference1",
            "reference2": "$reference2",
            "comments": "$Comments",
            "taxDate": "$taxDate",
            "attachment": images,
            "documentLines": itemlist.map((e) => e.toJson()).toList()
          }));
      // log("kanisjajs" +
      //     jsonEncode({
      //       "cardCode": "$cardcode",
      //       "cardName": "$cardname",
      //       "numAtCard": "$numAtCard",
      //       "docType": "$docType",
      //       "docDate": "$docDate",
      //       "docTotal": docTotal,
      //       "reference1": "$reference1",
      //       "reference2": "$reference2",
      //       "comments": "$Comments",
      //       "taxDate": "$taxDate",
      //       "documentLines": itemlist.map((e) => e.toJson()).toList()
      //     }));
      log("StatusCode" + responce.statusCode.toString());
      log("body" + responce.body.toString());
      if (responce.statusCode == 200) {
        return finalsaveModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return finalsaveModel.exception(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("error::${e.toString()}");
      return finalsaveModel.issues(e.toString(), rescode);
    }
  }
}

class finalsaveModel {
  String? exception;
  int? stcode;
  Dataa? data;

  finalsaveModel(
      {required this.exception, required this.stcode, required this.data});
  factory finalsaveModel.fromJson(Map<String, dynamic> jsons, int stcode) {
    var list = json.decode(jsons['data'] as String) as Map<String, dynamic>;
    return finalsaveModel(
        data: Dataa.fromJson(list),
        exception: jsons['respDesc'],
        stcode: stcode);
  }
  factory finalsaveModel.exception(Map<String, dynamic> json, int stcode) {
    return finalsaveModel(
        data: null, exception: json['respDesc'], stcode: stcode);
  }
  factory finalsaveModel.issues(String json, int stcode) {
    return finalsaveModel(data: null, exception: json, stcode: stcode);
  }
}

class Dataa {
  int? DocEntry;
  int? DocNumber;
  Dataa({
    required this.DocEntry,
    required this.DocNumber,
  });
  factory Dataa.fromJson(Map<String, dynamic> json) {
    return Dataa(
        DocEntry: json["DocEntry"] ?? 0, DocNumber: json["DocNumber"] ?? 0);
  }
}

class ltPurinwitem {
  int? lineNum;
  String? itemCode;
  String? itemDescription;
  int? quantity;
  double? price;
  String? warehouseCode;
  String? baseType;
  int? baseEntry;
  int? baseLine;
  String? taxCode;
  String? manageBy;
  List<serialNumbers> serialnum;

  ltPurinwitem(
      {required this.baseEntry,
      required this.baseLine,
      required this.baseType,
      required this.itemCode,
      required this.itemDescription,
      required this.lineNum,
      required this.manageBy,
      required this.price,
      required this.quantity,
      required this.taxCode,
      required this.warehouseCode,
      required this.serialnum});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "lineNum": lineNum,
      "itemCode": "$itemCode",
      "itemDescription": "$itemDescription",
      "quantity": quantity,
      "price": price,
      "warehouseCode": "$warehouseCode",
      "baseType": "$baseType",
      "baseEntry": baseEntry,
      "baseLine": baseLine,
      "taxCode": "$taxCode",
      "manageBy": "$manageBy",
      "serialNumbers": serialnum.map((e) => e.toJson()).toList()
    };
    return map;
  }
}

class serialNumbers {
  String? manufacturerSerialNumber;
  String? internalSerialNumber;
  String? notes;
  int? quantity;
  serialNumbers(
      {required this.manufacturerSerialNumber,
      required this.internalSerialNumber,
      required this.notes,
      required this.quantity});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      // "batchNumber":"$manufacturerSerialNumber",
      "manufacturerSerialNumber": "$manufacturerSerialNumber",
      "internalSerialNumber":
          internalSerialNumber == null || internalSerialNumber!.isEmpty
              ? "$manufacturerSerialNumber"
              : "$internalSerialNumber",
      "notes": "$notes",
      "quantity": quantity
    };
    return map;
  }
}
