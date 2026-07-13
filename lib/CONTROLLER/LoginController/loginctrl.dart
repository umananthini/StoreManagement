import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/helperfunction.dart';
import 'package:warehousemanagement/MODEL/LoginApi/LoginDropDownModel/logindropdown.dart';
import 'package:warehousemanagement/MODEL/version.dart';
import 'package:warehousemanagement/SERVICES/LoginAPIService/loginapiservice.dart';
import 'package:warehousemanagement/SERVICES/LoginAPIService/logindropdown.dart';
import 'package:warehousemanagement/SERVICES/versionsrvice.dart';

class LoginCtrl extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController companyctrl = TextEditingController();
  TextEditingController branchcodectrl = TextEditingController();

  init() {
    log("LoginCtrl Created");
    clear();
    getdropdownapi();
  }

  clear() {
    valuedropdown = null;
    isloading = false;
    usernamectrl.clear();
    passwordctrl.clear();
    companyctrl.clear();
    branchcodectrl.clear();
  }

  Config config = Config();
  bool loginloading = false;
  Validateuser() async {
    ConstantValues.isapprover = '';
    notifyListeners();
    if (formKey.currentState!.validate()) {
      message = "";
      PostLoginModel postlogin = PostLoginModel();
      postlogin.branch = branchcodectrl.text;
      postlogin.database = valuedropdown.toString();
      String? deviceid = await Config.getdeviceId();
      postlogin.password = passwordctrl.text;
      postlogin.userCode = usernamectrl.text;
      postlogin.fcmToken = "AGAAGASAHHSHSH";
      postlogin.deviceCode = deviceid.toString();
      loginloading = true;
      notifyListeners();

      await LoginAPIServices.getdata(postlogin).then((value) async {
        if (value.rescode! >= 200 && value.rescode! <= 210) {
          await helperfunction.clearLoginBranch();
          notifyListeners();
          await helperfunction.clearloginpassword();
          notifyListeners();
          await helperfunction.clearloginDatabase();
          notifyListeners();
          await helperfunction.clearusername();
          notifyListeners();
          await helperfunction.saveloggedinSharedPreference(true);
          notifyListeners();
          log("value user code::${value.loginitems!.Branch}");
          await helperfunction.loginusernameSharedPreference(
              value.loginitems!.UserCode.toString());
          notifyListeners();
          log("value user code::${value.loginitems!.UserCode}");

          await helperfunction.LoginBranchSharedPreference(
              value.loginitems!.Branch.toString());
          notifyListeners();

          await helperfunction.LoginPasswordSharedPreference(passwordctrl.text);
          notifyListeners();

          await helperfunction.LoginDatabaseSharedPreference(
              value.loginitems!.SAPDb.toString());
          notifyListeners();
          log("value user code::${value.loginitems!.SAPDb}");

          ConstantValues.Usercode = value.loginitems!.UserCode;
          notifyListeners();

          ConstantValues.branch = value.loginitems!.Branch;

          ConstantValues.isapprover = value.loginitems!.IsApprover;
          log("ConstantValues.isapprover::::::::::::::${ConstantValues.isapprover}");
          ConstantValues.constantdevicecode = value.loginitems!.devicecode;
          log("ConstantValues.constantdevicecode::::::::::::::${ConstantValues.constantdevicecode}");
          notifyListeners();
          notifyListeners();
          ConstantValues.username = value.loginitems!.UserCode;
          notifyListeners();
          log("user name::::::::::::::${value.loginitems!.UserCode}");
          Get.offAllNamed(ConstantRoutes.dashboard);
          notifyListeners();
          loginloading = false;
          notifyListeners();
        } else if (value.rescode! >= 400 && value.rescode! <= 410) {
          loginloading = false;
          notifyListeners();

          message = value.execption;
          Fluttertoast.showToast(
              msg: value.execption.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          notifyListeners();

          log("${value.execption}");
        } else if (value.rescode! >= 500 && value.rescode! <= 510) {
          loginloading = false;
          notifyListeners();

          message = value.execption;

          log("error:::${message = value.execption}");
          Fluttertoast.showToast(
              msg: "Server Not Connect",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);

          notifyListeners();
        }
      });

      notifyListeners();
    }
  }

  String? message = "";
  loginerrormsg() {
    return "$message";
  }
  //  showtoastInw(String message) {

  //   Fluttertoast.cancel();

  //   Fluttertoast.showToast(
  //       msg: "$message",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 0,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 14.0);
  // }

  // D R O P D O W N L I S T//

  List<LoginDropDownModel> DropDownList = [];
  String? error = "";
  String? valuedropdown;
  bool isloading = false;

  getdropdownapi() async {
    isloading = true;
    DropDownList.clear();
    notifyListeners();
    await LogInDropDownServices.getdata().then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 210) {
        error = '';
        DropDownList = value.data!;
        Fluttertoast.showToast(
            msg: "value.data!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        isloading = false;
        notifyListeners();
      } else if (value.rescode! >= 400 && value.rescode! <= 410) {
        isloading = false;
        error = value.execption!;
        Fluttertoast.showToast(
            msg: "value.execption!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
      } else {
        isloading = false;
        error = value.execption!;
        Fluttertoast.showToast(
            msg: "Server not connect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        notifyListeners();
      }
    });
  }

  // T R A S F E R I N W A R D //

  // G E T L O G I N A P I //
}
