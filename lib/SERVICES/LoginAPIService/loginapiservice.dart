import 'dart:convert';
import 'dart:developer';

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/encryptfile.dart';
import 'package:warehousemanagement/CONSTANT/helperfunction.dart';

import 'package:warehousemanagement/MODEL/LoginApi/LogInApiModel/loginapimodel.dart';

class LoginAPIServices {
  int rescode = 500;
  static Future<LoginmodelHeader> getdata(PostLoginModel loginmodell) async {
    try {
      log("login url - ${URL.queryApi}Inv/v1/StoreMobileLogin");
      final responce =
          await http.post(Uri.parse("${URL.queryApi}Inv/v1/StoreMobileLogin"),
              headers: {
                "Content-Type": "application/json",
              },
              body: jsonEncode({
                "userCode": "${loginmodell.userCode}",
                "password": "${loginmodell.password}",
                "database": "${loginmodell.database}",
                "branch": "${loginmodell.branch}",
                "fcmToken": "${loginmodell.fcmToken}",
                "deviceCode": "${loginmodell.deviceCode}"
              }));
      log("request::" +
          jsonEncode({
            "userCode": "${loginmodell.userCode}",
            "password": "${loginmodell.password}",
            "database": "${loginmodell.database}",
            "branch": "${loginmodell.branch}",
            "fcmToken": "${loginmodell.fcmToken}",
            "deviceCode": "${loginmodell.deviceCode}"
          }));
      log("login stscode::" + "${responce.statusCode}");
      log("body login::" + "${responce.body}");
      if (responce.statusCode == 200) {
        Config config = new Config();
        EncryptData Encrupt = new EncryptData();
        Map<String, dynamic> tokenNew3 = json.decode(responce.body);
        Map<String, dynamic> jres =
            config.parseJwt("${tokenNew3['data'].toString()}");
        log("EncryptData:::" + jres.toString());
        String? testData2 = Encrupt.decrypt(jres['encryptedClaims']);
        Map<String, dynamic> jres2 = jsonDecode("${testData2}");
        log("tokenNew:::" + jres2.toString());
        Map<String, dynamic> tokenNew = json.decode(responce.body);
        // Utils.token = tokenNew['token'];
        helperfunction.saveTokenSharedPreference(tokenNew['data']);
        log("token::::" + tokenNew['data'].toString());
        ConstantValues.token = tokenNew['data'];

        return LoginmodelHeader.fromJson(jres2, responce.statusCode);
      } else {
        return LoginmodelHeader.issues(
            json.decode(responce.body), responce.statusCode);
      }
    } catch (e) {
      log("catch(e)::${e.toString()}");
      return LoginmodelHeader.error("${e.toString()}", 500);
    }
  }
}

class PostLoginModel {
  String? userCode;
  String? password;
  String? database;
  String? branch;
  String? fcmToken;
  String? deviceCode;
  PostLoginModel(
      {this.branch,
      this.database,
      this.deviceCode,
      this.fcmToken,
      this.password,
      this.userCode});
}
