import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/DBHELPER/DBOperation.dart';
import 'package:warehousemanagement/DBHELPER/dbhelper.dart';
import 'package:warehousemanagement/DBMODEL/OutwardModel/TransOutwardDBModel.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/branch.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/getoutward.dart';
import 'package:warehousemanagement/MODEL/GetOutwardModel/serialnum.dart';
import 'package:warehousemanagement/SERVICES/GetOutwardServices/branch.dart';
import 'package:warehousemanagement/SERVICES/GetOutwardServices/getoutward.dart';
import 'package:warehousemanagement/SERVICES/GetOutwardServices/savefinalApi.dart';
import 'package:warehousemanagement/SERVICES/GetOutwardServices/serialnum.dart';

class TransferOutwardctrl extends ChangeNotifier {
  TextEditingController commentscontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  bool quantityEnable = false;
  bool finallodaing = false;
  List<wmstransoutwardtabitemModel> finalsavelist = [];
  List<wmstransoutwardtabSerialModel> finalseriallist = [];

  methodfinalsave333(wmstransoutwardtabSerialModel values) {
    // binlinelist222.clear();
    bool finaladded = false;
    int? finalindex;
    int? subfinalindex;
    finalindex = null;
    finaladded = false;
    subfinalindex = null;
    // for (int ij = 0; ij < finalsavelist.length; ij++) {
    //   if (finalsavelist[ij].uTransNum == values.uTransNum) {
    //     notifyListeners();
    //     // for (int il = 0; il < binlinelist222.length; il++) {
    //     //   // if (binlinelist222[ij].bincode == values.binCode) {
    //     //     // subfinalindex = il;
    //     //   // }
    //     // }
    //     finaladded = true;
    //     finalindex = ij;
    //     //
    //     notifyListeners();
    //     break;
    //   }
    // }
    finalseriallist.add(wmstransoutwardtabSerialModel(
        branch: values.branch,
        scannedqty: values.scannedqty,
        itemCode: values.itemCode,
        lineID: values.lineID,
        qty: values.qty,
        manageby: values.manageby,
        serialnum: values.serialnum,
        transNum: values.transNum,
        transtype: values.transtype));
  }

  methodfinalsave2222(wmstransoutwardtabitemModel values) {
    // binlinelist222.clear();
    bool finaladded = false;
    int? finalindex;
    int? subfinalindex;
    finalindex = null;
    finaladded = false;
    subfinalindex = null;
    // for (int ij = 0; ij < finalsavelist.length; ij++) {
    //   if (finalsavelist[ij].uTransNum == values.uTransNum) {
    //     notifyListeners();
    //     // for (int il = 0; il < binlinelist222.length; il++) {
    //     //   // if (binlinelist222[ij].bincode == values.binCode) {
    //     //     // subfinalindex = il;
    //     //   // }
    //     // }
    //     finaladded = true;
    //     finalindex = ij;
    //     //
    //     notifyListeners();
    //     break;
    //   }
    // }
    finalsavelist.add(wmstransoutwardtabitemModel(
        baseentry: values.baseentry,
        fromWarehouse: values.fromWarehouse,
        itemCode: values.itemCode,
        lineID: values.lineID,
        quantity: values.quantity,
        scannedqty: values.scannedqty,
        toWarehouse: values.toWarehouse,
        uTransNum: values.uTransNum));
  }

  List<ltstockoutitem> itemlist = [];
  List<ltpickedserial> seriallist = [];
  int? overallqty;
  checkqtyfinal(wmstransoutwardtabitemModel finalitemlist) {
    overallqty = 0;
    for (int i = 0; i < finalseriallist.length; i++) {
      if (finalseriallist[i].transNum == finalitemlist.uTransNum &&
          finalseriallist[i].lineID == finalitemlist.lineID &&
          finalseriallist[i].itemCode == finalitemlist.itemCode) {
        overallqty = overallqty! + finalseriallist[i].scannedqty!;
      }
    }
    notifyListeners();
  }

