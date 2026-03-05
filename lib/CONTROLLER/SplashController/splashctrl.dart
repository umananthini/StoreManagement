import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:path/path.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/helperfunction.dart';
import 'package:warehousemanagement/MODEL/version.dart';
import 'package:warehousemanagement/SERVICES/LoginAPIService/loginapiservice.dart';
import 'package:warehousemanagement/SERVICES/versionsrvice.dart';

class Splachctrl extends ChangeNotifier {
  init(BuildContext context) {
    getversionnapi(context);
  }

  String? Exception = "";
  chechverification() async {
    log("created");
    bool? checkedin = false;
    checkedin = await helperfunction.getloggedinSharedPreference();
    notifyListeners();

    if (checkedin == true) {
      validate();
      notifyListeners();
    } else {
      Get.toNamed(ConstantRoutes.login);
      notifyListeners();
    }
  }

  List<versionnum> vernnnum = [];
  String? errorr;

  bool isversionloading = false;
  getversionnapi(BuildContext context) async {
    Exception = "";
    await versionnnnservice.getdata().then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        errorr = '';
        vernnnum = value.vn!;
        log("version1111:::${vernnnum[0].Version}");
        isversionloading = false;
        notifyListeners();
        if (ConstantValues.versionNum.toString() == vernnnum[0].Version) {
          Exception = '';
          chechverification();
          notifyListeners();
        } else {
          Exception =
              'App Version and Api version is different \nApi Version : ${vernnnum[0].Version} \nApp Version : ${ConstantValues.versionNum} \n Please update new version..!!';
          Get.toNamed(ConstantRoutes.restrictionpage);
//       showDialog(context:context , builder: (context){
// return AlertDialog(
// // backgroundColor: Colors.transparent,
// content: Container(
//   // decoration: BoxDecoration(
//   //   borderRadius: BorderRadius.circular(15),
//   //   color: const Color.fromARGB(255, 255, 243, 243)

//   // ),
//   child: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Center(
//         child: Text('Update Your APK to next version'),

//       )
//     ],
//   ),
// ),
// );
//       }).then((value){
// Get.back();
//       });
        }
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        Exception = '';
        isversionloading = false;
        errorr = value.execption!;
        notifyListeners();
      } else {
        Exception = '';
        isversionloading = false;
        errorr = value.execption!;

        notifyListeners();
      }
    });
  }

  String? message;
  bool? loginloadinggg = false;
  validate() async {
    ConstantValues.isapprover = '';
    notifyListeners();
    String? Username = await helperfunction.getloginUserName();
    String? userPassword = await helperfunction.getloginpassword();
    String? UserloginBranch = await helperfunction.getLoginBranch();
    String? UserDb = await helperfunction.getLoginDatabase();

    message = "";
    PostLoginModel postlogin = PostLoginModel();
    postlogin.branch = UserloginBranch;
    postlogin.database = UserDb;
    String? deviceid = await Config.getdeviceId();
    postlogin.password = userPassword;
    postlogin.userCode = Username;
    postlogin.fcmToken = "AGAAGASAHHSHSH";
    postlogin.deviceCode = deviceid.toString();
    loginloadinggg = true;
    notifyListeners();

    await LoginAPIServices.getdata(postlogin).then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 210) {
        helperfunction.saveloggedinSharedPreference(true);
        helperfunction.loginusernameSharedPreference(
            value.loginitems!.UserCode.toString());
        helperfunction.LoginBranchSharedPreference(
            value.loginitems!.Branch.toString());
        helperfunction.LoginPasswordSharedPreference(userPassword!);
        helperfunction.LoginDatabaseSharedPreference(
            value.loginitems!.SAPDb.toString());
        ConstantValues.username = value.loginitems!.UserCode;

        ConstantValues.isapprover = value.loginitems!.IsApprover;
        ConstantValues.constantdevicecode = value.loginitems!.devicecode;
        log("ConstantValues.constantdevicecode::::::::::::::${ConstantValues.constantdevicecode}");
        log("ConstantValues.isapprover::::::::::::::${ConstantValues.isapprover}");
        notifyListeners();
        ConstantValues.Usercode = value.loginitems!.UserCode;
        ConstantValues.branch = value.loginitems!.Branch;
        notifyListeners();
        Get.toNamed(ConstantRoutes.dashboard);
        // notifyListeners();
        loginloadinggg = false;
        notifyListeners();
      } else if (value.rescode! >= 400 && value.rescode! <= 410) {
        loginloadinggg = false;
        notifyListeners();

        message = value.execption;
        notifyListeners();

        log("${value.execption}");
        Get.toNamed(ConstantRoutes.login);
        notifyListeners();
      } else if (value.rescode! >= 500 && value.rescode! <= 510) {
        loginloadinggg = false;
        notifyListeners();

        message = value.execption;

        log("error:::${message = value.execption}");

        notifyListeners();
        Get.toNamed(ConstantRoutes.login);
        notifyListeners();
      }
    });

    notifyListeners();
  }
}
