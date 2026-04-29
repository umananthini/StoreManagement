import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:warehousemanagement/MODEL/version.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';

class versionnnnservice {
  int? stcode = 500;

  static Future<versionnnnnumheader> getdata() async {
    try {
      log("version - ${URL.queryApi}Inv/v1/Version?id=1");
      final response =
          await http.get(Uri.parse("${URL.queryApi}Inv/v1/Version?id=1"));
      log("response.body:::${response.body}");
      if (response.statusCode == 200) {
        return versionnnnnumheader.fromJson(
            json.decode(response.body), response.statusCode);
      } else {
        return versionnnnnumheader.execption(
            json.decode(response.body), response.statusCode);
      }
    } catch (e) {
      log("version catch :::${e.toString()}");
      return versionnnnnumheader.issue("${e.toString()}", 500);
    }
  }
}
