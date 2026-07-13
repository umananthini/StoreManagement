import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/SERVICES/URL.dart';

class UploadApi {
  static Future<String> getData(String filename) async {
    int resCode = 500;

    try {
      var url = Uri.parse(
          '${URL.queryApi}Inv/v1/UploadMedia?filename=${filename.split('/').last}');
      log("${ConstantValues.token}::::${filename}:::url: ${url}");
      log("Upload Api --> ${URL.queryApi}Inv/v1/UploadMedia?filename=${filename.split('/').last}");
      var request = http.MultipartRequest('POST', url);

      var file = await http.MultipartFile.fromPath(
        'formFile',
        "${filename}",
        filename: '${filename.split('/').last}',
      );
      log("aaa::" + filename.toString());
      request.files.add(file);
      var headers = {
        'Authorization': 'bearer ${ConstantValues.token}',
        "content-type": "application/json",
      };
      request.headers.addAll(headers);
      var response = await request.send();
      log("SSS" + response.statusCode.toString());

      var resposbody = await response.stream.bytesToString();
      log("file ${resposbody.toString()} parames::" +
          response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 210) {
        log("response body -- > ${resposbody} ");

        return resposbody.toString();
      } else {
        return "No Data Found..!!";
      }
    } catch (e) {
      log("eerrorattachments::" + e.toString());
      return "No Data Found..!!";
    }
  }
  //   try {
  //     Config configu = Config();
  //     // log('filenamefilenameapi::$filename');
  //     log(
  //       'http://102.69.167.106:7467/api/UploadMedia/UploadOfferMedia?filename=${filename.split('/').last}',
  //     );
  //     // http://dev.sellerkit.in:5467
  //     var url = Uri.parse(
  //       'http://102.69.167.106:7467/api/UploadMedia/UploadOfferMedia?filename=${filename.split('/').last}',
  //     );
  //     var request = http.MultipartRequest('POST', url);
  //     var file = await http.MultipartFile.fromPath(
  //       'formFile',
  //       filename,
  //       filename: filename.split('/').last,
  //     );
  //     // log("aaa::" + filename.toString());
  //     request.files.add(file);
  //     var headers = {'accept': '/'};
  //     request.headers.addAll(headers);
  //     var response = await request.send();
  //     // log("Attachment SCode::" + response.statusCode.toString());

  //     var resposbody = await response.stream.bytesToString();
  //     // log("file ${resposbody.toString()} :::parames::" +
  //     // response.statusCode.toString());
  //     if (response.statusCode >= 200 && response.statusCode <= 210) {
  //       // log("palss");

  //       return resposbody.toString();
  //     } else {
  //       return "No Data Found.";
  //     }
  //   } catch (e) {
  //     // log("eerrorattachments::" + e.toString());
  //     return "No Data Found.";
  //   }
  // }
}
