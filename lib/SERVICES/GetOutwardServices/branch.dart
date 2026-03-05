import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/helperfunction.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/branch.dart';
import 'package:http/http.dart' as http;

class BranchListApi {
  int stcode = 500;

  static Future<BranchListheader> getData() async {
    try {
      final responce = await http.get(
          Uri.parse(
              "${URL.queryApi}Inv/v1/BranchList?loginbranch=${ConstantValues.branch}"),
          headers: {"Authorization": "bearer ${ConstantValues.token}"});
      log("BranchList body:::${responce.body}");
      log("BranchList statusCode:::${responce.statusCode}");

      if (responce.statusCode == 200) {
        return BranchListheader.fromjson(
            json.decode(responce.body), responce.statusCode);
      } else {
        return BranchListheader.execption(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("catch BranchList:::${e.toString()}");
      return BranchListheader.issues(e.toString(), 500);
    }
  }
}
