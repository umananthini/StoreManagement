import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:warehousemanagement/MODEL/SAMPLEPOSTAPI/auditgetmodel.dart';
import 'package:warehousemanagement/MODEL/SAMPLEPOSTAPI/auditpostmodel.dart';
import 'package:warehousemanagement/SERVICES/AUDITSCREEN/getauditscreen.dart';

class gggggg extends ChangeNotifier {
  List<auditgetmodel>? auditgetlist = [];
  List<finallist> auditgetlist1 = [];
  List<Auditmodel>? auditpostlist = [];

  finalsaveapi() async {
// await
  }

  String? error;
  auditgetapi() async {
    await getauditservice.getdata().then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        auditgetlist = value.auditgetmodeldata;
        error = '';
        auditgetlist1.add(finallist(
            auditDate: "",
            deviceCode: "",
            itemCode: "",
            itemName: "itemName",
            productSerialNum: "productSerialNum",
            scanTime: "scanTime",
            serialNum: "serialNum",
            traceId: "traceId"));
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        auditgetlist = null;
        error = value.execption;
        Fluttertoast.showToast(
            msg: value.execption.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        auditgetlist = null;
        error = value.execption;
        Fluttertoast.showToast(
            msg: "Server not Connect",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }
}

class finallist {
  String? auditDate;
  String? itemCode;
  String? itemName;
  String? serialNum;
  String? productSerialNum;
  String? deviceCode;
  String? scanTime;
  String? traceId;
  finallist(
      {required this.auditDate,
      required this.deviceCode,
      required this.itemCode,
      required this.itemName,
      required this.productSerialNum,
      required this.scanTime,
      required this.serialNum,
      required this.traceId});
}