  savefinal(BuildContext context) async {
    finalsavelist.clear();
    finalseriallist.clear();
    // addputaway.clear();
    final Database db = (await DBHelper.getinstance())!;
    finallodaing = true;
    notifyListeners();
    // await gettotal();
    for (int i = 0; i < itemdetailslist.length; i++) {
      if (getqty[i] > 0) {
        await Dboperation.outwardsaveAllDatafinal(
                selectedtransno2.toString(),
                itemdetailslist[i].ItemCode.toString(),
                itemdetailslist[i].baseline.toString(),
                db)
            .then((value) {
          if (value != null) {
            for (int ik = 0; ik < value.length; ik++) {
              //  binlinelist222.clear();
              methodfinalsave2222(value[ik]);
            }
          }
          log("finalsavelist::${finalsavelist.length}");
        });
      }
    }
    for (int i = 0; i < finalsavelist.length; i++) {
      await Dboperation.outwardsaveAllserialDatafinal(
              finalsavelist[i].uTransNum.toString(),
              finalsavelist[i].itemCode.toString(),
              finalsavelist[i].lineID.toString(),
              db)
          .then((value) {
        if (value != null) {
          for (int ik = 0; ik < value.length; ik++) {
            //  binlinelist222.clear();
            methodfinalsave333(value[ik]);
          }
        }
      });
    }
    itemlist.clear();
    seriallist.clear();
    for (int i = 0; i < finalsavelist.length; i++) {
      checkqtyfinal(finalsavelist[i]);
      itemlist.add(ltstockoutitem(
          baseEntry: finalsavelist[i].baseentry,
          baseline: finalsavelist[i].lineID,
          fromWarehouse: finalsavelist[i].fromWarehouse,
          itemCode: finalsavelist[i].itemCode,
          quantity: overallqty,
          toWarehouse: finalsavelist[i].toWarehouse,
          uTransNum: finalsavelist[i].uTransNum));
    }
    for (int i = 0; i < finalseriallist.length; i++) {
      seriallist.add(ltpickedserial(
          branch: finalseriallist[i].branch,
          itemCode: finalseriallist[i].itemCode,
          lineID: finalseriallist[i].lineID,
          qty: finalseriallist[i].scannedqty,
          serialnum: finalseriallist[i].serialnum,
          transNum: finalseriallist[i].transNum,
          transtype: finalseriallist[i].transtype));
    }

    await savefinalOutApi
        .getdata(
      itemlist,
      seriallist,
      branchDropDown.toString(),
      commentscontroller.text,
    )
        .then((value) async {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        finallodaing = false;
        showdialogsave(context, "Assets/check.png", "Success",
            value.dataa![0].DocNumber.toString());

        await Dboperation.outitemdeletebytransnum(
            selectedtransno2.toString(), db);
        await Dboperation.outserialdeletebytransnum(
            selectedtransno2.toString(), db);
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        finallodaing = false;
        showdialogsave(
            context, "Assets/cancel.png", "Failed", value.exception.toString());
        notifyListeners();
      } else {
        finallodaing = false;
        showdialogsave(
            context, "Assets/cancel.png", "Failed", value.exception.toString());
        notifyListeners();
      }
    });
  }

  showdialogsave(
      BuildContext context, String? image, String title, String body) {
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
                        title.contains("Success")
                            ? Text("transwer outward added successfully")
                            : Text(
                                title,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        title.contains("Success")
                            ? Text(
                                "Doc Number - $body",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.normal),
                              )
                            : Text(
                                "$body",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: thirdcolor),
                            onPressed: () {
                              setst(() {
                                if (title.contains("Success")) {
                                  Get.offAllNamed(
                                      ConstantRoutes.transferoutward);
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
        }).then((value) {
      if (title.contains("Success")) {
        // Navigator.pop(context);
        Get.offAllNamed(ConstantRoutes.transferoutward);
      }
    });
  }

  bool isPressed = false;
  showdialogback(BuildContext context) async {
    isPressed = true;
    notifyListeners();
    // final audio = AudioPlayer();

    // await audio.stop();

    // await audio.setAsset("Asset/scan_serial_wrong.mp3");
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);

          // audio.play();
          return StatefulBuilder(builder: (conte, setst) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                contentPadding: const EdgeInsets.all(0),
                content: Container(
                  decoration: const BoxDecoration(
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
                            borderRadius: const BorderRadius.only(
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
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Do you want go back without saving anything??",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Screens.padingHeight(context) * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: thirdcolor),
                                    onPressed: () {
                                      setst(() {
                                        isPressed = false;
                                        notifyListeners();
                                        Navigator.pop(context);
                                        FocusScope.of(context).unfocus();
                                        pageController.animateToPage(
                                            --pageChanged,
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.bounceIn);
                                      });
                                    },
                                    child: const Text("Yes")),
                                SizedBox(
                                  width: Screens.width(context) * 0.02,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: thirdcolor),
                                    onPressed: () {
                                      setst(() {
                                        isPressed = false;
                                        notifyListeners();
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text("No"))
                              ],
                            )
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

  TextEditingController scancontroller = TextEditingController();
  GetOutWardModel? thirdOutwarditems;
  dataget(BuildContext context) async {
    showlist.clear();
    notifyListeners();

    await getDBData(thirdindex!);
  }

  getDBData(int i) async {
    final Database db = (await DBHelper.getinstance())!;
    await Dboperation.outwardgetBinAndSerailNo(
            "$selectedtransno2",
            "${itemdetailslist[thirdindex!].ItemCode}",
            itemdetailslist[thirdindex!].baseline,
            db)
        .then((value) {
      if (value.length > 0) {
        print("length: ${value.length}");
        print("itemCode: ${value[0].itemCode}");
        // setState(() {
        showlist = value;
        // });
        notifyListeners();
      } else {
        showlist = [];
        notifyListeners();
      }
    });
  }

  int? thirdindex;
  Thirdpageclicked(BuildContext context) async {
    pageController.animateToPage(++pageChanged,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceIn);
    await dataget(context);
    await getserialnum();
    notifyListeners();
  }

  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  firstvalidate() async {
    await getoutwarddetails();
    notifyListeners();
  }

  scannedQty() {
    int qty = 0;
    for (int i = 0; i < showlist.length; i++) {
      // log("dbdata::"+dbdata[i].quantity.toString());
      String? qty2 = showlist[i].scannedqty!.toStringAsFixed(0);
      String? lineNum1 = showlist[i].lineID!.toStringAsFixed(0);

      qty = qty + int.parse(qty2);
      // notifyListeners();
    }
    return qty;
  }

  gettotal() async {
    getqty.clear();
    notifyListeners();
    final Database db = (await DBHelper.getinstance())!;
    for (int i = 0; i < itemdetailslist.length; i++) {
      await Dboperation.getoverallcountoutward(
              db,
              itemdetailslist[i].TransNo.toString(),
              itemdetailslist[i].ItemCode.toString(),
              itemdetailslist[i].baseline)
          .then((value) {
        getqty.add(value);
        notifyListeners();
        log("getqty::${getqty.length}");
        // log("getqty[i]::" + getqty[i].toString());
      });
    }
  }

  getsaveenable() async {
    await gettotal();
    bool issaveenable = false;
    issaveenable = false;
    if (getqty.isNotEmpty) {
      for (int i = 0; i < itemdetailslist.length; i++) {
        log("${itemdetailslist[i].ReqQty}:::${double.parse(getqty[i].toString())}");
        if (getqty[i] > 0) {
          issaveenable = true;
          // notifyListeners();
        }
      }
    }

    if (issaveenable == true) {
      log("saveLLtrure");
      saveenablebutton = true;
      notifyListeners();
    } else {
      saveenablebutton = false;
      notifyListeners();
    }
  }

  bool saveenablebutton = false;
  List<int> getqty = [];
  List<wmstransoutwardtabSerialModel> finaldoc = [];

  int? ScanTotal;
  GetAllDBqty() async {
    final Database db = (await DBHelper.getinstance())!;

    finaldoc = await Dboperation.getdataoutward(
      db,
      selectedtransno2.toString(),
    );
    if (finaldoc.isNotEmpty) {
      log("finaldoc::${finaldoc.length}");
      for (int i = 0; i < finaldoc.length; i++) {
        String? qty2 = finaldoc[i].scannedqty.toString();
        log("qty2::$qty2");
        log("ScanTotalbefore::$qty2");
        ScanTotal = ScanTotal! + int.parse(qty2);
        log("ScanTotal::$ScanTotal");
      }
    }

    return ScanTotal;
  }

  savedbinw() async {
    final Database db = (await DBHelper.getinstance())!;
    int docEntry = int.parse(thirdOutwarditems!.TransNo.toString());
    await Dboperation.outwarduidExists(
            docEntry.toString(),
            thirdOutwarditems!.ItemCode.toString(),
            thirdOutwarditems!.baseline.toString(),
            db)
        .then((value) async {
      log("valalalal :$value");
      if (value != null) {
        Dboperation.outexistdelete(
            docEntry,
            thirdOutwarditems!.ItemCode.toString(),
            thirdOutwarditems!.baseline!.toString(),
            db);
        Dboperation.outexistserialdelete(
            docEntry,
            thirdOutwarditems!.ItemCode.toString(),
            thirdOutwarditems!.baseline!.toString(),
            db);
        var values2;
        var values;
        if (showlist.isNotEmpty) {
          var val22 = wmstransoutwardtabitemModel(
              fromWarehouse: ConstantValues.branch,
              itemCode: itemdetailslist[thirdindex!].ItemCode,
              baseentry: itemdetailslist[thirdindex!].BaseEntry,
              lineID: itemdetailslist[thirdindex!].baseline,
              quantity: itemdetailslist[thirdindex!].ReqQty,
              scannedqty: showlist.length,
              toWarehouse: branchDropDown,
              uTransNum: itemdetailslist[thirdindex!].TransNo.toString());
          values2 = val22;
          Dboperation.insertoutitemdata([values2], db);
        }

        for (int i1 = 0; i1 < showlist.length; i1++) {
          print("data.length: ${showlist.length}");
          print("i11111: $i1");

          var val = wmstransoutwardtabSerialModel(
              branch: showlist[i1].branch,
              scannedqty: showlist[i1].scannedqty,
              itemCode: showlist[i1].itemCode,
              lineID: showlist[i1].lineID,
              qty: showlist[i1].qty,
              manageby: showlist[i1].manageby,
              serialnum: showlist[i1].serialnum,
              transNum: showlist[i1].transNum,
              transtype: showlist[i1].transtype);
          values = val;

          Dboperation.insertoutserialdata(values, db).then((value) async {
            print("inserted!!..");
            Dboperation.outwarduidExists(
                docEntry.toString(),
                thirdOutwarditems!.ItemCode.toString(),
                thirdOutwarditems!.baseline!.toString(),
                db);
            // setState(() {

            // grpDetails
            //     .clear();
            // });
            notifyListeners();
            // callApi();

            // getItemsQty();
            // getAllQuantity();
            // getLocalQuantity();
          });
        }
        getqty.clear();
        await gettotal();
        await getsaveenable();
        ScanTotal = 0;
        finaldoc.clear();
        GetAllDBqty();
        notifyListeners();
        pageController.animateToPage(--pageChanged,
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceIn);
      } else {
        var values2;
        var values;
        log("itemdetailslist[thirdindex!].ItemCode::${itemdetailslist[thirdindex!].ItemCode}");
        log("itemdetailslist[thirdindex!].ItemCode::${itemdetailslist[thirdindex!].ItemCode}");
        if (showlist.isNotEmpty) {
          var val22 = wmstransoutwardtabitemModel(
              fromWarehouse: ConstantValues.branch,
              itemCode: itemdetailslist[thirdindex!].ItemCode,
              baseentry: itemdetailslist[thirdindex!].BaseEntry,
              lineID: itemdetailslist[thirdindex!].baseline,
              quantity: itemdetailslist[thirdindex!].ReqQty,
              scannedqty: showlist.length,
              toWarehouse: branchDropDown,
              uTransNum: itemdetailslist[thirdindex!].TransNo.toString());
          values2 = val22;
          Dboperation.insertoutitemdata([values2], db);
        }

        for (int i1 = 0; i1 < showlist.length; i1++) {
          print("data.length: ${showlist.length}");
          print("i11111: $i1");

          var val = wmstransoutwardtabSerialModel(
              manageby: showlist[i1].manageby,
              branch: showlist[i1].branch,
              scannedqty: showlist[i1].scannedqty,
              itemCode: showlist[i1].itemCode,
              lineID: showlist[i1].lineID,
              qty: showlist[i1].qty,
              serialnum: showlist[i1].serialnum,
              transNum: showlist[i1].transNum,
              transtype: showlist[i1].transtype);
          values = val;

          Dboperation.insertoutserialdata(values, db).then((value) async {
            print("inserted!!..");
            Dboperation.outwarduidExists(
                docEntry.toString(),
                thirdOutwarditems!.ItemCode.toString(),
                thirdOutwarditems!.baseline!.toString(),
                db);
            // setState(() {

            //       ScanTotal=0;
            // finaldoc.clear();
            //        await GetAllDBqty();
            // grpDetails
            //     .clear();
            notifyListeners();
            // });
            // callApi();
            // getItemsQty();
            // getAllQuantity();
            // getLocalQuantity();
          });
        }

        // DataBaseHelper.insert(
        //         values)
        //     .then((value) {
        //   print("inserted!!..");
        getqty.clear();
        await gettotal();
        await getsaveenable();
        ScanTotal = 0;
        finaldoc.clear();
        GetAllDBqty();
        notifyListeners();
        pageController.animateToPage(--pageChanged,
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceIn);
      }
    });
  }

  deleterequest(int i) {
    showlist.removeAt(i);
    notifyListeners();
  }

  List<wmstransoutwardtabSerialModel> showlist = [];
  String? scanedvalueee;
  afterserialScanned(String code, BuildContext context) async {
    final Database db = (await DBHelper.getinstance())!;
    int qtys = int.parse(thirdOutwarditems!.ReqQty!.toStringAsFixed(0));
    log("showlist::${thirdOutwarditems!.ItemCode}");
    scancontroller.text = code.toString();
    // double qtys = double.parse(thirdOutwarditems!.ReqQty!.toString());
    if (Serialnum.isNotEmpty) {
      bool isalreadyscenned = false;
      isalreadyscenned = false;
      for (int i = 0; i < Serialnum.length; i++) {
        if (Serialnum[i].AvailSerialNum == scancontroller.text) {
          isalreadyscenned = true;
          notifyListeners();
          break;
        }
      }
      if (isalreadyscenned) {
        if (scancontroller.text.isEmpty) {
          scancontroller.clear();
          scanedvalueee = '';
          FocusScope.of(context).unfocus();
          showdialogtoast(context, "Please Give Serial Number..!!");
        } else if (qtys <= scannedQty() ||
                qtys <
                    scannedQty() +
                        (thirdOutwarditems!.ManageBy!.toLowerCase() == 'b'
                            ? int.parse(quantitycontroller.text)
                            : 1)
            // qtys <= scannedQty() || qtys < scannedQty() + 1
            ) {
          scancontroller.clear();
          notifyListeners();
          scanedvalueee = '';

          FocusScope.of(context).unfocus();
          // showtoastInw(
          //   "Greater than Qty..!!",
          // );
          isfinalloop = true;
          notifyListeners();
          showdialogtoast(context, "Greater than Qty..!!");
        } else {
          if (showlist.length > 0 && scancontroller.text.isNotEmpty) {
            bool showlistadd = false;
            showlistadd = false;
            int? index = null;
            for (int i = 0; i < showlist.length; i++) {
              if (showlist[i].serialnum == scancontroller.text) {
                showlistadd = true;
                index = i;
                notifyListeners();
              }
            }
            if (showlistadd) {
              if (thirdOutwarditems!.ManageBy!.toLowerCase() == 'b') {
                showlist[index!].scannedqty = showlist[index!].scannedqty! +
                    int.parse(quantitycontroller.text);
                scancontroller.clear();
                quantityEnable = false;
                notifyListeners();
                scanedvalueee = '';

                FocusScope.of(context).unfocus();
                // showtoastInw(
                //   "Greater than Qty..!!",
                // );
                isfinalloop = true;
                notifyListeners();
              } else {
                scancontroller.clear();
                notifyListeners();
                scanedvalueee = '';

                FocusScope.of(context).unfocus();
                // showtoastInw(
                //   "Greater than Qty..!!",
                // );
                isfinalloop = true;
                notifyListeners();
                showdialogtoast(context, "Serial number already added..!!");
              }
            } else {
              showlist.add(wmstransoutwardtabSerialModel(
                  branch: ConstantValues.branch,
                  scannedqty: 1,
                  itemCode: thirdOutwarditems!.ItemCode!,
                  lineID: thirdOutwarditems!.baseline!,
                  qty: thirdOutwarditems!.ReqQty!,
                  serialnum: scancontroller.text,
                  manageby: thirdOutwarditems!.ManageBy,
                  transNum: thirdOutwarditems!.TransNo.toString(),
                  transtype: "outward"));
              scancontroller.clear();
              notifyListeners();
              scanedvalueee = '';
            }
          } else {
            //    Dboperation.serialExists(
            //       tn.toString(), scanserialctrl1.text.toString(), db)
            //   .then((valueSerial) async {
            // if (valueSerial != null) {
            //   if (valueSerial < 1) {
            if (thirdOutwarditems!.ManageBy!.toLowerCase() == 'b') {
              if (scancontroller.text.isNotEmpty && scancontroller.text != '') {
                showlist.add(wmstransoutwardtabSerialModel(
                    branch: ConstantValues.branch,
                    scannedqty: int.parse(quantitycontroller.text),
                    itemCode: thirdOutwarditems!.ItemCode!,
                    lineID: thirdOutwarditems!.baseline!,
                    qty: thirdOutwarditems!.ReqQty!,
                    serialnum: scancontroller.text,
                    manageby: thirdOutwarditems!.ManageBy,
                    transNum: thirdOutwarditems!.TransNo.toString(),
                    transtype: "outward"));
                scancontroller.clear();
                notifyListeners();
                scanedvalueee = '';
                quantityEnable = false;
                // final audio = AudioPlayer();
                // await audio.stop();
                // await audio.setAsset("Asset/scan_serial_correct.mp3");
                // audio
                //     .play(); // savelistinwardState().     playsound("scan_serial_correct");
                // notifyListeners();
                // mycontroller[1].clear();
                // serialscannedData = '';
                // mycontroller[2].clear();
                // mycontroller[3].clear();
                // mycontroller[2].text = '1';
                // notifyListeners();
                isfinalloop = false;
                notifyListeners();
              }
            } else {
              if (scancontroller.text.isNotEmpty && scancontroller.text != '') {
                showlist.add(wmstransoutwardtabSerialModel(
                    branch: ConstantValues.branch,
                    scannedqty: 1,
                    itemCode: thirdOutwarditems!.ItemCode!,
                    lineID: thirdOutwarditems!.baseline!,
                    qty: thirdOutwarditems!.ReqQty!,
                    serialnum: scancontroller.text,
                    manageby: thirdOutwarditems!.ManageBy,
                    transNum: thirdOutwarditems!.TransNo.toString(),
                    transtype: "outward"));
                scancontroller.clear();
                notifyListeners();
                scanedvalueee = '';

                // final audio = AudioPlayer();
                // await audio.stop();
                // await audio.setAsset("Asset/scan_serial_correct.mp3");
                // audio
                //     .play(); // savelistinwardState().     playsound("scan_serial_correct");
                // notifyListeners();
                // mycontroller[1].clear();
                // serialscannedData = '';
                // mycontroller[2].clear();
                // mycontroller[3].clear();
                // mycontroller[2].text = '1';
                // notifyListeners();
                isfinalloop = false;
                notifyListeners();
              }
            }

            // } else {
            //   // const snackBar = SnackBar(
            //   //   duration: Duration(seconds: 2),
            //   //   backgroundColor: Colors.red,
            //   //   content: Text(
            //   //     "Serial number already added!!..",
            //   //     style: TextStyle(),
            //   //   ),
            //   // );
            //   // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   // final audio = AudioPlayer();
            //   // await audio.stop();
            //   // await audio.setAsset("Asset/scan_serial_wrong.mp3");
            //   // audio.play();
            //   // mycontroller[1].clear();
            //   // serialscannedData = '';

            //   // mycontroller[2].clear();
            //   // mycontroller[2].text = '1';

            //   // showtoastInw(
            //   //   "Serial number already added..!!",
            //   // );
            //   isfinalloop = true;
            //   notifyListeners();
            //   showdialogtoast(context, "Serial number already added..!!");
            //   // isfinalloop = false;
            //   notifyListeners();
            //   //  await  playsound();
            //   notifyListeners();
            // }
          }
          // });
          // }
        }
      } else {
        isfinalloop = false;
        showdialogtoast(
            context, "Scanned Serial Number is not Alocated List..!!");
        notifyListeners();
      }
    } else {
      isfinalloop = false;
      showdialogtoast(context, "Preferred Serial Number Not Added..!!");
      notifyListeners();
    }
  }

  bool? isfinalloop = false;
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
                contentPadding: const EdgeInsets.all(0),
                content: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(5),
                        // topRight: Radius.circular(5),

                        ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: thirdcolor,
                            borderRadius: const BorderRadius.only(
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
                        padding: const EdgeInsets.all(8),
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
                            //     ElevatedButton(
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
                                    isfinalloop = false;

                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("ok"))
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

  String? selectedtransno2 = '';
  transnoclicked(String? selectedtransno) {
    log("selectedtransno::$selectedtransno");
    selectedtransno2 = selectedtransno;

    notifyListeners();
    pageChanged == 0;
    Get.toNamed(ConstantRoutes.transOutsecondpage);
    notifyListeners();
  }

  secondpageint() async {
    pageChanged = 0;
    finallodaing = false;
    quantityEnable = false;
    commentscontroller.clear();
    scanedvalueee = null;
    scancontroller.clear();
    log("selectedtransno2::$selectedtransno2");
    itempageloading = true;
    notifyListeners();
    itemdetailslist.clear();
    notifyListeners();
    for (int i = 0; i < Outwarditems.length; i++) {
      log("Outwarditems[i].::${Outwarditems[i].TransNo}");
      if (Outwarditems[i].TransNo.toString() == selectedtransno2.toString()) {
        itemdetailslist.add(GetOutWardModel(
            BaseEntry: Outwarditems[i].BaseEntry,
            baseline: Outwarditems[i].baseline,
            InStock: Outwarditems[i].InStock,
            ItemCode: Outwarditems[i].ItemCode,
            ItemDetails: Outwarditems[i].ItemDetails,
            ReqQty: Outwarditems[i].ReqQty,
            TransDate: Outwarditems[i].TransDate,
            ManageBy: Outwarditems[i].ManageBy,
            TransNo: Outwarditems[i].TransNo));
      }
    }
    if (itemdetailslist.isNotEmpty) {
      getqty.clear();
      await gettotal();
      await getsaveenable();
      await getAllQuantity();
      ScanTotal = 0;
      finaldoc.clear();
      await GetAllDBqty();
      notifyListeners();
    }
    itempageloading = false;
    notifyListeners();
  }

  List<double>? grpSum;
  double? grpTotalDouble;
  int? grpTotal;
  getAllQuantity() {
    if (itemdetailslist.length != 0) {
      var ab =
          itemdetailslist.map((itemdet) => itemdet.ReqQty!.toStringAsFixed(0));
      // print("getAllQuantity : $ab");
      grpSum = ab.map(double.parse).toList();
      print(grpSum);
      grpTotalDouble = grpSum!.reduce((a, b) => a + b); //for adding array items
      //   print("grpTotalDouble: " + grpTotalDouble.toString());
      grpTotal = int.parse(grpTotalDouble!.toStringAsFixed(0));
      log("grpTotal::$grpTotal");
      // print("grpTotal: "+grpTotal.toString());
    } else {
      // setState(() {
      //   grandTotal = 0.00;
      //   total = 0.00;
      // });
    }
  }

  final PageController pageControlleroutward = PageController(initialPage: 0);
  init() async {
    log("TransferOutwardctrl Created");
    clearAll();
    notifyListeners();
    // await getserialnum();
    await getBranchList();

    notifyListeners();
  }

  clearAll() {
    itemdetailslist.clear();
    notifyListeners();

    searchfilteritemdetailslist.clear();
    notifyListeners();
    finalOutwardlist.clear();
    notifyListeners();
    Outwarditems.clear();
    branchDropDown = null;
    notifyListeners();
  }

  Config config = Config();
  //  S E A R C H F I L T E R //
  // List<GetOutWardModel> filterOutwarditems = [];
  // // List<GetOutWardModel> Outitems = [];

  // SearchFilterEmployeedetails(String v) {
  //   print('saearch :' + v!);
  //   if (v.isNotEmpty) {
  //     // isloading=true;

  //     filterOutwarditems = Outwarditems.where(
  //       (e) => (e).TransNo!.toString().toLowerCase().contains(v.toLowerCase()),
  //     ).toList();

  //     notifyListeners();
  //   } else if (v.isEmpty) {
  //     filterOutwarditems = Outwarditems;
  //     notifyListeners();
  //   }
  // }

//  O U T W A R D D E T A I L S  //

  List<GetOutWardModel> Outwarditems = [];
  List<GetOutWardModel> finalOutwardlist = [];
  List<GetOutWardModel> itemdetailslist = [];
  List<GetOutWardModel> searchfilterseconditemdetailslist = [];

  List<GetOutWardModel> searchfilteritemdetailslist = [];
  bool itempageloading = false;
  Outwardfilterdetails(String v) {
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      searchfilteritemdetailslist = finalOutwardlist
          .where((e) =>
              (e).TransNo!.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).TransDate.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();

      notifyListeners();
    } else if (v.isEmpty) {
      searchfilteritemdetailslist = finalOutwardlist;
      notifyListeners();
    }
  }

  secondOutwardfilterdetails(String v) {
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      searchfilterseconditemdetailslist = itemdetailslist
          .where((e) =>
              (e).ItemDetails!.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).ItemCode.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();

      notifyListeners();
    } else if (v.isEmpty) {
      searchfilterseconditemdetailslist = itemdetailslist;
      notifyListeners();
    }
  }

  checkduplicates(GetOutWardModel Outwarditemscheck) {
    if (finalOutwardlist.isEmpty) {
      finalOutwardlist.clear();
      notifyListeners();
      finalOutwardlist.add(GetOutWardModel(
          BaseEntry: Outwarditemscheck.BaseEntry,
          baseline: Outwarditemscheck.baseline,
          InStock: Outwarditemscheck.InStock,
          ItemCode: Outwarditemscheck.ItemCode,
          ItemDetails: Outwarditemscheck.ItemDetails,
          ReqQty: Outwarditemscheck.ReqQty,
          TransDate: Outwarditemscheck.TransDate,
          ManageBy: Outwarditemscheck.ManageBy,
          TransNo: Outwarditemscheck.TransNo));
    } else {
      bool? isalireadyadded = false;
      isalireadyadded = false;
      for (int i = 0; i < finalOutwardlist.length; i++) {
        if (finalOutwardlist[i].TransNo == Outwarditemscheck.TransNo) {
          isalireadyadded = true;
          notifyListeners();
          break;
        }
      }
      if (isalireadyadded == true) {
      } else {
        finalOutwardlist.add(GetOutWardModel(
            BaseEntry: Outwarditemscheck.BaseEntry,
            baseline: Outwarditemscheck.baseline,
            InStock: Outwarditemscheck.InStock,
            ItemCode: Outwarditemscheck.ItemCode,
            ItemDetails: Outwarditemscheck.ItemDetails,
            ReqQty: Outwarditemscheck.ReqQty,
            ManageBy: Outwarditemscheck.ManageBy,
            TransDate: Outwarditemscheck.TransDate,
            TransNo: Outwarditemscheck.TransNo));
        notifyListeners();
      }
    }
  }

  String? error;
  bool outwardloading = false;
  getoutwarddetails() async {
    Outwarditems.clear();
    notifyListeners();
    // filterOutwarditems.clear();
    // notifyListeners();
    outwardloading = true;
    notifyListeners();
    await GetOutwardApi.getData(branchDropDown.toString()).then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 200) {
        Outwarditems = value.Data!;
        searchfilteritemdetailslist = finalOutwardlist;
        searchfilterseconditemdetailslist = itemdetailslist;
        notifyListeners();
        ConstantValues.Whsecode = Branchlistdata[0].WhsName.toString();
        // finalOutwardlist = value.Data!;
        // filterOutwarditems = Outwarditems;
        for (int i = 0; i < Outwarditems.length; i++) {
          checkduplicates(Outwarditems[i]);
          notifyListeners();
        }

        outwardloading = false;
        notifyListeners();

        error = "";
        log("Serialnumlength:::${Outwarditems.length}");
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        error = value.execption!;
        outwardloading = false;
        notifyListeners();
      } else {
        error = value.execption!;
        outwardloading = false;
        notifyListeners();
      }
    });
  }

  // filteroutwarddata(GetOutWardModel filtertransno) {
  //   for (int i = 0; i < Outwarditems.length; i++) {
  //     if (Outwarditems[i].TransNo != filtertransno.TransNo) {
  //       finalOutwardlist.add(GetOutWardModel(
  //           BaseEntry: Outwarditems[i].BaseEntry,
  //           baseline: Outwarditems[i].baseline,
  //           InStock: Outwarditems[i].InStock,
  //           ItemCode: Outwarditems[i].ItemCode,
  //           ItemDetails: Outwarditems[i].ItemDetails,
  //           ReqQty: Outwarditems[i].ReqQty,
  //           TransDate: Outwarditems[i].TransDate,
  //           TransNo: Outwarditems[i].TransNo));
  //       log("finalOutwardlist:::::::${finalOutwardlist.length}");
  //     }
  //   }
  // }

  // S E R I A L N U M //

  List<serialnumber> Serialnum = [];
  String? error1;
  bool serialloading = false;

  getserialnum() async {
    Serialnum.clear();
    notifyListeners();
    serialloading = true;
    notifyListeners();
    await SerialnumApi.getdata(
            branchDropDown, thirdOutwarditems!.ItemCode.toString())
        .then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 210) {
        Serialnum = value.serialnumberdata!;
        error = "";
        serialloading = false;
        notifyListeners();
        log("Serialnumlengtgh::${Serialnum.length}");
      } else if (value.rescode! >= 400 && value.rescode! <= 410) {
        error = value.execption;
        serialloading = false;
        notifyListeners();
      } else {
        error = value.execption;
        serialloading = false;
        notifyListeners();
      }
    });
  }

  //  B R A N C H L I S T //
  String? branchDropDown;

  List<BranchList> Branchlistdata = [];
  String? error2;
  bool BranchListloading = false;

  getBranchList() async {
    Branchlistdata.clear();
    notifyListeners();
    BranchListloading = true;
    notifyListeners();
    await BranchListApi.getData().then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        Branchlistdata = value.BranchListdata!;
        error = value.execption;
        BranchListloading = false;
        notifyListeners();
        log("Branchlistdatalength::${Branchlistdata.length}");
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        error = value.execption;
        BranchListloading = false;
        notifyListeners();
      } else {
        error = value.execption;
        BranchListloading = false;
        notifyListeners();
      }
    });
  }
}
