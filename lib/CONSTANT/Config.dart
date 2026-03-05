import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';

class Config {
  static String currentDate() {
    DateTime now = DateTime.now();

    String currentDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    print("date: $currentDateTime");
    return currentDateTime.trim();
  }

   static String currentDate1() {
    DateTime now = DateTime.now();

    String currentDateTime =
        "${now.year.toString()}-${(now.month-1).toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    print("date: $currentDateTime");
    return currentDateTime.trim();
  }

  Map<String, dynamic> parseJwt(String token) {
    log("String token::$token");

    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = decodeBase64(parts[1]);
    // log("payload"+payload.toString());
    final payloadMap = json.decode(payload);
    log("payloadMap$payloadMap");
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String decodeBase64(String str) {
    //'-', '+' 62nd char of encoding,  '_', '/' 63rd char of encoding
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      // Pad with trailing '='
      case 0: // No pad chars in this case
        break;
      case 2: // Two pad chars
        output += '==';
        break;
      case 3: // One pad char
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static Future<String?> getdeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'

      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

   
   String alignDate1(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var date1 = inputFormat.parse(date);
    // log("------------------------------------------------------------------------------------------------");
    var dates = DateTime.parse(date1.toString());
    return "${dates.day.toString().padLeft(2, '0')}-${dates.month.toString().padLeft(2, '0')}-${dates.year.toString().padLeft(4, '0')}";
    // return date1.toString();
  }

  static String alignexpiry(String date) {
    String originalDate = date;
    var parsedDate = DateFormat("dd-MM-yyyy").parse(originalDate);
    // log("------------------------------------------------------------------------------------------------");
    String formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(parsedDate);
    return formattedDate;
    // return date1.toString();
  }
}
