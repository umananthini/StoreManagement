import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/DBHELPER/DBOperation.dart';
import 'package:warehousemanagement/DBHELPER/dbhelper.dart';
import 'package:warehousemanagement/DBMODEL/purchaseInwDBModel/PurchaseInwDBModel.dart';
import 'package:warehousemanagement/MODEL/PurchaseInwModel/PurchaseInwPendingModel.dart';
import 'package:warehousemanagement/MODEL/qrcodemodel.dart';
import 'package:warehousemanagement/PAGES/PurchaseInward1/PurchaseInwardSecondPage.dart';
import 'package:warehousemanagement/SERVICES/PurchaseInwardApi/FinalsaveApi.dart';
import 'package:warehousemanagement/SERVICES/PurchaseInwardApi/GetPendingApi.dart';

class PurchaseInwardCtrl extends ChangeNotifier {
  TextEditingController scancontroller1 = TextEditingController();
  TextEditingController scancontroller2 = TextEditingController();
  TextEditingController searchfilter1 = TextEditingController();
  TextEditingController searchfilter11 = TextEditingController();

  TextEditingController searchfilter2 = TextEditingController();

  TextEditingController priceController = TextEditingController();

  bool? quantityEnable = false;
  String? searchpurchase;
  List<int> getqty = [];
  bool saveenablebutton = false;
  getsaveenable() async {
    getqty = [];
    await gettotal();
    bool issaveenable = false;
    issaveenable = false;
    if (getqty.isNotEmpty) {
      for (int i = 0; i < secondvendoritemlist.length; i++) {
        if (getqty[i] > 0) {
          issaveenable = true;
          // notifyListeners();
        }
      }
    }

    if (issaveenable == true) {
      log("saveLLtrure");
      saveenablebutton = true;
    } else {
      saveenablebutton = false;
    }
  }

  bool issearchpressed1 = false;
  bool issearchpressed2 = false;
  bool invoicepressed = false;

