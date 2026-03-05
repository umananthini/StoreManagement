import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

class savefinalOutApi {
  static Future<finalsaveModel> getdata(
    List<ltstockoutitem> itemlist,
    List<ltpickedserial> seriallist,
    String towhse,
    String? Comments,
  ) async {
    int rescode = 500;
    try {
      log("${URL.queryApi}:::ConstantValues.token::" + ConstantValues.token.toString());
      final responce = await http.post(
          Uri.parse(
              "${URL.queryApi}Inv/v1/AddStockOutward"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer " + ConstantValues.token,
          },
          body: jsonEncode({
            "fromWarehouse": "${ConstantValues.branch}",
            "toWarehouse": "$towhse",
            "comments": "$Comments",
            "u_Branch": "$towhse",
            "whscode": "${ConstantValues.Whsecode}",
            "lt_stockoutitem": itemlist.map((e) => e.toJson()).toList(),
            "lt_pickedserial": seriallist.map((e) => e.toJson()).toList()
          }));
      log("asjasjajs" +
          jsonEncode({
            "fromWarehouse": "${ConstantValues.branch}",
            "toWarehouse": "$towhse",
            "comments": "$Comments",
            "u_Branch": "$towhse",
            "whscode": "${ConstantValues.branch}",
            "lt_stockoutitem": itemlist.map((e) => e.toJson()).toList(),
            "lt_pickedserial": seriallist.map((e) => e.toJson()).toList()
          }));
      log("aaacc" + responce.statusCode.toString());
      log("aaaccc" + responce.body.toString());
      if (responce.statusCode == 200) {
        return finalsaveModel.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return finalsaveModel.exception(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("${e.toString()}");
      return finalsaveModel.issues(e.toString(), rescode);
    }
  }
}

class finalsaveModel {
  String? exception;
  int? stcode;
  List<dataaa>?dataa;
  finalsaveModel({required this.exception, required this.stcode,required this.dataa,});
  factory finalsaveModel.fromJson(Map<String, dynamic> jsons, int stcode) {
    var list = json.decode(jsons['data'] as String) as List;
List<dataaa> datalist =list.map((e)=>dataaa.fromJson(e)).toList();
    return finalsaveModel(  dataa:datalist,exception: null, stcode: stcode);
  }
  factory finalsaveModel.exception(Map<String, dynamic> json, int stcode) {
    return finalsaveModel(dataa: null, exception: json['respDesc'], stcode: stcode);
  }
  factory finalsaveModel.issues(String json, int stcode) {
    return finalsaveModel(dataa: null,exception: json, stcode: stcode);
  }
}
class dataaa{
  String?DocEntry;
  String?DocNumber;
  dataaa({required this.DocEntry,required this.DocNumber});
   factory dataaa.fromJson(Map<String,dynamic>jsons){
    return dataaa(DocEntry: jsons["DocEntry"]??"", DocNumber:  jsons["DocNumber"]??"");
   }
}

class ltstockoutitem {
  int? baseEntry;
  int? baseline;
  String? itemCode;
  int? quantity;
  String? fromWarehouse;
  String? toWarehouse;
  String? uTransNum;

  ltstockoutitem(
      {required this.baseline,
      required this.baseEntry,
      required this.fromWarehouse,
      required this.itemCode,
      required this.quantity,
      required this.toWarehouse,
      required this.uTransNum});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "baseEntry": baseEntry,
      "baseline": baseline,
      "itemCode": "$itemCode",
      "quantity": quantity,
      "fromWarehouse": "$fromWarehouse",
      "toWarehouse": "$toWarehouse",
      "u_TransNum": "$uTransNum"
    };
    return map;
  }
}

class ltpickedserial {
  int? lineID;
  String? transtype;
  String? branch;
  String? serialnum;
  String? transNum;
  String? itemCode;
  int? qty;
  ltpickedserial(
      {required this.branch,
      required this.itemCode,
      required this.lineID,
      required this.qty,
      required this.serialnum,
      required this.transNum,
      required this.transtype});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "lineID": lineID,
      "transtype": "$transtype",
      "branch": "$branch",
      "serialnum": "$serialnum",
      "transNum": "$transNum",
      "itemCode": "$itemCode",
      "qty": qty
    };
    return map;
  }
}
