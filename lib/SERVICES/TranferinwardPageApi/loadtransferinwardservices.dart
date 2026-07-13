import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/MODEL/LoadTransferInwardModel/loadtransferinwardmodel.dart';

class LoadTransferInwaedServices {
  int rescode = 500;
  static Future<LoadTransferHeader> getdata(String TransNumber) async {
    log("loadtransferinwardservices URL::" +
        "${URL.queryApi}Inv/v1/GetInwardDocment?transnum=$TransNumber");
    try {
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/GetInwardDocment?transnum=$TransNumber"),
          headers: {
            "Authorization": "bearer ${ConstantValues.token}",
          });
      log("loadtransferinwardservices body::${responce.body}");
      log("loadtransferinwardservices 200::${responce.statusCode}");

      if (responce.statusCode == 200) {
        return LoadTransferHeader.fromJson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return LoadTransferHeader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("loadtransferinwardservices 500::${e.toString()}");
      return LoadTransferHeader.issues(e.toString(), 500);
    }
  }
}
