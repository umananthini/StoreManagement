



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:warehousemanagement/DBHELPER/DBOperation.dart';
import 'package:warehousemanagement/DBHELPER/dbhelper.dart';
import 'package:warehousemanagement/DBMODEL/InWardDBModel/inwarddbmodel.dart';

class DetailPurchaseInwardctrl extends ChangeNotifier{
  TextEditingController scanserialctrl=TextEditingController();
  TextEditingController qtyctrl=TextEditingController();
  init(){
  log("DetailPurchaseInwardctrl Created");
  }
//   List<Documents> addtodb=[];
// Addbutton()async{
// addtodb.add(Documents(
//   itemname: itemname,
//    binCode: binCode, 
//    docEntry: docEntry,
//     itemCode: scanserialctrl.text,
//      lineNum: , 
//      numAtCard: numAtCard,
//       serialNum: serialNum,
//        quantity: quantity,
//         expirydate: expirydate,
//          ManageBy: ManageBy, 
//          MfgDate: MfgDate, 
//          Pack_Quantity: Pack_Quantity, 
//          TagText: TagText, 
//          Unit_Quantity: Unit_Quantity,
//           WhsCode: WhsCode));
//     final add=(await DBHelper.getInstance())!;
//     await Dboperation.insertdata(addtodb, add);
//   //  await getdata();
//    notifyListeners();

// }
}