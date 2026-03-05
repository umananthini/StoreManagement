import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sqflite/sqflite.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/DBHELPER/DBOperation.dart';
import 'package:warehousemanagement/DBHELPER/dbhelper.dart';
import 'package:warehousemanagement/DBMODEL/InWardDBModel/inwarddbmodel.dart';
import 'package:warehousemanagement/DBMODEL/TransferInwDBModel/TransferInwDBModel.dart';
import 'package:warehousemanagement/MODEL/LoadTransferInwardModel/loadtransferinward.dart';
import 'package:warehousemanagement/MODEL/TransferInwardModel/Transferinwardmodel.dart';
import 'package:warehousemanagement/SERVICES/TranferinwardPageApi/Ttranserinwardservice.dart';
import 'package:warehousemanagement/SERVICES/TranferinwardPageApi/loadtransferinwardservices.dart';
import 'package:warehousemanagement/SERVICES/TranferinwardPageApi/postinwardservice.dart';

class TransferInwardctrl extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  TextEditingController scanserialctrl = TextEditingController();
  TextEditingController scanserialctrl1 = TextEditingController();
  TextEditingController searchfilter1 = TextEditingController();
  TextEditingController searchfilter2 = TextEditingController();
  bool? quantityEnable=false;

  TextEditingController quantitycontroller = TextEditingController();



  // TextEditingController qtyctrl=TextEditingController();
  int scanvalue = 1;
  int pageChanged = 0;
  firstbuttonclicked() {
    pageController.animateToPage(++pageChanged,
        duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
    finallodaing = false;
    notifyListeners();
  }

  init() {
    log("TransferInwardctrl Created");
    finallodaing = false;
    gettransinwAPI();
    notifyListeners();
    // loading();
    notifyListeners();
  }

  Config config = Config();

  SingleItemAdded(loadtransferinward1 checkitem) {
    SingleInwardItem.clear();
    notifyListeners();
    for (int i = 0; i < TransferInwarditem.length; i++) {
      if (TransferInwarditem[i].ItemCode == checkitem.ItemCode &&
          TransferInwarditem[i].ItemName == checkitem.ItemName &&
          TransferInwarditem[i].linenum == checkitem.linenum) {
        log("TransferInwarditem[i].linenum::" +
            TransferInwarditem[i].SerialNum.toString());
        SingleInwardItem.add(loadtransferInwardItems1(
            DocEntry: (TransferInwarditem[i].DocEntry),
            ItemCode: TransferInwarditem[i].ItemCode,
            ItemName: TransferInwarditem[i].ItemName,
            Quantity: TransferInwarditem[i].Quantity,
            SerialNum: TransferInwarditem[i].SerialNum,
            WhsCode: TransferInwarditem[i].WhsCode,
            linenum: TransferInwarditem[i].linenum,
            mnfSerial: TransferInwarditem[i].mnfSerial));
      }
    }
  }

  bool isputawaycheck = false;

  getDBData(int i) async {
    final Database db = (await DBHelper.getinstance())!;
    await Dboperation.InwgetBinAndSerailNo("${tn}",
            "${TransferInward[i].ItemCode}", TransferInward[i].linenum, db)
        .then((value) {
      if (value.length > 0) {
        print("length: " + value.length.toString());
        // print("docEntry: " + value[0].docEntry.toString());
        print("itemCode: " + value[0].itemCode.toString());
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
                              "Do you want to go back without saving anything??",
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
                                        TransferInward = filterTransferInward;
                                        filtergetqty = getqty;
                                        isPressed = false;
                                        notifyListeners();
                                        Navigator.pop(context);
                                        FocusScope.of(context).unfocus();
                                        pageController.animateToPage(
                                            --pageChanged,
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.bounceIn);
                                      });
                                    },
                                    child: Text("Yes")),
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
                                    child: Text("No"))
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

  dataget(BuildContext context) async {
    DBdata.clear();

    await getDBData(indexx!);

    // if (inwitemBatchlist.isNotEmpty && dbdata.isNotEmpty) {
    //   await checkdatafrombatch();
    //   await showdialogcheck(context);
    // } else if (inwitemBatchlist.isNotEmpty && dbdata.isEmpty) {
    //   await checkdatafrombatch();
    //   addcheckfrombatch();
    //   // getDBData(index!);
    //   notifyListeners();
    // }
  }

  List<TransferInwardDataModel> filterTransinwdata = [];
  String? error = "";
  String? tn = "";

  bool gettransinwloading = false;
  gettransinwAPI() async {
    Transinwdata.clear();
    filterTransinwdata.clear();
    notifyListeners();
    gettransinwloading = true;
    notifyListeners();

    await TransferinwardService.getdata().then((value) {
      if (value.rescode! >= 200 && value.rescode! <= 200) {
        error = "";
        gettransinwloading = false;
        notifyListeners();
        Transinwdata = value.data!;
        filterTransinwdata = Transinwdata;
        // SearchfilterTransferInward= TransferInward;
        notifyListeners();

        log("inward data:::${Transinwdata}");
      } else if (value.rescode! >= 400 && value.rescode! <= 400) {
        error = value.execption;
        gettransinwloading = false;
        notifyListeners();

        log("error::${value.execption}");
        notifyListeners();
      } else if (value.rescode! >= 500 && value.rescode! <= 510) {
        error = value.execption;
        notifyListeners();

        log("ffff::${value.execption}");
        gettransinwloading = false;

        notifyListeners();
      }
    });
  }

  List<loadtransferinward1> TransferInward = [];
  List<loadtransferinward1> filterTransferInward = [];

  List<loadtransferInwardItems1> TransferInwarditem = [];
  List<loadtransferInwardItems1> SingleInwardItem = [];

  loadtransferinward1? TransferLoad1;

  String? errorr = "";
  int? transnumber = 0;
  bool loadtransinwloading = false;
  bool finalloading = false;

  gettraninwload(String TransNumber) async {
    loadtransinwloading = true;
    notifyListeners();
    tn = TransNumber.toString();
    TransferInward.clear();
    TransferInwarditem.clear();
    filterTransferInward.clear();
    notifyListeners();

    await LoadTransferInwaedServices.getdata(TransNumber).then((value) async {
      if (value.statuscode! >= 200 && value.statuscode! <= 210) {
        error = "";
        filterTransferInward = value.Dataa!.LoadTransferInward1!;
        TransferInwarditem = value.Dataa!.LoadTransferInwardItems1!;
        TransferInward = filterTransferInward;
       
        notifyListeners();
        loadtransinwloading = false;
        notifyListeners();
        log("vvvvvv::${TransferInward}");
        if (TransferInward.isNotEmpty) {
          getqty.clear();
          filtergetqty.clear();
          await gettotal();
          await getsaveenable();
          await getAllQuantity();
          ScanTotal = 0;
          finaldoc.clear();
          await GetAllDBqty();
          notifyListeners();
        } else {}
      } else if (value.statuscode! >= 400 && value.statuscode! <= 410) {
        errorr = value.execption;
        notifyListeners();
        loadtransinwloading = false;
        notifyListeners();
      } else if (value.statuscode! >= 500 && value.statuscode! <= 510) {
        errorr = value.execption;
        notifyListeners();
        loadtransinwloading = false;
        notifyListeners();
      }
    });
     pageChanged =0;
    Get.toNamed(ConstantRoutes.loadtransferinward);
    notifyListeners();
  }

  // List<loadtransferinward1> SearchfilterTransferInward = [];
  check(int TransferInward22) {
    bool isloading = false;
  }

  checksecond(loadtransferinward1 TransferInward22) {
    log("TransferInward22::"+TransferInward22.linenum.toString());
    bool isindata = false;
    int? inindex;
    isindata = false;
    inindex = null;
    for (int i = 0; i < getqty.length; i++) {
      if (i == TransferInward22.linenum) {
        isindata = true;
        inindex = i;
        break;
      } 
    }
    if (isindata == true) {
      filtergetqty.add(getqty[inindex!]);
      notifyListeners();
    }
  }
  bool issearchpressed1=false;
  bool issearchpressed2=false;


  SearchFiltertrans(String v) async{
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      TransferInward = filterTransferInward
          .where(
            (e) =>
                (e).ItemCode.toString().toLowerCase().contains(
                      v.toLowerCase(),
                    ) ||
                (e).ItemName.toString().toLowerCase().contains(
                      v.toLowerCase(),
                    ),
          )
          .toList();
      filtergetqty=[];
      for (int i = 0; i < TransferInward.length; i++) {
        // filtergetqty=getqty.where((e) => ).toList();
   await     checksecond(TransferInward[i]);
// checksecond(i);
      }
//       for(int i=0;i<filtergetqty.length;i++){
// log("message22$i"+filtergetqty[i].toString());

//       }
      
      notifyListeners();
    } else if (v.isEmpty) {
      TransferInward = filterTransferInward;
      filtergetqty = getqty;
      notifyListeners();
    }
  }

  List<TransferInwardDataModel> Transinwdata = [];
  SearchFilterEmployeedetails(String v) {
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      filterTransinwdata = Transinwdata.where((e) =>
          (e).TransNo!.toString().toLowerCase().contains(
                v.toLowerCase(),
              ) ||
          (e).FromBranch.toString().toLowerCase().contains(
                v.toLowerCase(),
              ) ||
          (e).TransDate.toString().toLowerCase().contains(
                v.toLowerCase(),
              )).toList();

      notifyListeners();
    } else if (v.isEmpty) {
      filterTransinwdata = Transinwdata;
      notifyListeners();
    }
  }

  ScannedQty() {
    int qty = 0;
    for (int i = 0; i < DBdata.length; i++) {
      // log("dbdata::"+dbdata[i].quantity.toString());
      String? qty2 = DBdata[i].scannedqty!.toStringAsFixed(0);
      String? lineNum1 = DBdata[i].lineID!.toStringAsFixed(0);

      qty = qty + int.parse(qty2);
      // notifyListeners();
    }
    return qty;
  }

  List<double>? grpSum;
  double? grpTotalDouble;
  int? grpTotal;

  getAllQuantity() {
    if (TransferInward.length != 0) {
      var ab =
          TransferInward.map((itemdet) => itemdet.Quantity!.toStringAsFixed(0));
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

  String? scanedvalueee;

  bool isfinalloop = false;
  List<wmstransInwtabSerialModel> DBdata = [];

  afterserialscanned(String code, BuildContext context) async {
    bool isitemfound = false;
    final Database db = (await DBHelper.getinstance())!;
    isitemfound = false;
    notifyListeners();

    scanserialctrl1.text = code;
    log("code::${code}");
    int qtys = int.parse(TransferLoad1!.Quantity!.toStringAsFixed(0));
    if (SingleInwardItem!.isNotEmpty) {
      for (int i = 0; i < SingleInwardItem.length; i++) {
        log("${SingleInwardItem[i].SerialNum}SingleInwardItem::${"${scanserialctrl1.text}"}");
        if (SingleInwardItem[i].SerialNum == scanserialctrl1.text) {
          isitemfound = true;
          notifyListeners();
          break;
        }
      }
    }
    if (isitemfound == true) {
      if (scanserialctrl1.text.isEmpty) {
        // final audio = AudioPlayer();
        // await audio.setAsset("Asset/scan_serial_wrong.mp3");
        scanserialctrl1.clear();
        scanedvalueee = '';
        notifyListeners();

        // audio.play();
        FocusScope.of(context).unfocus();
        // showtoastInw("Please Give Serial Number..!!");
        isfinalloop = true;
        notifyListeners();
        showdialogtoast(context, "Please Give Serial Number..!!");

        // await  playsound("scan_serial_wrong");
        notifyListeners();
      } else if (qtys <= ScannedQty() || qtys < ScannedQty() + (TransferLoad1!.manageby!.toLowerCase() =='b'?int.parse(quantitycontroller.text):1)
        // qtys <= ScannedQty() || qtys < ScannedQty() + 1
        ) {
        // const snackBar = SnackBar(
        //   duration: Duration(seconds: 4),
        //   backgroundColor: Colors.red,
        //   content: Text(
        //     'Greater than Qty!!..',
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // );

        // ScaffoldMessenger.of(context).showSnackBar(snackBar);

        scanserialctrl1.clear();
        notifyListeners();
        scanedvalueee = '';

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
        if (DBdata.length > 0 && scanserialctrl1.text.isNotEmpty) {
          bool showlistadd = false;
        
                  int? dataindex = null;
          showlistadd = false;
          for (int i = 0; i < DBdata.length; i++) {
            if (DBdata[i].serialnum == scanserialctrl1.text) {
             
              dataindex=i;
              showlistadd = true;
              notifyListeners();
            }


            
          }
          if (showlistadd) {
            // scanserialctrl1.clear();
            
            // notifyListeners();
            // scanedvalueee = '';

            // FocusScope.of(context).unfocus();
            // // showtoastInw(
            // //   "Greater than Qty..!!",
            // // );
            // isfinalloop = true;
            // notifyListeners();
            // showdialogtoast(context, "Serial number already added..!!");


            if (TransferLoad1!.manageby!.toLowerCase() == 'b') {
                DBdata[dataindex!].scannedqty = DBdata[dataindex].scannedqty! +
                    int.parse(quantitycontroller.text);
                scanserialctrl1.clear();
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
                scanserialctrl1.clear();
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
            DBdata.add(wmstransInwtabSerialModel(
                branch: ConstantValues.branch,
                scannedqty: 1,
                itemCode: TransferLoad1!.ItemCode!,
                lineID: TransferLoad1!.linenum!,
                qty: TransferLoad1!.Quantity!,
                serialnum: scanserialctrl1.text,
                manageBy: TransferLoad1!.manageby,
                transNum: tn.toString(),
                transtype: "inward"));
            scanserialctrl1.clear();
            notifyListeners();
            scanedvalueee = '';
          }
        } else {
          // if (scanserialctrl1.text.isNotEmpty && scanserialctrl1.text != '') {
          //   DBdata.add(wmstransInwtabSerialModel(
          //       branch: ConstantValues.branch,
          //       scannedqty: 1,
          //       itemCode: TransferLoad1!.ItemCode!,
          //       lineID: TransferLoad1!.linenum!,
          //       qty: TransferLoad1!.Quantity!,
          //       manageBy:TransferLoad1!.manageby,
          //       serialnum: scanserialctrl1.text,
          //       transNum: tn.toString(),
          //       transtype: "inward"));
          //   scanserialctrl1.clear();
          //   notifyListeners();
          //   scanedvalueee = '';

          //   // final audio = AudioPlayer();
          //   // await audio.stop();
          //   // await audio.setAsset("Asset/scan_serial_correct.mp3");
          //   // audio
          //   //     .play(); // savelistinwardState().     playsound("scan_serial_correct");
          //   // notifyListeners();
          //   // mycontroller[1].clear();
          //   // serialscannedData = '';
          //   // mycontroller[2].clear();
          //   // mycontroller[3].clear();
          //   // mycontroller[2].text = '1';
          //   // notifyListeners();
          //   isfinalloop = false;
          //   notifyListeners();
          // }

            if (TransferLoad1!.manageby!.toLowerCase() == 'b') {
              if (scanserialctrl1.text.isNotEmpty && scanserialctrl1.text != '') {
                DBdata.add(wmstransInwtabSerialModel(
                    branch: ConstantValues.branch,
                    scannedqty: int.parse(quantitycontroller.text),
                    itemCode: TransferLoad1!.ItemCode!,
                    lineID: TransferLoad1!.linenum!,
                    qty: TransferLoad1!.Quantity!,
                    serialnum: scanserialctrl1.text,
                    manageBy: TransferLoad1!.manageby,
                    transNum: tn.toString(),
                    transtype: "inward"));
                scanserialctrl1.clear();
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
              if (scanserialctrl1.text.isNotEmpty && scanserialctrl1.text != '') {
                DBdata.add(wmstransInwtabSerialModel(
                    branch: ConstantValues.branch,
                    scannedqty: 1,
                    itemCode: TransferLoad1!.ItemCode!,
                    lineID: TransferLoad1!.linenum!,
                    qty: TransferLoad1!.Quantity!,
                    serialnum: scanserialctrl1.text,
                    manageBy: TransferLoad1!.manageby,
                    transNum:  tn.toString(),
                    transtype: "inward"));
                scanserialctrl1.clear();
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
          // final audio = AudioPlayer();
          // await audio.stop();
          // await audio.setAsset("Asset/scan_serial_correct.mp3");
          // audio
          //     .play(); // savelistinwardState().     playsound("scan_serial_correct");
          // notifyListeners();
          // scanserialctrl1.clear();
          // notifyListeners();
          //   scanedvalueee = '';
          //   // mycontroller[2].clear();
          //   // mycontroller[3].clear();
          //   // mycontroller[2].text = '1';
          //   // notifyListeners();
          //   isfinalloop = false;
          notifyListeners();
        }
      }
    } else {
      scanserialctrl1.clear();
      notifyListeners();
      showdialogtoast(context, "Invalid Serial number..");
      notifyListeners();
    }
  }

  deletedata(int index) {
    DBdata.removeAt(index);
    notifyListeners();
  }

  List<wmstransInwtabSerialModel> addtoDB = [];
  List<int> filtergetqty = [];
  List<int> getqty = [];
  List<wmstransInwtabSerialModel> getfromdb = [];
  List<wmstransInwtabSerialModel> dbdatcount = [];

  List<wmstransInwtabSerialModel> finaldoc = [];

  int? ScanTotal;
  GetAllDBqty() async {
    final Database db = (await DBHelper.getinstance())!;
    finaldoc = await Dboperation.getdataTransinw(
      db,
      tn.toString(),
    );
    if (finaldoc.isNotEmpty) {
      log("finaldoc::" + finaldoc.length.toString());
      for (int i = 0; i < finaldoc.length; i++) {
        String? qty2 = finaldoc[i].scannedqty!.toStringAsFixed(0);
        log("qty2::" + qty2.toString());
        log("ScanTotalbefore::" + qty2.toString());
        ScanTotal = ScanTotal! + int.parse(qty2);
        log("ScanTotal::" + ScanTotal.toString());
      }
    }

    return ScanTotal;
  }

// bool isloading =true;
// getdata()async{
//   getfromdb.clear();
//    isloading =true;
//   Database db=(await DBHelper.getinstance())!;
//   getfromdb=await Dboperation.getdata(db);
//    isloading =false;
//   log("getfromdb ::${getfromdb.length}");

// }

  int? indexx;

  savedbinw() async {
    final Database db = (await DBHelper.getinstance())!;
    int docEntry = int.parse(tn.toString());
    Dboperation.InwuidExists(tn.toString(), TransferLoad1!.ItemCode.toString(),
            TransferLoad1!.linenum.toString(), db)
        .then((value) async {
      log("valalalal :" + value.toString());
      if (value != null) {
        Dboperation.transferInwexistdelete(
            int.parse(tn!.toString()),
            TransferLoad1!.ItemCode.toString(),
            TransferLoad1!.linenum.toString(),
            db);
        Dboperation.TransferInwexistserialdelete(
            int.parse(tn!.toString()),
            TransferLoad1!.ItemCode.toString(),
            TransferLoad1!.linenum.toString(),
            db);
        // Dboperation.delete(docEntry, TransferLoad1!.ItemCode.toString(),
        //     TransferLoad1!.linenum.toString(), db);
        var values2;
        var values;
        if(DBdata.isNotEmpty){
 var val22 = wmstransInwtabitemModel(
            docentry: TransferLoad1!.DocEntry,
            fromWarehouse: ConstantValues.branch,
            itemCode: TransferLoad1!.ItemCode,
            lineID: TransferLoad1!.linenum,
            quantity: TransferLoad1!.Quantity,
            scannedqty: DBdata.length,
            manageby:TransferLoad1!.manageby ,
            toWarehouse: "",
            uTransNum: tn!.toString());
        values2 = val22;
        Dboperation.insertInwitemdata([values2], db);
        }
       
        for (int i1 = 0; i1 < DBdata.length; i1++) {
          print("data.length: ${DBdata.length}");
          print("i11111: $i1");

          var val = wmstransInwtabSerialModel(
              branch: ConstantValues.branch,
              scannedqty: DBdata[i1].scannedqty,
              itemCode: TransferLoad1!.ItemCode,
              manageBy: TransferLoad1!.manageby,
              lineID: TransferLoad1!.linenum,
              qty: TransferLoad1!.Quantity,
              serialnum: DBdata[i1].serialnum,
              transNum: tn!.toString(),
              transtype: "inward");
          values = val;
          Dboperation.insertInwserialdata(values, db).then((value) async {
            print("inserted!!..");
            Dboperation.InwuidExists(
                tn.toString(),
                TransferLoad1!.ItemCode.toString(),
                TransferLoad1!.linenum.toString(),
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
        filtergetqty.clear();
        TransferInward = filterTransferInward;
        await gettotal();
        await getsaveenable();
        ScanTotal = 0;
        finaldoc.clear();
        GetAllDBqty();
        notifyListeners();

        pageController.animateToPage(--pageChanged,
            duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
      } else {
        var values2;
        var values;
         if(DBdata.isNotEmpty){
 var val22 = wmstransInwtabitemModel(
            docentry: TransferLoad1!.DocEntry,
            fromWarehouse: ConstantValues.branch,
            itemCode: TransferLoad1!.ItemCode,
            lineID: TransferLoad1!.linenum,
            quantity: TransferLoad1!.Quantity,
            manageby:TransferLoad1!.manageby ,
            scannedqty: DBdata.length,
            toWarehouse: "",
            uTransNum: tn!.toString());
        values2 = val22;
        Dboperation.insertInwitemdata([values2], db);
         }
       
        for (int i1 = 0; i1 < DBdata.length; i1++) {
          print("data.length: ${DBdata.length}");
          print("i22222: $i1");

          var val = wmstransInwtabSerialModel(
              branch: ConstantValues.branch,
              scannedqty: DBdata[i1].scannedqty,
              itemCode: TransferLoad1!.ItemCode,
              lineID: TransferLoad1!.linenum,
              qty: TransferLoad1!.Quantity,
              manageBy:TransferLoad1!.manageby ,
              serialnum: DBdata[i1].serialnum,
              transNum: tn!.toString(),
              transtype: "inward");
          values = val;
          Dboperation.insertInwserialdata(values, db).then((value) async {
            print("inserted!!..");
            Dboperation.InwuidExists(
                tn.toString(),
                TransferLoad1!.ItemCode.toString(),
                TransferLoad1!.linenum.toString(),
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
        filtergetqty.clear();
        TransferInward = filterTransferInward;
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

  gettotal() async {
    getqty.clear();
    filtergetqty.clear();
    notifyListeners();
    log("inwItemList::" + TransferInward.toString());
    final Database db = (await DBHelper.getinstance())!;
    for (int i = 0; i < TransferInward.length; i++) {
      await Dboperation.getoverallcounttransInwa(db, tn.toString(),
              TransferInward[i].ItemCode.toString(), TransferInward[i].linenum)
          .then((value) {
        getqty.add(value);
        filtergetqty =getqty;
        notifyListeners();
        log("getqty::" + getqty.length.toString());
        // log("getqty[i]::" + getqty[i].toString());
      });
    }
    log("dbdatcount::" + dbdatcount.length.toString());
  }

  bool saveenablebutton = false;
  getsaveenable() async {
    int? aaa;
    await gettotal();
    bool issaveenable = false;
    issaveenable = false;
    if (filtergetqty.isNotEmpty) {
      aaa=0;
      for (int i = 0; i < TransferInward.length; i++) {
        if (TransferInward[i].Quantity == filtergetqty[i]) {
          aaa=aaa! +1;
          issaveenable = true;
          // notifyListeners();
        }
      }
    }

    if (issaveenable == true && aaa==TransferInward.length) {
      log("saveLLtrure");
      saveenablebutton = true;
    } else {
      saveenablebutton = false;
    }
  }

  // savebutton()async{
  //   addtoDB.add(Documents(
  //     itemname: itemname,
  //     docEntry: docEntry,
  //      itemCode: itemCode,
  //      lineNum: lineNum,
  //       numAtCard: numAtCard,
  //        serialNum: serialNum,

  //        quantity: quantity,
  //         expirydate: expirydate,
  //          ManageBy: ManageBy,
  //           MfgDate: MfgDate,
  //            Pack_Quantity: Pack_Quantity,
  //            TagText: TagText,
  //             Unit_Quantity: Unit_Quantity,
  //              WhsCode: WhsCode),
  //    );
  //    final add=(await DBHelper.getinstance())!;
  //   await Dboperation.insertdata(addtoDB, add);
  //  notifyListeners();

  // }
  methodfinalsave2222(wmstransInwtabitemModel values) {
    // binlinelist222.clear();
    bool finaladded = false;
    int? finalindex;
    int? subfinalindex;
    finalindex = null;
    finaladded = false;
    subfinalindex = null;
    finalsavelist.add(wmstransInwtabitemModel(
        docentry: values!.docentry,
        fromWarehouse: values.fromWarehouse,
        itemCode: values.itemCode,
        lineID: values.lineID,
        quantity: values.quantity,
        manageby: values.manageby,
        scannedqty: values.scannedqty,
        toWarehouse: values.toWarehouse,
        uTransNum: values.uTransNum));
  }

  List<wmstransInwtabitemModel> finalsavelist = [];
  List<wmstransInwtabSerialModel> finalseriallist = [];
  // List<Documents> inwItemList = [];
  // List<Addfinalsave> save = [];

  bool finallodaing = false;
  methodfinalsave333(wmstransInwtabSerialModel values) {
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
    finalseriallist.add(wmstransInwtabSerialModel(
        branch: values.branch,
        scannedqty: values.scannedqty,
        itemCode: values.itemCode,
        lineID: values.lineID,
        qty: values.qty,
        manageBy: values.manageBy,
        serialnum: values.serialnum,
        transNum: values.transNum,
        transtype: values.transtype));
  }

  List<posttransInwModel> itemfinallist = [];
  List<serialBatchNums> seriallist = [];
  checkserialfinal(wmstransInwtabitemModel finalitemlist) {
    for (int i = 0; i < finalseriallist.length; i++) {
      if (finalseriallist[i].transNum == finalitemlist.uTransNum &&
          finalseriallist[i].lineID == finalitemlist.lineID &&
          finalseriallist[i].itemCode == finalitemlist.itemCode) {
        seriallist.add(serialBatchNums(
            manufacturerSerialNumber: finalseriallist[i].serialnum,
            internalSerialNumber: finalseriallist[i].serialnum,
            qty: finalseriallist[i].scannedqty));
      }
    }
  }

  savefinal(BuildContext context) async {
    // binlinelist222.clear();
    // postBatchlist.clear();
    itemfinallist.clear();
    finalsavelist.clear();
    finalseriallist.clear();
    // addputaway.clear();
    final Database db = (await DBHelper.getinstance())!;
    finallodaing = true;
    notifyListeners();
    // await gettotal();
    for (int i = 0; i < TransferInward.length; i++) {
      if (TransferInward[i].Quantity == filtergetqty[i]) {
        await Dboperation.inwsaveAllDatafinal(
                tn.toString(),
                TransferInward[i].ItemCode.toString(),
                TransferInward[i].linenum.toString(),
                db)
            .then((value) {
          if (value != null) {
            for (int ik = 0; ik < value.length; ik++) {
              //  binlinelist222.clear();
              methodfinalsave2222(value[ik]);
            }
          }
          log("finalsavelist::" + finalsavelist.length.toString());
        });
      }
    }

    for (int i = 0; i < finalsavelist.length; i++) {
      await Dboperation.inwsaveAllserialDatafinal(
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
    for (int i = 0; i < finalsavelist.length; i++) {
      log("finalsavelist::" + finalsavelist[i].quantity.toString());
      seriallist = [];
      checkserialfinal(finalsavelist[i]);
      itemfinallist.add(posttransInwModel(
          fromWarehouseCode: ConstantValues.branch,
          itemCode: finalsavelist[i].itemCode,
          warehouseCode: ConstantValues.branch,
          qty: int.parse(finalsavelist[i].quantity!.toStringAsFixed(0)),
          serialbatch: seriallist,
          linenum: finalsavelist[i].lineID,
          manageBy: finalsavelist[i].manageby,
          docentry: finalsavelist[i].docentry));
    }
    await FinalSaveservices.getdata(
      itemfinallist,
      TransferInward[0].Category.toString(),
      TransferInward[0].Product.toString(),
      TransferInward[0].ItemName.toString(),
      tn.toString(),
      TransferInward[0].Brand.toString(),
    ).then((value) async {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        finallodaing = false;
        showdialogsave(context, "Assets/check.png", "Success",
            "Transfer Inward Saved Successfully");
 await Dboperation.Transferinwfinaldelete( int.parse(tn!),db);
 await Dboperation.TransferInwfinalserialdelete(int.parse(tn!),db);
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
//       if (value.stcode! >= 200 && value.stcode! <= 210) {
//         finallodaing = false;
// //         // postBatchlist = value.inwardsaveheader!.datadetail!;
// //         // for (int i = 0; i < postBatchlist.length; i++) {
// //         //   // if (postBatchlist[i].ManageBy!.toLowerCase() == 'b') {
// //         //   methodputaway(values, postBatchlist[i]);
// //         //   // }
// //         // }

// //         // if (addputaway.isNotEmpty) {
// //         //   await PutawaysaveApi.getData(addputaway).then((value) async {
// //         //     if (value.stcode! >= 200 && value.stcode! <= 210) {
// //         //       finallodaing = false;
// //         //       notifyListeners();
// //         //       // final audio = AudioPlayer();

// //         //       // audio.setAsset("Asset/next_click.mp3");
// //         //       // audio.play();
// //         //       // //  savelistinwardState().  playsound("next_click");
// //         //       // showdialogsave(context, "Asset/check.png", "Success",
// //         //       //     value.exception.toString());
// //         //       //  await DBoperation.putawaydeleteAll(db);
// //         //       notifyListeners();
// //         //     } else if (value.stcode! >= 400 && value.stcode! <= 410) {
// //         //       finallodaing = false;
// //         //       notifyListeners();
// //         //       final audio = AudioPlayer();
// //         //       audio.setAsset("Asset/Invalid_bin.mp3");
// //         //       audio.play();
// //         //       //  savelistinwardState().    playsound("Invalid_bin");
// //         //       showdialogsave(context, "Asset/cancel.png", "Failed",
// //         //           "${value.message}..${value.exception.toString()}");
// //         //       notifyListeners();
// //         //     } else {
// //         //       if (value.exception!.contains("Network is unreachable")) {
// //         //         finallodaing = false;
// //         //         final audio = AudioPlayer();
// //         //         audio.setAsset("Asset/Invalid_bin.mp3");
// //         //         audio.play();
// //         //         // savelistinwardState(). playsound("Invalid_bin");
// //         //         showdialogsave(context, "Asset/cancel.png", "Failed",
// //         //             "Network Issue..Try again Later..!!");
// //         //         // inwexception2 =
// //         //         //     "'${value.stcode!}..!!Network Issue..\nTry again Later..!!";
// //         //         notifyListeners();
// //         //       } else {
// //         //         finallodaing = false;
// //         //         final audio = AudioPlayer();
// //         //         audio.setAsset("Asset/Invalid_bin.mp3");
// //         //         audio.play();
// //         //         // savelistinwardState().  playsound("Invalid_bin");
// //         //         showdialogsave(context, "Asset/cancel.png", "Failed",
// //         //             "${value.stcode}..${value.exception}..!!");

// //         //         // inwexception2 = "${value.stcode}..${value.exception}..!!";
// //         //         notifyListeners();
// //         //       }
// //         //     }
// //         //   });
// //         // }
// //         notifyListeners();
// //         // final audio = AudioPlayer();

// //         // audio.setAsset("Asset/next_click.mp3");
// //         // audio.play();
// //         //  savelistinwardState().  playsound("next_click");
// //         showdialogsave(
// //             context, "Asset/check.png", "Success", value.exception.toString());
// // //               await DBoperation.saveAllDataBin("${inwItemList[index ?? 0].DocEntry}", db).then((value){
// // // if(value != null && value.isNotEmpty){
// // //   log("binnnn");
// // // }
// // //               });
// //         notifyListeners();
//       } else if (value.stcode! >= 400 && value.stcode! <= 410) {
//         finallodaing = false;
//         notifyListeners();
//         // final audio = AudioPlayer();
//         // audio.setAsset("Asset/Invalid_bin.mp3");
//         // audio.play();
//         //  savelistinwardState().    playsound("Invalid_bin");
//         showdialogsave(context, "Asset/cancel.png", "Failed",
//             "${value.message}..${value.exception.toString()}");
//         notifyListeners();
//       } else {
//         if (value.exception!.contains("Network is unreachable")) {
//           finallodaing = false;
//           // final audio = AudioPlayer();
//           // audio.setAsset("Asset/Invalid_bin.mp3");
//           // audio.play();
//           // savelistinwardState(). playsound("Invalid_bin");
//           showdialogsave(context, "Asset/cancel.png", "Failed",
//               "Network Issue..Try again Later..!!");
//           // inwexception2 =
//           //     "'${value.stcode!}..!!Network Issue..\nTry again Later..!!";
//           notifyListeners();
//         } else {
//           finallodaing = false;
//           // final audio = AudioPlayer();
//           // audio.setAsset("Asset/Invalid_bin.mp3");
//           // audio.play();
//           // savelistinwardState().  playsound("Invalid_bin");
//           showdialogsave(context, "Asset/cancel.png", "Failed",
//               "${value.stcode}..${value.exception}..!!");

//           // inwexception2 = "${value.stcode}..${value.exception}..!!";
//           notifyListeners();
//         }
//       }
    });
    // });
  }

  showdialogsave(
      BuildContext context, String? image, String title, String body) {
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);
          return StatefulBuilder(builder: (context, setst) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: Screens.padingHeight(context) * 0.13,
                      width: Screens.width(context),
                      decoration: BoxDecoration(
                          // color:Colors.green,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            "$image", //Asset/check.png
                            height: Screens.padingHeight(context) * 0.1,
                            width: Screens.width(context) * 0.2,
                          ),
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
                          Container(
                            child: Text(
                              "$title",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.01,
                          ),
                          Container(
                            child: Text(
                              "$body",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.01,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: secondary),
                              onPressed: () {
                                setst(() {
                                  if (title.contains("Success")) {
                                    Get.offAllNamed(
                                        ConstantRoutes.transferinward);
                                  } else {
                                    Navigator.pop(context);
                                  }
                                });
                              },
                              child: Text("ok"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }).then((value) {
           if (title.contains("Success")){
                                 Get.offAllNamed(
                                        ConstantRoutes.transferinward);

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

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirdcolor),
                                onPressed: () {
                                  setst(() {
                                    isfinalloop = false;

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
}
