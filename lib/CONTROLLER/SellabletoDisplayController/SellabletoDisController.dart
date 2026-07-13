import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/MODEL/GetBoxSerialModel/getboxserial.dart';
import 'package:warehousemanagement/SERVICES/Sellable2DisplayApi/FinalsaveApi1.dart';
import 'package:warehousemanagement/SERVICES/Sellable2DisplayApi/GetBoxSerialDetailsApi.dart';

class SellableoDispController extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? scancontroller2text;
  bool finalloading = false;
  finalvalidate(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      // if (randomnumber == '') {
      //   showtoastmsg();
      //   notifyListeners();
      // }
      // else {
      finalloading = true;
      notifyListeners();
      await SellableFinalApi.getData(GetBoxSeriallist[0].ItemCode,
              scancontroller2.text, 1, scancontroller.text)
          .then((value) {
        if (value.stcode! >= 200 && value.stcode! <= 210) {
          finalloading = false;
          notifyListeners();
          showdialogsave(
            context,
            "Assets/check.png",
            "Success",
          );
        } else if (value.stcode! >= 400 && value.stcode! <= 410) {
          finalloading = false;
          notifyListeners();
          showdialogsave(
            context,
            "Assets/cancel.png",
            "Failed 400",
          );
        } else {
          finalloading = false;
          notifyListeners();
          showdialogsave(
            context,
            "Assets/cancel.png",
            "Server Not Connect",
          );
        }
      });

      // }
    }
  }

  showdialogsave(
    BuildContext context,
    String? image,
    String title,
  ) {
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);
          return StatefulBuilder(builder: (context, setst) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: Screens.padingHeight(context) * 0.13,
                    width: Screens.width(context),
                    decoration: const BoxDecoration(
                        // color:Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Center(
                      child: Image.asset(
                        "$image", //Asset/check.png
                        height: Screens.padingHeight(context) * 0.1,
                        width: Screens.width(context) * 0.2,
                      ),
                    ),
                  ),
                  Container(
                    // height: Screens.padingHeight(context)*0.2,
                    padding: EdgeInsets.symmetric(
                        horizontal: Screens.width(context) * 0.01,
                        vertical: Screens.padingHeight(context) * 0.005),
                    child: Column(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        // Text(
                        //   body,
                        //   textAlign: TextAlign.center,
                        //   style: theme.textTheme.bodyText1!
                        //       .copyWith(fontWeight: FontWeight.normal),
                        // ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: thirdcolor),
                            onPressed: () {
                              setst(() {
                                if (title.contains("Success")) {
                                  Get.offAllNamed(ConstantRoutes.dashboard);
                                } else {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: const Text("ok"))
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  showtoastmsg() {
    Fluttertoast.showToast(
        msg: "Generate random number ..!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String? randomnumber = '';
  generateRandomCode() {
    randomnumber = '';
    notifyListeners();
    final random = Random();

    String letter = String.fromCharCode(random.nextInt(26) + 65);

    String digits = random.nextInt(100).toString().padLeft(3, '1');
    randomnumber = "$digits";
    notifyListeners();
    return "$letter$digits";
  }

  String? Scanvalue1;
  String? Scanvalue2;
  TextEditingController scancontroller = TextEditingController();
  TextEditingController scancontroller2 = TextEditingController();
  List<GetboxSerial> GetBoxSeriallist = [];
  List<GetboxSerial> GetBoxSeriallist1 = [];

  bool isshowtextfield = false;
  bool generatednum = false;
  bool? isloading = false;
  bool? checkFUR = false;
  afterproductscanned(String? code, BuildContext context) {
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  afterserialScanned(String? code, BuildContext context) async {
    isloading = true;
    checkFUR = false;
    notifyListeners();
    scancontroller2.text = code.toString();
    await GetBoxDetailsSerialApi.getData(scancontroller2.text).then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 210) {
        if (value.data! != null && value.data!.isNotEmpty) {
          //  log(GetBoxSeriallist[1].toString());
          GetBoxSeriallist = value.data!;
          isloading = false;
          isshowtextfield = true;
          notifyListeners();
          scancontroller.clear();
          notifyListeners();
          if (GetBoxSeriallist[0].Division == "FUR") {
            checkFUR = true;

            scancontroller.text = scancontroller2.text;
            //  spnkit
            //  swipegallary(scrolling image)
          }
        } else if (value.data! == null || value.data!.isEmpty) {
          isloading = false;
          scancontroller2.clear();
          FocusScope.of(context).unfocus();
          isshowtextfield = false;
          showdialogtoast(context, "No data..!!");
          notifyListeners();
        }
      } else if (value.rescode! >= 400 && value.rescode! <= 410) {
        scancontroller2.clear();

        FocusScope.of(context).unfocus();
        isshowtextfield = false;
        isloading = false;
        generatednum = false;
        showdialogtoast(context, "${value.execption}..!!");
        notifyListeners();
      } else {
        scancontroller2.clear();

        FocusScope.of(context).unfocus();
        isshowtextfield = false;
        isloading = false;
        showdialogtoast(context, "Server Not Connect");
        notifyListeners();
      }
    });
  }

  showdialogtoast(BuildContext context, String? message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          final theme = Theme.of(context);
          return StatefulBuilder(builder: (context, setst) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: thirdcolor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            )),
                        width: Screens.width(context),
                        height: Screens.padingHeight(context) * 0.05,
                        alignment: Alignment.center,
                        child: Text(
                          "Alert",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                child: Text(
                              "$message",
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              height: Screens.padingHeight(context) * 0.01,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     ElevatedButton(410
                            //         onPressed: () {
                            //           setst(() {
                            //             Navigator.pop(context);
                            //             pageController.animateToPage(
                            //                 --pageChanged,
                            //                 duration: Duration(milliseconds: 250),
                            //                 curve: Curves.bounceIn);
                            //           });
                            //         },
                            //         child: Text("Yes")),
                            //     SizedBox(
                            //       width: Screens.width(context) * 0.02,
                            //     ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirdcolor),
                                onPressed: () {
                                  setst(() {
                                    // isfinalloop = false;

                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("ok"))
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
  // scancontrollerr() {
  //   isshowtextfield = true;
  //   notifyListeners();
  // }

  init() {
    clearAll();
    notifyListeners();
  }

  clearAll() {
    finalloading = false;
    randomnumber = '';
    isloading = false;
    generatednum = false;
    isshowtextfield = false;
    notifyListeners();
    scancontroller.clear();
    scancontroller2.clear();
    Scanvalue1 = null;
    Scanvalue2 = null;
    notifyListeners();
  }

  hideproductserialbutton() {
    if (scancontroller2.text.isNotEmpty) {
      isshowtextfield = false;
      notifyListeners();
    } else {
      isshowtextfield = true;
      notifyListeners();
    }
  }

  hidegeneratebutton() {
    if (scancontroller.text.isNotEmpty) {
      isshowtextfield = false;
      notifyListeners();
    } else {
      isshowtextfield = true;
      notifyListeners();
    }
  }
}
