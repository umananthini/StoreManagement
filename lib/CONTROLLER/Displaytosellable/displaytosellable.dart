import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/MODEL/Display2SellableModel/GetProductSerialModel.dart';
import 'package:warehousemanagement/PAGES/DisplaytoSellable/displaytosllable2.dart';
import 'package:warehousemanagement/SERVICES/Display2sellableApi/ProductserialSearchApi.dart';
import 'package:warehousemanagement/SERVICES/Display2sellableApi/finaldisplayApi.dart';

class DisplayToSellablectrl extends ChangeNotifier {
  TextEditingController displayproductserial = TextEditingController();
  TextEditingController diaplayboxsereial = TextEditingController();
  bool isshowtextfield1 = false;
  String? diplayScanvalue1;
    String? test;
  String? diplayScanvalue2;
  bool? isloadingg = false;

  init() {
    log("DisptoSellableController created");
    
    notifyListeners();
  }

  hidealldetail() {
    if (displayproductserial.text.isNotEmpty) {
      isshowtextfield1 = false;
      notifyListeners();
    } else {
      isshowtextfield1 = true;
      notifyListeners();
    }
  }
  showdialogsave(
      BuildContext context, String? image, String title, ) {
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
                            backgroundColor: thirdcolor
                          ),
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

  bool finalloading =false;
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
finalvalidate(BuildContext context)async{
  if(formkey.currentState!.validate()){
    if(productseriallist[0].DistNumber ==diaplayboxsereial.text){
finalloading =true;
  notifyListeners();
  await Display2sellableFinalApi.getData(productseriallist[0].ItemCode, diaplayboxsereial.text, 1, productseriallist[0].BoxNo, displayproductserial.text).then((value) {
     if (value.stcode! >= 200 && value.stcode! <= 210) {
             finalloading=false;
        notifyListeners();
      
             finalloading=false;

 showdialogsave(context, "Assets/check.png", "Success",
            );
       
          } else if (value.stcode! >= 400 && value.stcode! <= 410) {
             finalloading=false;
        notifyListeners();
            showdialogsave(context, "Assets/cancel.png", "Failed",
               );
          } else {
             finalloading=false;
        notifyListeners();
            showdialogsave(context, "Assets/cancel.png", "Failed",
               );
          }

  });
    }else{
        finalloading=false;
        diaplayboxsereial.clear();
        notifyListeners();
            showdialogsave(context, "Assets/cancel.png",
                "Invalid Box Serial Number..!!");
                 notifyListeners();
    }
  
  }

}
  bool serialcheck = false;
  String? boxscanvalue;
  List<GetProductSerial> productseriallist = [];
  afterboxscan(String? codee, BuildContext context) {
    diaplayboxsereial.text = codee.toString();
    if (productseriallist[0].DistNumber!.toLowerCase() ==
        diaplayboxsereial.text.toLowerCase()) {
      FocusScope.of(context).unfocus();
      notifyListeners();
    } else {
      diaplayboxsereial.clear();
      showdialogtoast(context, "Box Serial Not Matched..!!");
      notifyListeners();
    }
  }

  afterserialScanned(String? codee, BuildContext context) async {
    log("codee${codee}");
    productseriallist.clear();
    isloadingg = true;
    diaplayboxsereial.clear();
    notifyListeners();
    displayproductserial.text = codee.toString();
    if (codee != null && codee != 'null') {
      await GetProductSerialApi.getData(displayproductserial.text)
          .then((value) {
        if (value.rescode! >= 200 && value.rescode! <= 210) {
          if(value.data !=null && value.data!.isNotEmpty){
             productseriallist = value.data!;
          isloadingg = false;
          notifyListeners();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DisplaytoSellable2screen()));
          notifyListeners();
          }else if(value.data ==null || value.data!.isEmpty){
            isloadingg = false;
          displayproductserial.clear();
          showdialogtoast(context,"No data..!!"); 
          }
         
        } else if (value.rescode! >= 400 && value.rescode! <= 410) {
          isloadingg = false;
          displayproductserial.clear();
          showdialogtoast(context, "${value.execption}..!!");
          notifyListeners();
        } else {
          isloadingg = false;
          displayproductserial.clear();
          showdialogtoast(context, "${value.execption}..!!");
          notifyListeners();
        }
      });
      notifyListeners();
    }else{
        isloadingg = false;
          displayproductserial.clear();
          showdialogtoast(context, "Scan code is Empty..!!");
          notifyListeners();
    }
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
                                backgroundColor: thirdcolor
                              ),
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
}
