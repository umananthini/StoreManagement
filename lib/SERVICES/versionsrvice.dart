import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';

import 'package:warehousemanagement/MODEL/version.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';

class versionnnnservice {
  int? stcode = 500;

  static Future<versionnnnnumheader> getdata() async {
    try {
      log("versionservice version - ${URL.queryApi}Inv/v1/Version?id=1");

      log("API URL => $URL.queryApi");
      final response = await http.get(
        Uri.parse("${URL.queryApi}Inv/v1/Version?id=1"),
        // headers: {
        //   "Authorization":
        //       "bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbmNyeXB0ZWRDbGFpbXMiOiJtSmZ6WGFOMUR4ZlJvRnM5RGVzcGxmQWdwdUxsbm1FTmk4NThPUGI2QzB6MDEzYVlkVFVuYjFlWDVNd1A5cUwrRkRJelZxTHNFZlUxZnJPTnlEck1FZ2p1RUFtWEVBZHh5SXhObU5ob1k2S2VHM1pXaUJiQ04xODZJQ2hjTHpKT2NjOXNOL1VzSThhbEp0Szd3d0EvcjBsUXNhVTE1VW40eTRLcjFYRWpxMTlnL0ZEdTc1MkZZcVZxU3F6ZDJnbkcrc1V6OHZSRitTUVc5YUJPUmtWOG9pdTQyZGdiektnaHdqVmcyaDYwZzVZK2ZQSUFrQWlOek1NUTBKdS9melowS2NHRHNPOFUwSjkxcjlkbDAwK2NNUT09IiwibmJmIjoxNzc5NDQwNTA5LCJleHAiOjE3Nzk0NjkzMDksImlhdCI6MTc3OTQ0MDUwOX0.K8R7eH9JxzjWkPvzWrdzAOI0DypO8ZJjBoTQJfmE94gkly6OhxzkOKjRa6gZjvoVwU_6Ir6fhQvDHi6rMvABgA",
        // },
      );

      log("versionservice response.body:::${response.body}");
      log("versionservice response.Statuscode:::${response.statusCode}");
      if (response.statusCode == 200) {
        return versionnnnnumheader.fromJson(
            json.decode(response.body), response.statusCode);
      } else {
        return versionnnnnumheader.execption(
            json.decode(response.body), response.statusCode);
      }
    } catch (e) {
      log("versionserviedddddd :::${e.toString()}");
      return versionnnnnumheader.issue("${e.toString()}", 500);
    }
  }
}
