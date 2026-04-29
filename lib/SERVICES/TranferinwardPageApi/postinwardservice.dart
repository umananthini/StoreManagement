import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

class FinalSaveservices {
  int rescode = 500;
  static Future<finalsaveModel> getdata(List<posttransInwModel> save,String catagory,String product,String itemname,String transnum,String brand,) async {
    try {
      log("sapcloudcenter22::" + jsonEncode({
 
   "approved": true,
    "transNum": "$transnum",
    "transferQty": 0,
    "transtype": "inward",
     "branch": "${ConstantValues.branch}",
     "inwardLineNums":save.map((e) => e.toJson()).toList()
         }));
      log("postInward:${URL.queryApi}Inv/v1/AddStockInward");
      log("token:${ConstantValues.token}");

      
      final responce = await http.post(
          Uri.parse(
              "${URL.queryApi}Inv/v1/AddStockInward"),
          headers: {
            "Authorization": "bearer ${ConstantValues.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([{



   "approved": true,
    "transNum": "$transnum",
    "transferQty": 0,
    "transtype": "inward",
     "branch": "${ConstantValues.branch}",
     "inwardLineNums":save.map((e) => e.toJson()).toList()
          }]));
      log("sapcloudcenter::" + responce.body.toString());

      log("sapcloudcenter::" + responce.statusCode.toString());
      
      if (responce.statusCode == 200) {
        return finalsaveModel.fromJson(
            jsonDecode(responce.body), responce.statusCode);
      } else {
        return finalsaveModel.exception(
            jsonDecode(responce.body), responce.statusCode);
      }
    } catch (e) {
      return finalsaveModel.issues(e.toString(), 500);
    }
  }
}



class finalsaveModel {
  String? exception;
  int? stcode;
  List<String>?dataa;
  finalsaveModel({
    required this.exception,
    required this.stcode,
    // required this.dataa,
  });
  factory finalsaveModel.fromJson(Map<String, dynamic> json, int stcode) {
    return finalsaveModel(exception: null, stcode: stcode, );
  }
  factory finalsaveModel.exception(Map<String, dynamic> json, int stcode) {
    return finalsaveModel(exception: json['respDesc'], stcode: stcode);
  }
  factory finalsaveModel.issues(String json, int stcode) {
    return finalsaveModel(exception: json, stcode: stcode);
  }
}
// class dataa{
//   String? itemCode;
//   int?docEntry;
//   int?lineNum;
//   String?itemname;
//   String?serialBatch;
//   String?brand;
//   String?product;
//   String?category;
//   bool?approved;
//   String?transNum;
//   int?transferQty;
//   String?transtype;
//   String?branch;
//   List<posttransInwModel>?posttransInwModel1;

// dataa({
// required this.approved,
// required this.branch,
// required this.brand,
// required this.category,
// required this.docEntry,
// required this.itemCode,
// required this.itemname,
// required this.lineNum,
// required this.posttransInwModel1,
// required this.product,
// required this.serialBatch,
// required this.transNum,
// required this.transferQty,
// required this.transtype,


// });
//  Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//        "docEntry": 0,
//   "lineNum": 0,
//   "itemname": "$itemname",
//   "serialBatch": "${save[0].serialbatch![0].internalSerialNumber}",
//   "brand": "$brand",
//   "product": "$product",
//   "category": "$catagory",
//   "approved": true,
//   "transNum": "$transnum",
//   "transferQty": 0,
//   "transtype": "inward",
//   "branch": "${ConstantValues.branch}",
//   "inwardLineNums":save.map((e) => e.toJson()).toList()
//     };
//     return map;
//     }
// }

class posttransInwModel {
  String? itemCode;
  String? fromWarehouseCode;
  String? warehouseCode;
  int? linenum;
  int? docentry;
  String? manageBy;
  int? qty;
  List<serialBatchNums>? serialbatch;

  posttransInwModel(
      {required this.fromWarehouseCode,
      required this.itemCode,
      required this.warehouseCode,
      required this.linenum,
      required this.docentry,
      required this.qty,
      required this.manageBy,
      required this.serialbatch});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      // "itemCode": "$itemCode",
      // "fromWarehouseCode": "$fromWarehouseCode",
      // "warehouseCode": "$warehouseCode",
      // "qty": qty,

       "itemCode":"$itemCode",
        "fromWarehouseCode":  "$fromWarehouseCode",
        "warehouseCode": "$warehouseCode",
        "qty": qty,
        "manageBy":"$manageBy",
        "lineNum": linenum,
        "docEntry": docentry,
      "serialBatchNums": serialbatch!.map((e) => e.toJson()).toList()
    };
    return map;
  }
}

class serialBatchNums {
  String? manufacturerSerialNumber;
  String? internalSerialNumber;
  int? qty;
  serialBatchNums({
    required this.manufacturerSerialNumber,
    required this.internalSerialNumber,
    required this.qty,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "manufacturerSerialNumber":"$manufacturerSerialNumber",
      "internalSerialNumber":"$internalSerialNumber",
      "qty": qty
    };
    return map;
  }
}

