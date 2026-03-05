import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONTROLLER/Displaytosellable/displaytosellable.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/TransferOutwardController/getoutwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/SellabletoDisplayController/SellabletoDisController.dart';
import 'package:warehousemanagement/CONTROLLER/TransferInwardController/transferinwardctrl.dart';

class QRscanner extends StatefulWidget {
  const QRscanner({super.key});

  @override
  State<QRscanner> createState() => QRscannerState();
}

class QRscannerState extends State<QRscanner> {
  static bool inwardlistscan = false;
  static bool detailinwardscan = false;
  static bool detailsoutwardscan = false;
  static bool purchasedetailsscan1 = false;
  static bool purchasedetailsscan2 = false;

  static bool searchpurchasedetailsscan = false;

  static bool sellableBoxdetailsscan = false;
  static bool sellablerpoductdetailsscan = false;
  static bool displayBoxdetailsscan = false;
    static bool dis2sellbox = false;
      static bool transferinw = false;




  MobileScannerController cameraController =
      MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
  List<Barcode> barcodes = [];
  String? scannedvalue;
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      barcodes.clear();
    });
    log("barcodes:::" + barcodes.toString());
  }

  DateTime? currentBackPressTime;
  Future<bool> onbackpress() {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      setState(() {
        if (inwardlistscan == true) {
          setState(() {
            inwardlistscan = false;
            log("hiiii");
          });
        } else if (detailinwardscan == true) {
          detailinwardscan = false;
        }
        else if (searchpurchasedetailsscan == true) {
          searchpurchasedetailsscan = false;
        }
          else if (transferinw == true) {
          transferinw = false;
        
        } else if (detailsoutwardscan == true) {
          detailsoutwardscan = false;
        } else if (purchasedetailsscan1 == true) {
          purchasedetailsscan1 = false;
        }else if (purchasedetailsscan2 == true) {
          purchasedetailsscan2 = false;
        
        }else if (sellableBoxdetailsscan == true) {
          sellableBoxdetailsscan = false;
        }else if (displayBoxdetailsscan == true) {
          displayBoxdetailsscan = false;
        }else if (sellablerpoductdetailsscan == true) {
          sellablerpoductdetailsscan = false;
        }
        else if (dis2sellbox == true) {
          dis2sellbox = false;
        }
        
      });

      Get.back();
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onbackpress,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: secondary,
              title: const Text("Mobile Scanner"),
            ),
            body: MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  log("barcodes length::${barcodes.length}");

                  barcodes = capture.barcodes;
                  print(capture.barcodes.first.rawValue);
                  for (var barcode in barcodes) {
                    //  showtoastInw("Sucessfull ");
                    if (detailsoutwardscan == true) {
                      context
                          .read<TransferOutwardctrl>()
                          .scancontroller
                          .clear();

                      Navigator.pop(context);
                      log("barcodes length::${barcodes.length}");
                      context.read<TransferOutwardctrl>().scanedvalueee =
                          barcode.rawValue ?? '';
                          detailsoutwardscan=false;
                    } else if (transferinw == true) {
                      Navigator.pop(context);
                      log("${barcode.rawValue}::barcodes length::${barcodes.length}");
                      context.read<TransferInwardctrl>().scanedvalueee =
                          barcode.rawValue ?? '';
                          transferinw=false;
                    } else if (purchasedetailsscan1 == true) {
                      Navigator.pop(context);
                      log("barcodes length::${barcodes.length}");
                      context.read<PurchaseInwardCtrl>().scanedvalueee1 =
                          barcode.rawValue ?? '';
                          purchasedetailsscan1=false;
                    }else if (purchasedetailsscan2 == true) {
                      Navigator.pop(context);
                      log("barcodes length::${barcodes.length}");
                      context.read<PurchaseInwardCtrl>().scanedvalueee2 =
                          barcode.rawValue ?? '';
                          purchasedetailsscan2=false;
                    }
                    
                    else if (sellableBoxdetailsscan == true) {
                      Navigator.pop(context);
                      log("barcodes length::${barcodes.length}");
                      context.read<SellableoDispController>().Scanvalue1 =
                          barcode.rawValue ?? '';
                          sellableBoxdetailsscan=false;
                    }else if (displayBoxdetailsscan == true) {
                      Navigator.pop(context);
                    
                      log("barcodes length::${barcodes}");
                      context.read<DisplayToSellablectrl>().diplayScanvalue1 =
                          barcode.rawValue ?? '';
                          displayBoxdetailsscan=false;
                    }

                    
                    else if (searchpurchasedetailsscan == true) {
                      Navigator.pop(context);
                    
                      log("barcodes length::${barcodes.length}");
                      context.read<PurchaseInwardCtrl>().searchpurchase =
                          barcode.rawValue ?? '';
                          searchpurchasedetailsscan=false;
                    } 
                    
                    else if (sellablerpoductdetailsscan == true) {
                      Navigator.pop(context);
                    
                      log("barcodes length::${barcodes.length}");
                      context.read<SellableoDispController>().Scanvalue2 =
                          barcode.rawValue ?? '';
                          sellablerpoductdetailsscan=false;
                    }
                    
                    else if (dis2sellbox == true) {
                      Navigator.pop(context);
                    
                      log("barcodes length::${barcodes.length}");
                      context.read<DisplayToSellablectrl>().boxscanvalue =
                          barcode.rawValue ?? '';
                          dis2sellbox=false;
                    }

                    // if (inwardlistscan == true) {
                    //   // context.read<inwardcontroller>().scannedData='';
                    //   context.read<PurchaseInwardCtrl>().inwardscanData =
                    //       barcode.rawValue ?? '';
                    //   Navigator.pop(context);

                    //   inwardlistscan = false;
                    // } else if (detailinwardscan == true) {
                    //   context.read<PurchaseInwardCtrl>().detailinwardscanData =
                    //       barcode.rawValue ?? '';
                    //   Navigator.pop(context);
                    //   detailinwardscan = false;
                    //   log("barcodes length::${barcodes.length}");
                    // }
                  }
                })));
  }

  showtoastInw(String message) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 0,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
