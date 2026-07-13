import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/MODEL/TransferInwardModel/Transferinwardmodel.dart';

class TransferinwardService {
  int rescode = 500;
  static Future<TransferInwardDataModelHeader> getdata() async {
    log("${ConstantValues.token}::aa::" +
        "${URL.queryApi}Inv/v1/TransferInward?loginbranch=${ConstantValues.branch}");
    try {
      final response = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/TransferInward?loginbranch=${ConstantValues.branch}"),
          headers: {
            "Authorization": "bearer ${ConstantValues.token}",
          });
      log("Ttranserinwardservice statuscode::${response.statusCode}");
      log("Ttranserinwardservice body::" + response.body.toString());
      if (response.statusCode == 200) {
        return TransferInwardDataModelHeader.fromJson(
            json.decode(response.body), response.statusCode);
      } else {
        return TransferInwardDataModelHeader.execption(
            json.decode(response.body), response.statusCode);
      }
    } catch (e) {
      log(e.toString());

      return TransferInwardDataModelHeader.issues(e.toString(), 500);
    }
  }
}