  bool searchfield = false;
  showtoastInwneww22(String msg) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  showtoastInwneww() {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: "Enter Price",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  showtoastInw() {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: "Complete Invoice Details",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  gettotal() async {
    getqty = [];
    notifyListeners();
    log("inwItemList::" + secondvendoritemlist.length.toString());
    final Database db = (await DBHelper.getinstance())!;
    for (int i = 0; i < secondvendoritemlist.length; i++) {
      await Dboperation.purchaseinwgetoverallcount(
              db,
              secondvendoritemlist[i].DocEntry.toString(),
              secondvendoritemlist[i].itemcode.toString(),
              secondvendoritemlist[i].LineNum!)
          .then((value) {
        log("value::" + value.toString());
        // if(value !=0){
        getqty.add(value);
        // }

        notifyListeners();
        //       for(int i =0;i<getqty.length;i++){
        // log("getqtygetqtygetqty::" + getqty[i].toString());
        //       }

        // log("getqty[i]::" + getqty[i].toString());
      });
    }
  }

  List<double>? grpSum;
  double? grpTotalDouble;
  int? grpTotal;
  int? ScanTotal;
  // GetAllDBqty() async {
  //   final Database db = (await DBHelper.getinstance())!;
  //   finaldoc = await Dboperation.getAllProducts(
  //     db,
  //   vendoritemlist[0].DocEntry==null?null:  inwItemList[0].DocEntry.toString(),
  //   );
  //   if (finaldoc.isNotEmpty) {
  //     log("finaldoc::" + finaldoc.length.toString());
  //     for (int i = 0; i < finaldoc.length; i++) {
  //       String? qty2 = finaldoc[i].quantity.toStringAsFixed(0);
  //       log("qty2::" + qty2.toString());
  //       log("ScanTotalbefore::" + qty2.toString());
  //       ScanTotal = ScanTotal! + int.parse(qty2);
  //       log("ScanTotal::" + ScanTotal.toString());
  //     }
  //   }

  //   return ScanTotal;
  // }

  getAllQuantity() {
    if (secondvendoritemlist.length != 0) {
      var ab = secondvendoritemlist.map(
          (itemdet) => double.parse(itemdet.Qty.toString()).toStringAsFixed(0));
      // print("getAllQuantity : $ab");
      grpSum = ab.map(double.parse).toList();
      print(grpSum);
      grpTotalDouble = grpSum!.reduce((a, b) => a + b); //for adding array items
      //   print("grpTotalDouble: " + grpTotalDouble.toString());
      grpTotal = int.parse(grpTotalDouble!.toStringAsFixed(0));
      log("grpTotal::" + grpTotal.toString());
      // print("grpTotal: "+grpTotal.toString());
    } else {
      // setState(() {
      //   grandTotal = 0.00;
      //   total = 0.00;
      // });
    }
  }

  List<wmstranspurchaseSerialModel> finaldoc = [];
  GetAllDBqty() async {
    final Database db = (await DBHelper.getinstance())!;

    finaldoc = await Dboperation.getdatapurchaseinw(
      db,
      secondpagevendorlist!.Code.toString(),
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
    int docEntry = thirdvendoritemlist!.DocEntry!;
    log("aaa" + docEntry.toString());
    log("bbb" + thirdvendoritemlist!.itemcode.toString());
    log("cccc" + thirdvendoritemlist!.LineNum.toString());
    await Dboperation.purchaseinwitemuidExists(
            docEntry.toString(),
            thirdvendoritemlist!.itemcode.toString(),
            thirdvendoritemlist!.LineNum.toString(),
            db)
        .then((value) async {
      log("valalalal :" + value.toString());
      if (value != null) {
        await Dboperation.purchaseinwitemdelete(
            docEntry,
            thirdvendoritemlist!.itemcode.toString(),
            thirdvendoritemlist!.LineNum.toString(),
            db);
        await Dboperation.purchaseinwserialdelete(
            docEntry,
            thirdvendoritemlist!.itemcode.toString(),
            thirdvendoritemlist!.LineNum.toString(),
            db);
        var values222;

        var values;
        if (DBdata.isNotEmpty) {
          var val22 = wmstranspurchaseitemModel(
              scannedqty: DBdata.length,
              baseEntry: docEntry,
              docentry: thirdvendoritemlist!.DocEntry,
              baseLine: thirdvendoritemlist!.LineNum,
              baseType: "Invoice",
              itemCode: thirdvendoritemlist!.itemcode!,
              itemDescription: thirdvendoritemlist!.ItemName,
              lineNum: thirdvendoritemlist!.LineNum,
              manageBy: "${thirdvendoritemlist!.manageBy}",
              price: double.parse(thirdvendoritemlist!.Price.toString()),
              quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
              salesPersonCode: 1,
              taxCode: thirdvendoritemlist!.TaxCode,
              taxRate:
                  double.parse(thirdvendoritemlist!.TaxRate.toString()).toInt(),
              warehouseCode: ConstantValues.branch);
          values222 = val22;
          await Dboperation.insertpurchaseinwitemdata([values222], db);
        }

        for (int i1 = 0; i1 < DBdata.length; i1++) {
          print("data.length: ${DBdata.length}");
          print("i11111: $i1");
          //newrequired

          var val = wmstranspurchaseSerialModel(
              scannedqty: DBdata[i1].scannedqty,
              docentry: DBdata[i1].docentry,
              itemCode: DBdata[i1].itemCode,
              itemDescription: DBdata[i1].itemDescription,
              lineNum: DBdata[i1].lineNum,
              price: DBdata[i1].price,
              quantity: DBdata[i1].quantity,
              manufacturerSerialNumber: DBdata[i1].manufacturerSerialNumber,
              internalSerialNumber: DBdata[i1].internalSerialNumber,
              manageby: DBdata[i1].manageby,
              taxRate:
                  double.parse(thirdvendoritemlist!.TaxRate.toString()).toInt(),
              notes: DBdata[i1].notes);
          values = val;
          await Dboperation.insertpurchaseinwserialdata(values, db)
              .then((value) async {
            print("inserted!!..");
            Dboperation.purchaseinwitemuidExists(
                docEntry.toString(),
                thirdvendoritemlist!.itemcode.toString(),
                thirdvendoritemlist!.LineNum.toString(),
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
            duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
      } else {
        var values222;

        var values;
        if (DBdata.isNotEmpty) {
          var val22 = wmstranspurchaseitemModel(
              scannedqty: DBdata.length,
              baseEntry: docEntry,
              docentry: thirdvendoritemlist!.DocEntry,
              baseLine: thirdvendoritemlist!.LineNum,
              baseType: "I",
              itemCode: thirdvendoritemlist!.itemcode!,
              itemDescription: thirdvendoritemlist!.ItemName,
              lineNum: thirdvendoritemlist!.LineNum,
              manageBy: "${thirdvendoritemlist!.manageBy}",
              price: double.parse(thirdvendoritemlist!.Price.toString()),
              quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
              salesPersonCode: 1,
              taxCode: thirdvendoritemlist!.TaxCode,
              warehouseCode: ConstantValues.branch,
              taxRate: double.parse(thirdvendoritemlist!.TaxRate.toString())
                  .toInt());
          values222 = val22;
        }

        await Dboperation.insertpurchaseinwitemdata([values222], db);
        for (int i1 = 0; i1 < DBdata.length; i1++) {
          print("data.length: ${DBdata.length}");
          print("i11111: $i1");
          //newrequired

          var val = wmstranspurchaseSerialModel(
              scannedqty: DBdata[i1].scannedqty,
              docentry: DBdata[i1].docentry,
              itemCode: DBdata[i1].itemCode,
              itemDescription: DBdata[i1].itemDescription,
              lineNum: DBdata[i1].lineNum,
              price: DBdata[i1].price,
              quantity: DBdata[i1].quantity,
              manufacturerSerialNumber: DBdata[i1].manufacturerSerialNumber,
              manageby: DBdata[i1].manageby,
              internalSerialNumber: DBdata[i1].internalSerialNumber,
              taxRate:
                  double.parse(thirdvendoritemlist!.TaxRate.toString()).toInt(),
              notes: DBdata[i1].notes);
          values = val;
          await Dboperation.insertpurchaseinwserialdata(values, db)
              .then((value) async {
            print("inserted!!..");
            Dboperation.purchaseinwitemuidExists(
                docEntry.toString(),
                thirdvendoritemlist!.itemcode.toString(),
                thirdvendoritemlist!.LineNum.toString(),
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
            duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
      }
    });
  }

  deletedata(int index) {
    DBdata.removeAt(index);
    notifyListeners();
  }

  String? scanedvalueee1;
  String? scanedvalueee2;

  bool isPressed = false;

  bool isfinalloop = false;
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
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: primarycolor,
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

  FocusNode focusnode4 = FocusNode();
  ScannedQty() {
    int qty = 0;
    for (int i = 0; i < DBdata.length; i++) {
      // log("dbdata::"+dbdata[i].quantity.toString());
      String? qty2 = DBdata[i].scannedqty!.toStringAsFixed(0);
      String? lineNum1 = DBdata[i].lineNum!.toStringAsFixed(0);

      qty = qty + int.parse(qty2);
      // notifyListeners();
    }
    return qty;
  }

  itemlinetotal(double price, double qty, double tax) {
    double linetotal = 0.0;
    linetotal = 0.0;

    double taxamount = 0.0;
    taxamount = 0.0;
    taxamount = taxamount + (double.parse(price.toString()) * qty) * tax / 100;
    linetotal = linetotal + (double.parse(price.toString()) * qty) + taxamount;
    return linetotal;
  }

  lineTotal() {
    // Linetotal = price * scanned qty * (1+taxrate/100)
    double lineTotal = 0.0;
    for (int i = 0; i < DBdata.length; i++) {
      double price = DBdata[i].price ?? 0;
      double qty = (DBdata[i].scannedqty ?? 0).toDouble();
      double tax = (DBdata[i].taxRate ?? 0).toDouble();

      lineTotal = lineTotal = price * qty * (1 + tax / 100);
    }
    return lineTotal;
    // log('linetotal');
  }

  bool? ACSerial = false;

  List<wmstranspurchaseSerialModel> DBdata = [];
  afterserialscanned(
      String code, String scanserial2, BuildContext context) async {
    bool isitemfound = false;
    final Database db = (await DBHelper.getinstance())!;
    isitemfound = false;
    notifyListeners();

    scancontroller1.text = code;
    scancontroller2.text = scanserial2;

    log("code::${code}");
    int qtys = int.parse(thirdvendoritemlist!.Qty!);

    if (scancontroller1.text.isEmpty) {
      scancontroller1.clear();
      scanedvalueee1 = '';
      notifyListeners();

      // audio.play();
      FocusScope.of(context).unfocus();
      // showtoastInw("Please Give Serial Number..!!");
      isfinalloop = true;
      notifyListeners();
      showdialogtoast(context, "Please Give Serial Number..!!");

      // await  playsound("scan_serial_wrong");
      notifyListeners();
    } else if (qtys <= ScannedQty() ||
        qtys <
            ScannedQty() +
                (thirdvendoritemlist!.manageBy!.toLowerCase() == 'b'
                    ? int.parse(quantitycontroller.text)
                    : 1)) {
      scancontroller1.clear();
      notifyListeners();
      scanedvalueee1 = '';
      scancontroller2.clear();
      notifyListeners();
      scanedvalueee2 = '';
      ACSerial = false;

      FocusScope.of(context).unfocus();
      // showtoastInw(
      //   "Greater than Qty..!!",
      // );
      isfinalloop = true;
      notifyListeners();
      showdialogtoast(context, "Greater than Qty..!!");
      // isfinalloop = false;

      notifyListeners();
//  await      playsound("when_checklist_popup");
      // notifyListeners();
      // focus.requestFocus();
    } else {
      if (DBdata.length > 0 && scancontroller1.text.isNotEmpty) {
        int datapresent = 0;
        int? dataindex = null;
        for (int i = 0; i < DBdata.length; i++) {
          print("for serail1111: " + DBdata[i].manufacturerSerialNumber!);
          // print("for serail1111: " + DBdata[i].internalSerialNumber!);

          if (DBdata[i].internalSerialNumber!.isNotEmpty) {
            if (DBdata[i].manufacturerSerialNumber == scancontroller1.text &&
                DBdata[i].internalSerialNumber == scancontroller2.text) {
              datapresent = datapresent + 1;
              dataindex = i;
              notifyListeners();
            }
          } else {
            if (DBdata[i].manufacturerSerialNumber == scancontroller1.text) {
              datapresent = datapresent + 1;
              dataindex = i;
              notifyListeners();
            }
          }
        }
        if (datapresent == 0) {
          Dboperation.purchaseinwserialExists(
                  thirdvendoritemlist!.DocEntry.toString(),
                  scancontroller1.text.toString(),
                  db)
              .then((valueserial) async {
            log("valueserialvalueserial: " + valueserial.toString());
            if (valueserial != null) {
              log("valueserialvalueserial: " + valueserial.toString());
              if (valueserial < 1) {
                log("value222222222222: " + valueserial.toString());
                if (scancontroller1.text.isNotEmpty &&
                    scancontroller1.text != '') {
                  DBdata.add(wmstranspurchaseSerialModel(
                      scannedqty: 1,
                      docentry: thirdvendoritemlist!.DocEntry,
                      itemCode: thirdvendoritemlist!.itemcode,
                      itemDescription: thirdvendoritemlist!.ItemName,
                      lineNum: thirdvendoritemlist!.LineNum,
                      manageby: thirdvendoritemlist!.manageBy,
                      price:
                          double.parse(thirdvendoritemlist!.Price.toString()),
                      quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
                      manufacturerSerialNumber: scancontroller1.text,
                      internalSerialNumber: scancontroller2.text,
                      taxRate:
                          double.parse(thirdvendoritemlist!.TaxRate.toString())
                              .toInt(),
                      notes: ""));
                  // final audio = AudioPlayer();
                  // await audio.stop();
                  // await audio.setAsset("Asset/scan_serial_correct.mp3");
                  // audio.play();
                  //  savelistinwardState().  playsound("scan_serial_correct");
                  scancontroller1.clear();
                  scanedvalueee1 = null;
                  scancontroller2.clear();
                  ACSerial = false;
                  scanedvalueee2 = '';
                  notifyListeners();
                  // mycontroller[1].clear();
                  // serialscannedData = '';
                  // mycontroller[2].clear();
                  // mycontroller[2].text = '1';
                  // mycontroller[3].clear();

                  // isfinalloop = false;
                  // notifyListeners();
                }
              } else {
                // const snackBar = SnackBar(
                //   duration: Duration(seconds: 2),
                //   backgroundColor: Colors.red,
                //   content: Text(
                //     "Serial number already added!!..",
                //     style: TextStyle(),
                //   ),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // final audio = AudioPlayer();
                // await audio.stop();
                // await audio.setAsset("Asset/scan_serial_wrong.mp3");
                // mycontroller[1].clear();
                // serialscannedData = '';
                // mycontroller[2].clear();
                // mycontroller[2].text = '1';
                // notifyListeners();

                // audio.play();

                // showtoastInw(
                //   "Serial number already added..!!",
                // );
                isfinalloop = true;
                notifyListeners();
                showdialogtoast(context, "Serial number already added..!!");
                // isfinalloop = false;
                notifyListeners();
                //  await  playsound("scan_serial_wrong");
                notifyListeners();
              }
            } else {
              if (scancontroller1.text.isNotEmpty &&
                  scancontroller1.text != '') {
                if (thirdvendoritemlist!.manageBy!.toLowerCase() == 'b') {
                  DBdata.add(wmstranspurchaseSerialModel(
                      scannedqty: int.parse(quantitycontroller.text),
                      docentry: thirdvendoritemlist!.DocEntry,
                      itemCode: thirdvendoritemlist!.itemcode,
                      itemDescription: thirdvendoritemlist!.ItemName,
                      lineNum: thirdvendoritemlist!.LineNum,
                      manageby: thirdvendoritemlist?.manageBy.toString(),
                      price:
                          double.parse(thirdvendoritemlist!.Price.toString()),
                      quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
                      // int.parse(thirdvendoritemlist!.Qty.toString()),
                      manufacturerSerialNumber: scancontroller1.text,
                      internalSerialNumber: scancontroller2.text,
                      taxRate:
                          int.parse(thirdvendoritemlist!.TaxCode.toString()),
                      notes: ""));
                  notifyListeners();
                  scancontroller1.clear();
                  scanedvalueee1 = null;
                  quantityEnable = true;
                  scancontroller2.clear();
                  ACSerial = false;
                  scanedvalueee2 = '';
                  notifyListeners();
                } else {
                  DBdata.add(wmstranspurchaseSerialModel(
                      scannedqty: 1,
                      docentry: thirdvendoritemlist!.DocEntry,
                      itemCode: thirdvendoritemlist!.itemcode,
                      itemDescription: thirdvendoritemlist!.ItemName,
                      lineNum: thirdvendoritemlist!.LineNum,
                      manageby: thirdvendoritemlist?.manageBy.toString(),
                      price:
                          double.parse(thirdvendoritemlist!.Price.toString()),
                      quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
                      // int.parse(thirdvendoritemlist!.Qty.toString()),
                      manufacturerSerialNumber: scancontroller1.text,
                      internalSerialNumber: scancontroller2.text,
                      taxRate:
                          double.parse(thirdvendoritemlist!.TaxRate.toString())
                              .toInt(),
                      notes: ""));
                  notifyListeners();
                  scancontroller1.clear();
                  scanedvalueee1 = null;
                  scancontroller2.clear();
                  ACSerial = false;
                  scanedvalueee2 = '';
                  notifyListeners();

                  // final audio = AudioPlayer();
                  // await audio.stop();
                  // await audio.setAsset("Asset/scan_serial_correct.mp3");
                  // audio.play();
                  // savelistinwardState().   playsound("scan_serial_correct");
                  notifyListeners();
                }

                // mycontroller[1].clear();
                // serialscannedData = '';
                // mycontroller[2].clear();
                // mycontroller[3].clear();
                // mycontroller[2].text = '1';
                // isfinalloop = false;
                // notifyListeners();
                // notifyListeners();
              } else {
                // final snackBar = SnackBar(
                //   duration: Duration(seconds: 2),
                //   backgroundColor: Colors.red,
                //   content: Text(
                //     "Serial number already added!!..",
                //     style: TextStyle(),
                //   ),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // final audio = AudioPlayer();
                // await audio.stop();
                // await audio.setAsset("Asset/scan_serial_wrong.mp3");
                // audio.play();
                // mycontroller[1].clear();
                // serialscannedData = '';
                // mycontroller[2].clear();
                // mycontroller[2].text = '1';
                // notifyListeners();

                // showtoastInw(
                //   "Serial number already added..!!",
                // );
                isfinalloop = true;
                notifyListeners();
                showdialogtoast(context, "Serial number already added..!!");
                // isfinalloop = false;
                notifyListeners();
                // await playsound("scan_serial_wrong");
                notifyListeners();
              }
            }
          });

          notifyListeners();
          //  scancontroller.clear();
          //               notifyListeners();
          //                 scanedvalueee = '';

          //                 isfinalloop = false;
          notifyListeners();
        } else {
          if (thirdvendoritemlist!.manageBy!.toLowerCase() == 'b') {
            if (DBdata[dataindex!].scannedqty! +
                    int.parse(quantitycontroller.text) >=
                int.parse(thirdvendoritemlist!.Qty!)) {
              scancontroller1.clear();
              scanedvalueee1 = '';
              scancontroller2.clear();
              ACSerial = false;
              scanedvalueee2 = '';
              //                 mycontroller[2].clear();
              //                 mycontroller[2].text = '1';
              notifyListeners();

              // audio.play();

              // showtoastInw(
              //   "Serial number already added..!!",
              // );
              isfinalloop = true;
              notifyListeners();
              showdialogtoast(context, "Greater then Quantity..!!");
              notifyListeners();
            } else {
              DBdata[dataindex].scannedqty = DBdata[dataindex].scannedqty! +
                  int.parse(quantitycontroller.text);
              notifyListeners();
              scancontroller1.clear();
              scanedvalueee1 = null;
              scancontroller2.clear();
              ACSerial = false;
              quantityEnable = false;
              scanedvalueee2 = '';
              notifyListeners();

              // final audio = AudioPlayer();
              // await audio.stop();
              // await audio.setAsset("Asset/scan_serial_correct.mp3");
              // audio.play();
              // savelistinwardState().   playsound("scan_serial_correct");
              notifyListeners();
            }
          } else {
            scancontroller1.clear();
            scanedvalueee1 = '';
            scancontroller2.clear();
            ACSerial = false;
            quantityEnable = false;
            scanedvalueee2 = '';
            //                 mycontroller[2].clear();
            //                 mycontroller[2].text = '1';
            notifyListeners();

            // audio.play();

            // showtoastInw(
            //   "Serial number already added..!!",
            // );
            isfinalloop = true;
            notifyListeners();
            showdialogtoast(context, "Serial number already added..!!");
            // isfinalloop = false;
            notifyListeners();
            //  await  playsound("scan_serial_wrong");
            notifyListeners();
          }
          //  final audio = AudioPlayer();
          //                 await audio.stop();
          //                 await audio.setAsset("Asset/scan_serial_wrong.mp3");
        }
      } else {
        if (thirdvendoritemlist!.manageBy!.toLowerCase() == 'b') {
          DBdata.add(wmstranspurchaseSerialModel(
              scannedqty: int.parse(quantitycontroller.text),
              docentry: thirdvendoritemlist!.DocEntry,
              itemCode: thirdvendoritemlist!.itemcode,
              itemDescription: thirdvendoritemlist!.ItemName,
              lineNum: thirdvendoritemlist!.LineNum,
              manageby: thirdvendoritemlist!.manageBy,
              price: double.parse(thirdvendoritemlist!.Price.toString()),
              quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
              // int.parse(thirdvendoritemlist!.Qty.toString()),
              manufacturerSerialNumber: scancontroller1.text,
              internalSerialNumber: scancontroller2.text,
              taxRate:
                  double.parse(thirdvendoritemlist!.TaxRate.toString()).toInt(),
              notes: ""));
          scancontroller1.clear();
          scanedvalueee1 = null;
          scancontroller2.clear();
          ACSerial = false;
          quantityEnable = false;
          scanedvalueee2 = '';
          notifyListeners();
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
        } else {
          DBdata.add(wmstranspurchaseSerialModel(
              scannedqty: 1,
              docentry: thirdvendoritemlist!.DocEntry,
              itemCode: thirdvendoritemlist!.itemcode,
              itemDescription: thirdvendoritemlist!.ItemName,
              lineNum: thirdvendoritemlist!.LineNum,
              manageby: thirdvendoritemlist!.manageBy,
              price: double.parse(thirdvendoritemlist!.Price.toString()),
              quantity: int.parse(thirdvendoritemlist!.Qty.toString()),
              // int.parse(thirdvendoritemlist!.Qty.toString()),
              manufacturerSerialNumber: scancontroller1.text,
              internalSerialNumber: scancontroller2.text,
              taxRate:
                  double.parse(thirdvendoritemlist!.TaxRate.toString()).toInt(),
              notes: ""));
          scancontroller1.clear();
          scanedvalueee1 = null;
          scancontroller2.clear();
          ACSerial = false;
          quantityEnable = false;
          scanedvalueee2 = '';
          notifyListeners();
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
        // Dboperation.purchaseinwserialExists(
        //         thirdvendoritemlist!.DocEntry.toString(),
        //         scancontroller1.text.toString(),
        //         db)
        //     .then((valueSerial) async {
        //   if (valueSerial != null) {
        //     if (valueSerial < 1) {
        //       if (scancontroller1.text.isNotEmpty &&
        //           scancontroller1.text != '') {

        //       }
        //     }
        //     else {
        //       scancontroller1.clear();
        //       isfinalloop = true;
        //       notifyListeners();
        //       showdialogtoast(context, "Serial number already added..!!");
        //       // isfinalloop = false;
        //       notifyListeners();
        //       //  await  playsound();
        //       notifyListeners();
        //     }
        //   }
        // });

        notifyListeners();
      }
    }
  }

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
          return StatefulBuilder(builder: (context, setst) {
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
                              topRight: const Radius.circular(5),
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
                                child: const Text(
                              "Do you want go back without saving anything??",
                              textAlign: TextAlign.center,
                            )),
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

  List<QrModel> dummyshow = [];
  String inwardscanData = '';
  String detailinwardscanData = '';

  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  init() {
    log("PurchaseInwardCtrl Created");
    clearAll();
    getPendingOrder();
  }

  clearsecondpage() {
    secondpageloading = true;
    notifyListeners();
    getqty.clear();
    notifyListeners();
    finallodaing = false;
    commentcontroller.clear();
    invoicenumcontroller.clear();
    invoicedatecontroller.clear();

    scanedvalueee1 = null;
    scancontroller1.clear();
    secondvendoritemlist.clear();
    filtersecondvendoritemlist.clear();
    notifyListeners();
  }

  int? docentryfirst;
  bool? secondpageloading = false;
  secondpageinit() async {
    pageChanged = 0;
    ACSerial = false;
    ischeckloading = false;
    secondpageloading = true;
    notifyListeners();
    getqty.clear();
    searchfilter11.clear();
    notifyListeners();
    searchfiltersecondvendoritemlist = filtersecondvendoritemlist;
    notifyListeners();
    log("searchfiltersecondvendoritemlist555555;;;;;;${searchfiltersecondvendoritemlist.length}");

    finallodaing = false;
    commentcontroller.clear();
    invoicenumcontroller.clear();
    invoicedatecontroller.clear();

    scanedvalueee1 = null;
    scancontroller1.clear();
    scancontroller2.clear();
    scanedvalueee2 = null;
    secondvendoritemlist.clear();
    filtersecondvendoritemlist.clear();
    notifyListeners();
    for (int i = 0; i < vendoritemlist.length; i++) {
      log("secondpagevendorlist!.Code:" +
          secondpagevendorlist!.Code.toString());
      log("vendoritemlist[i].DocEntry::" +
          vendoritemlist[i].DocEntry.toString());
      if (vendoritemlist[i].DocEntry == secondpagevendorlist!.Code) {
        secondvendoritemlist.add(PurchaseInwPendingDetailList(
            priceedit: null,
            DiscP: vendoritemlist[i].DiscP,
            u_category: vendoritemlist[i].u_category,
            DocEntry: vendoritemlist[i].DocEntry,
            ItemName: vendoritemlist[i].ItemName,
            LineNum: vendoritemlist[i].LineNum,
            MRP: vendoritemlist[i].MRP,
            Price: vendoritemlist[i].Price,
            PriceAfVAT: vendoritemlist[i].PriceAfVAT,
            Qty: vendoritemlist[i].Qty,
            Segment: vendoritemlist[i].Segment,
            SellPrice: vendoritemlist[i].SellPrice,
            TaxCode: vendoritemlist[i].TaxCode,
            TaxRate: vendoritemlist[i].TaxRate,
            WhsCode: vendoritemlist[i].WhsCode,
            manageBy: vendoritemlist[i].manageBy,
            itemcode: vendoritemlist[i].itemcode));
        filtersecondvendoritemlist = secondvendoritemlist;
      }
      notifyListeners();
    }
    if (secondvendoritemlist.isNotEmpty) {
      getqty.clear();
      notifyListeners();

      await gettotal();
      await getsaveenable();
      await getAllQuantity();
      ScanTotal = 0;
      finaldoc.clear();
      await GetAllDBqty();
      notifyListeners();
    }
    secondpageloading = false;
    notifyListeners();
    notifyListeners();
  }

  bool finallodaing = false;
  List<wmstranspurchaseitemModel> finalsavelist = [];
  List<wmstranspurchaseSerialModel> finalseriallist = [];
  methodfinalsave333(
      wmstranspurchaseSerialModel values, wmstranspurchaseitemModel itemtax) {
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
    finalseriallist.add(wmstranspurchaseSerialModel(
        scannedqty: values.scannedqty,
        docentry: values.docentry,
        manageby: values.manageby,
        itemCode: values.itemCode,
        itemDescription: values.itemDescription,
        lineNum: values.lineNum,
        price: values.price,
        quantity: values.quantity,
        manufacturerSerialNumber: values.manufacturerSerialNumber,
        internalSerialNumber: values.internalSerialNumber,
        taxRate: itemtax.taxRate,
        notes: values.notes));
  }

  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  methodfinalsave2222(
      wmstranspurchaseitemModel values, PurchaseInwPendingDetailList itemlist) {
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
    finalsavelist.add(wmstranspurchaseitemModel(
        scannedqty: values.scannedqty,
        baseEntry: values.baseEntry,
        docentry: values.docentry,
        baseLine: values.baseLine,
        baseType: values.baseType,
        itemCode: values.itemCode,
        itemDescription: values.itemDescription,
        lineNum: values.lineNum,
        manageBy: values.manageBy,
        price: double.parse(itemlist.Price.toString()),
        quantity: values.quantity,
        salesPersonCode: values.salesPersonCode,
        taxCode: values.taxCode,
        warehouseCode: values.warehouseCode,
        taxRate: values.taxRate));
  }

  int? overallqty;
  checkqtyfinal(wmstranspurchaseitemModel finalitemlist) {
    overallqty = 0;
    for (int i = 0; i < finalseriallist.length; i++) {
      if (finalseriallist[i].docentry == finalitemlist.docentry &&
          finalseriallist[i].lineNum == finalitemlist.lineNum &&
          finalseriallist[i].itemCode == finalitemlist.itemCode) {
        overallqty = overallqty! + finalseriallist[i].scannedqty!;
      }
    }
    notifyListeners();
  }

  List<ltPurinwitem> itemlist = [];
  List<serialNumbers> seriallist = [];
  checkserialfinal(wmstranspurchaseitemModel finalitemlist) {
    for (int i = 0; i < finalseriallist.length; i++) {
      if (finalseriallist[i].docentry == finalitemlist.docentry &&
          finalseriallist[i].lineNum == finalitemlist.lineNum &&
          finalseriallist[i].itemCode == finalitemlist.itemCode) {
        seriallist.add(serialNumbers(
            manufacturerSerialNumber: finalseriallist[i].internalSerialNumber,
            internalSerialNumber: finalseriallist[i].manufacturerSerialNumber,
            notes: finalseriallist[i].notes,
            quantity: finalseriallist[i].scannedqty));
      }
    }
  }

  dataget(BuildContext context) async {
    DBdata.clear();

    await getDBData(thirdindex!);
  }

  getDBData(int i) async {
    final Database db = (await DBHelper.getinstance())!;
    await Dboperation.purchasegetBinAndSerailNo(
            "${thirdvendoritemlist!.DocEntry}",
            "${secondvendoritemlist[thirdindex!].itemcode}",
            secondvendoritemlist[thirdindex!].LineNum,
            db)
        .then((value) {
      if (value.length > 0) {
        print("length: ${value.length}");
        print("itemCode: ${value[0].itemCode}");
        // setState(() {
        DBdata = value;
        // });
        notifyListeners();
      }
    });
    // for (int i = 0; i < DBdata.length; i++) {
    //   if (DBdata[i]. != '') {
    //     isputawaycheck = true;

    //     notifyListeners();
    //     break;
    //   }
    // }
  }

  TextEditingController commentcontroller = TextEditingController();
  TextEditingController uploadcontroller = TextEditingController();
  TextEditingController invoicenumcontroller = TextEditingController();
  TextEditingController invoicedatecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController savecontroller = TextEditingController();

  savefinal(BuildContext context) async {
    finalsavelist.clear();
    finalseriallist.clear();
    // addputaway.clear();
    final Database db = (await DBHelper.getinstance())!;
    finallodaing = true;
    notifyListeners();
    // await gettotal();
    for (int i = 0; i < secondvendoritemlist.length; i++) {
      if (int.parse(secondvendoritemlist[i].Qty!) > 0) {
        await Dboperation.purchaseinwsaveAllDatafinal(
                secondvendoritemlist[i].DocEntry.toString(),
                secondvendoritemlist[i].itemcode.toString(),
                secondvendoritemlist[i].LineNum.toString(),
                db)
            .then((value) {
          if (value != null) {
            for (int ik = 0; ik < value.length; ik++) {
              //  binlinelist222.clear();
              methodfinalsave2222(value[ik], secondvendoritemlist[i]);
            }
          }
          log("finalsavelist::${finalsavelist.length}");
        });
      }
    }
    for (int i = 0; i < finalsavelist.length; i++) {
      await Dboperation.purchaseinwsaveAllserialDatafinal(
              finalsavelist[i].docentry.toString(),
              finalsavelist[i].itemCode.toString(),
              finalsavelist[i].lineNum.toString(),
              db)
          .then((value) {
        if (value != null) {
          for (int ik = 0; ik < value.length; ik++) {
            //  binlinelist222.clear();
            methodfinalsave333(value[ik], finalsavelist[i]);
          }
        }
      });
    }
    itemlist.clear();

    for (int i = 0; i < finalsavelist.length; i++) {
      seriallist = [];
      checkserialfinal(finalsavelist[i]);
      checkqtyfinal(finalsavelist[i]);
      itemlist.add(ltPurinwitem(
          baseEntry: finalsavelist[i].baseEntry,
          baseLine: finalsavelist[i].baseLine,
          baseType: finalsavelist[i].baseType,
          itemCode: finalsavelist[i].itemCode,
          itemDescription: finalsavelist[i].itemDescription,
          lineNum: finalsavelist[i].lineNum,
          manageBy: finalsavelist[i].manageBy,
          price: finalsavelist[i].price,
          quantity: overallqty,
          taxCode: finalsavelist[i].taxCode,
          warehouseCode: finalsavelist[i].warehouseCode,
          serialnum: seriallist));
    }
    log("itemlist::" + itemlist.length.toString());
    await savefinalPurchaseInwApi
        .getdata(
            itemlist,
            secondpagevendorlist!.VendorCode,
            secondpagevendorlist!.Vendor,
            invoicenumcontroller.text.toString(),
            "Invoice",
            secondpagevendorlist!.DocDate,
            double.parse(secondpagevendorlist!.DocTotal.toString()),
            secondpagevendorlist!.Code.toString(),
            invoicedatecontroller.text.toString(),
            Config.alignexpiry(invoicedatecontroller.text),
            ConstantValues.branch,
            commentcontroller.text,
            attachmentCollectionss)
        .then((value) async {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        for (int i = 0; i < secondvendoritemlist.length; i++) {
          await Dboperation.purchaseinwitemdeletefinal(
              secondvendoritemlist[i].DocEntry!, db);
          await Dboperation.purchaseinwserialdeletefinal(
              secondvendoritemlist[i].DocEntry!, db);
        }
        finallodaing = false;

        showdialogsave(context, "Assets/check.png", "Success",
            value.data!.DocNumber.toString());
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        finallodaing = false;
        showdialogsave(context, "Assets/cancel.png", "Failed 400",
            "${value.exception}".toString());
        notifyListeners();
      } else {
        finallodaing = false;
        showdialogsave(
            context, "Assets/cancel.png", "Failed 500", "Server not Connect");
        notifyListeners();
      }
    });
  }

  bool ischeckloading = false;
  showdialogsave(
      BuildContext context, String? image, String title, String body) {
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);
          return WillPopScope(
            onWillPop: () async => false,
            child: StatefulBuilder(builder: (contex, setst) {
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
                              ? Text(
                                  "Purchase Inward added successfully",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                )
                              : Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
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
            }),
          );
        }).then((value) {
      // ischeckloading=true;
      // notifyListeners();

      //                     if (title.contains("Success")) {
      //                         Get.offAllNamed(ConstantRoutes.purchaseinwnew);

      //                       } else {
      //                         Navigator.pop(context);
      //                         ischeckloading=false;
      //                       }
    });
  }

  bool isloading = false;
  String? exception = '';
  List<PendingVendorModel> vendorlist = [];
  PendingVendorModel? secondpagevendorlist;
  List<PendingVendorModel> filtervendorlist = [];
  List<PendingVendorModel> searchfiltervendorlist = [];

  List<PurchaseInwPendingDetailList> vendoritemlist = [];
  int? thirdindex;
  PurchaseInwPendingDetailList? thirdvendoritemlist;

  List<PurchaseInwPendingDetailList> secondvendoritemlist = [];
  List<PurchaseInwPendingDetailList> filtersecondvendoritemlist = [];
  List<PurchaseInwPendingDetailList> searchfiltersecondvendoritemlist = [];

  editclick(int i) {
    filtersecondvendoritemlist[i].priceedit =
        filtersecondvendoritemlist[i].Price;
    filtersecondvendoritemlist[i].Price = priceController.text;
    notifyListeners();
  }

  getlinetotalwithouttax() {
    double? total = 0.0;
    if (filtersecondvendoritemlist.isNotEmpty &&
        getqty.isNotEmpty &&
        getqty.length == filtersecondvendoritemlist.length) {
      log("getqty::" + getqty.length.toString());
      log("filtersecondvendoritemlist::" +
          filtersecondvendoritemlist.length.toString());
      for (int i = 0; i < filtersecondvendoritemlist.length; i++) {
        double scanvalue = getqty == null || getqty.isEmpty
            ? 0.0
            : getqty[i] == 0
                ? 0.0
                : getqty[i].toDouble();
        log("${scanvalue}TaxRate::${filtersecondvendoritemlist[i].Price}" +
            filtersecondvendoritemlist[i].TaxRate.toString());
        total = total! +
            (double.parse(filtersecondvendoritemlist[i].Price!) * scanvalue);
        // total = total! +
        //     ((double.parse(filtersecondvendoritemlist[i].Price!) * scanvalue) /
        //         (1 +
        //             double.parse(filtersecondvendoritemlist[i].TaxRate!) /
        //                 100));
      }
    }

    log("totaltotal::" + total.toString());
    return total!.toStringAsFixed(2);
  }

  gettaxtotAL() {
    double? taxtotal = 0.0;

    if (filtersecondvendoritemlist.isNotEmpty &&
        getqty.isNotEmpty &&
        getqty.length == filtersecondvendoritemlist.length) {
      for (int i = 0; i < filtersecondvendoritemlist.length; i++) {
        double scanvalue = getqty.isEmpty
            ? 0.0
            : getqty[i] == 0
                ? 0.0
                : getqty[i].toDouble();
        log("${scanvalue}TaxRate::${filtersecondvendoritemlist[i].Price}" +
            filtersecondvendoritemlist[i].TaxRate.toString());
        taxtotal = taxtotal! +
            (double.parse(filtersecondvendoritemlist[i].Price.toString()) *
                    scanvalue) *
                double.parse(filtersecondvendoritemlist[i].TaxRate!) /
                100;
        // taxtotal = taxtotal! +
        //     (double.parse(filtersecondvendoritemlist[i].TaxRate!) *
        //             (double.parse(filtersecondvendoritemlist[i].Price!) *
        //                 scanvalue) /
        //             (1 +
        //                 double.parse(filtersecondvendoritemlist[i].TaxRate!) /
        //                     100)) /
        //         100;
      }
    }

    log("totaltotal::" + taxtotal.toString());
    return taxtotal!.toStringAsFixed(2);
  }

  grosstotal() {
    double total = 0.0;
    double linetotal = double.parse(getlinetotalwithouttax());
    double Taxtotal = double.parse(gettaxtotAL());

    total = total + linetotal + Taxtotal;
    return total.toStringAsFixed(2);
  }

  filtersecondvendoritem(String v) {
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      filtersecondvendoritemlist = secondvendoritemlist
          .where((e) =>
              (e).ItemName!.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).itemcode.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();

      notifyListeners();
    } else if (v.isEmpty) {
      filtersecondvendoritemlist = secondvendoritemlist;
      notifyListeners();
    }
  }

  int? indexscanning;
  bool itemAlreadyscanned = false;
  scanneddataget(BuildContext context) {
    itemAlreadyscanned = false;
    notifyListeners();
    for (int ij = 0; ij < searchfiltervendorlist.length; ij++) {
      if (searchfiltervendorlist[ij].DocNum.toString() == searchfilter1) {
        itemAlreadyscanned = true;
        indexscanning = ij;
        notifyListeners();
        break;
      }
    }
    // if (itemAlreadyscanned == true){
    //   secondpage(filterpendinglist[indexscanning!]);
    //   notifyListeners();
    // } else {
    //   showtoastforscanning();
    //   mycontroller[5].clear();
    //   resetfirst();
    //   notifyListeners();
    // }

//  checkscannedcode(code);
    notifyListeners();
  }

  List<Dataa> returnresponce = [];

  SearchFilter2purchaseinvdetails(String v) {
    print('saearch :' + v);
    if (v.isNotEmpty) {
      // isloading=true;
      log("searchfiltersecondvendoritemlist1;;;;;;${searchfiltersecondvendoritemlist.length}");
      searchfiltersecondvendoritemlist = [];
      notifyListeners();
      log("searchfiltersecondvendoritemlist2;;;;;;${searchfiltersecondvendoritemlist.length}");

      searchfiltersecondvendoritemlist = filtersecondvendoritemlist
          .where((e) =>
              (e).DocEntry.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).ItemName.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).LineNum.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).MRP.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).Price.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).SellPrice.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).TaxCode.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).TaxRate.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();
      log("searchfiltersecondvendoritemlist3;;;;;;${searchfiltersecondvendoritemlist.length}");

      notifyListeners();
    } else if (v.isEmpty) {
      searchfiltersecondvendoritemlist = filtersecondvendoritemlist;

      notifyListeners();
    }
  }

  SearchFilterpurchaseinvdetails(String v) {
    print('saearch :' + v);
    if (v.isNotEmpty) {
      // isloading=true;
      searchfiltervendorlist = filtervendorlist
          .where((e) =>
              (e).DocNum!.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).VendorCode.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).DocDate.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).Vendor.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).Brand.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();

      notifyListeners();
    } else if (v.isEmpty) {
      searchfiltervendorlist = filtervendorlist;

      notifyListeners();
    }
  }

  clearAll() {
    filtervendorlist.clear();
    vendorlist.clear();
    vendoritemlist.clear();
    isloading = false;
    quantityEnable = false;
    exception = '';
    notifyListeners();
  }

  getPendingOrder() async {
    filtervendorlist.clear();
    vendorlist.clear();
    vendoritemlist.clear();
    isloading = true;
    exception = '';
    notifyListeners();

    await purchasePendingInwardApi.getdata().then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        if (value.inwardDetailheader!.itemlist != null &&
            value.inwardDetailheader!.itemlist!.isNotEmpty) {
          vendorlist = value.inwardDetailheader!.itemlist!;
          vendoritemlist = value.inwardDetailheader!.itemlist22!;
          filtervendorlist = vendorlist;
          searchfiltervendorlist = filtervendorlist;

          isloading = false;
          exception = '';
          log("pendinglist::" + vendorlist.length.toString());
          notifyListeners();
        } else if (value.inwardDetailheader!.itemlist == null ||
            value.inwardDetailheader!.itemlist!.isEmpty) {
          isloading = false;
          // lottie = 'Asset/no-data.png';
          exception = "No data Found..!!";
          notifyListeners();
        }
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        isloading = false;
        // lottie = '';
        exception = "${value.message}..${value.exception}..!!";
        Fluttertoast.showToast(
            msg: "${value.message}..${value.exception}..!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
      } else {
        if (value.exception!.contains("Server not Connect")) {
          // lottie = 'Asset/network-signal.png';
          isloading = false;
          exception = "'${value.stcode!}..Server not Connect";
          Fluttertoast.showToast(
              msg: "Server not Connect",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          notifyListeners();
        } else {
          // lottie = 'Asset/warning.png';
          isloading = false;
          exception = "${value.stcode}..${value.exception}..!!";
          notifyListeners();
        }
      }
    });
  }
}
