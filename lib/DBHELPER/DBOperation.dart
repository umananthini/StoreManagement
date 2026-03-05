import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:warehousemanagement/DBMODEL/InWardDBModel/inwarddbmodel.dart';
import 'package:warehousemanagement/DBMODEL/OutwardModel/TransOutwardDBModel.dart';
import 'package:warehousemanagement/DBMODEL/TransferInwDBModel/TransferInwDBModel.dart';
import 'package:warehousemanagement/DBMODEL/purchaseInwDBModel/PurchaseInwDBModel.dart';

class Dboperation {
  static Future<List<wmstranspurchaseSerialModel>>
      purchaseinwsaveAllserialDatafinal(
          String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstranspurchaseSerial WHERE Docentry = "$docEntry" AND ItemCode ="$itemCode" AND LineNum = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstranspurchaseSerialModel(
        scannedqty: int.parse(result[i]['Scannedqty'].toString()) , 
        docentry:int.parse(result[i]['Docentry'].toString()) , 
        itemCode: result[i]['ItemCode'].toString(), 
        itemDescription: result[i]['ItemDescription'].toString(), 
        lineNum: int.parse(result[i]['LineNum'].toString()) , 
        price: double.parse(result[i]['Price'].toString()) , 
        quantity:int.parse(result[i]['Quantity'].toString()) , 
        manufacturerSerialNumber: result[i]['ManufacturerSerialNumber'].toString(), 
        internalSerialNumber: result[i]['InternalSerialNumber'].toString(), 
        notes: result[i]['Notes'].toString(),
         manageby: result[i]['ManageBy'].toString()
        );
    });
  }
  static Future<List<wmstranspurchaseitemModel>> purchaseinwsaveAllDatafinal(
      String docEntry, String itemCode, String lineNO, Database db) async {
   
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstranspurchaseitemtable WHERE Docentry = "$docEntry" AND ItemCode ="$itemCode" AND LineNum = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstranspurchaseitemModel(
        scannedqty:int.parse(result[i]['Scannedqty'].toString()) , 
        
        baseEntry:int.parse(result[i]['BaseEntry'].toString()) , 
        docentry:int.parse(result[i]['Docentry'].toString()) , 
        baseLine:int.parse(result[i]['BaseLine'].toString()) , 
        baseType: result[i]['BaseType'].toString(), 
        itemCode: result[i]['ItemCode'].toString(), 
        itemDescription: result[i]['ItemDescription'].toString(), 
        lineNum: int.parse(result[i]['LineNum'].toString()) , 
        manageBy: result[i]['ManageBy'].toString(), 
        price:double.parse(result[i]['Price'].toString()) , 
        quantity: int.parse(result[i]['Quantity'].toString()) , 
        salesPersonCode:int.parse(result[i]['SalesPersonCode'].toString()) , 
        taxCode: result[i]['TaxCode'].toString(), 
        warehouseCode: result[i]['WarehouseCode'].toString()
        );
    });
  }
  static Future<int> purchaseinwgetoverallcount(
      Database db, String? docentry, String? itemcode, int? linenum) async {
    log("docentry::${itemcode}" + docentry.toString());
    // var result22 = await db.rawQuery(
    //     "select * from $wmstranspurchaseitemtable ");
    // log("result22result22::" + result22.toString());
    var result = await db.rawQuery(
        "select SUM(Scannedqty) AS TotalQuantity from $wmstranspurchaseitemtable where Docentry='$docentry' AND ItemCode='$itemcode' AND LineNum='$linenum' group by Docentry,ItemCode");
    log("resultrrrr::" + result.toString());
    if (result.isNotEmpty) {
      return result.first['TotalQuantity'] as int? ?? 0;
    } else {
      return 0;
    }
  }
  static Future<void> purchaseinwitemdeletefinal(
      int docEntry, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstranspurchaseitemtable WHERE Docentry='$docEntry'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> purchaseinwserialdeletefinal(
      int docEntry, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstranspurchaseSerialtable WHERE Docentry='$docEntry'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> purchaseinwitemdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstranspurchaseitemtable WHERE Docentry='$docEntry' AND ItemCode ='$itemCode' AND LineNum = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> purchaseinwserialdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstranspurchaseSerialtable WHERE Docentry='$docEntry' AND ItemCode ='$itemCode' AND LineNum = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<List<wmstranspurchaseSerialModel>> getdatapurchaseinw(
    Database db,
    String? docentry,
  ) async {
    final List<Map<String, Object?>> result = await db.rawQuery('''
 SELECT * From wmstranspurchaseSerial where Docentry='$docentry'
''');
    return List.generate(result.length, (i) {
      return wmstranspurchaseSerialModel(
        
        scannedqty:int.parse(result[i]['Scannedqty'].toString()) , 
        docentry:int.parse(result[i]['Docentry'].toString())  , 
        itemCode: result[i]['ItemCode'].toString(), 
        itemDescription: result[i]['ItemDescription'].toString(), 
        lineNum:int.parse(result[i]['LineNum'].toString()) , 
        price: double.parse(result[i]['Price'].toString()) , 
        quantity: int.parse(result[i]['Quantity'].toString()) , 
        manufacturerSerialNumber: result[i]['ManufacturerSerialNumber'].toString(), 
        internalSerialNumber: result[i]['InternalSerialNumber'].toString(), 
        notes: result[i]['Notes'].toString(),
        manageby: result[i]['ManageBy'].toString()
        );
    });
  }
   
   static Future<int?> purchaseinwitemuidExists(
      String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    log("wwww::::${docEntry}::${itemCode}::${lineNO}");
    var result = await db.rawQuery(
      "SELECT * FROM $wmstranspurchaseitemtable WHERE Docentry = '$docEntry' AND ItemCode ='$itemCode' AND LineNum = '$lineNO'",
    );
    print("result123123: present $result");
    int? exists = Sqflite.firstIntValue(result);
    //    print("data: present $exists");
    return exists; //its retur 1 if its present
  }

  static Future<int?> purchaseinwserialExists(
      String docEntry, String serial, Database db) async {
    //  final Database db = await createDB();
    var result = await db.rawQuery(
      "SELECT count(*) cnt FROM wmstranspurchaseSerial WHERE Docentry = '$docEntry' AND ManufacturerSerialNumber ='$serial'",
    );
    print("alredy serial: $result");
    int? exists = Sqflite.firstIntValue(result);
    print("alredy serial present: $exists");
    return exists; //its retur 1 if its present
  }

  static Future insertpurchaseinwitemdata(
      List<wmstranspurchaseitemModel> values, Database db) async {
    var data = values.map((e) => e.tomap()).toList();
    var batch = db.batch();
    data.forEach((element) async {
      batch.insert(wmstranspurchaseitemtable, element);
    });
    log("inserted");
    await batch.commit();
  }

  static Future insertpurchaseinwserialdata(
      wmstranspurchaseSerialModel values, Database db) async {
    final id = await db.insert(wmstranspurchaseSerialtable, values.toMap());
    // var data = values.map((e) => e.toMap()).toList();
    // var batch = db.batch();
    // data.forEach((element) async {
    //   batch.insert(wmstransoutwardSerialtable, element);
    // });
    log("inserted");
    // await batch.commit();
  }

  static Future insertInwitemdata(
      List<wmstransInwtabitemModel> values, Database db) async {
    var data = values.map((e) => e.tomap()).toList();
    var batch = db.batch();
    data.forEach((element) async {
      batch.insert(wmstransinwitemtable, element);
    });
    log("inserted");
    await batch.commit();
  }

  static Future insertInwserialdata(
      wmstransInwtabSerialModel values, Database db) async {
    final id = await db.insert(wmstransInwSerialtable, values.toMap());
    // var data = values.map((e) => e.toMap()).toList();
    // var batch = db.batch();
    // data.forEach((element) async {
    //   batch.insert(wmstransoutwardSerialtable, element);
    // });
    log("inserted");
    // await batch.commit();
  }

  static Future insertoutitemdata(
      List<wmstransoutwardtabitemModel> values, Database db) async {
    var data = values.map((e) => e.tomap()).toList();
    var batch = db.batch();
    data.forEach((element) async {
      batch.insert(wmstransoutwarditemtable, element);
    });
    log("inserted");
    await batch.commit();
  }

  static Future insertoutserialdata(
      wmstransoutwardtabSerialModel values, Database db) async {
    final id = await db.insert(wmstransoutwardSerialtable, values.toMap());
    // var data = values.map((e) => e.toMap()).toList();
    // var batch = db.batch();
    // data.forEach((element) async {
    //   batch.insert(wmstransoutwardSerialtable, element);
    // });
    log("inserted");
    // await batch.commit();
  }

  // static Future insertdata(List<Documents> values, Database db) async {
  //   var data = values.map((e) => e.toMap()).toList();
  //   var batch = db.batch();
  //   data.forEach((element) async {
  //     batch.insert(tablename, element);
  //   });
  //   log("inserted");
  //   await batch.commit();
  // }
 static Future<List<wmstranspurchaseSerialModel>> purchasegetBinAndSerailNo(
      String docEntry, String itemCode, int? linenum, Database db) async {
    log("${docEntry}::${itemCode}::${linenum}");
    //  final Database db = await createDB();
    
    final List<Map<String, Object?>> result = await db.rawQuery(
      "SELECT * FROM wmstranspurchaseSerial WHERE Docentry = '$docEntry' AND ItemCode ='$itemCode' AND LineNum ='$linenum'",
    );
    print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstranspurchaseSerialModel(
        scannedqty:int.parse(result[i]['Scannedqty'].toString()) , 
        docentry:int.parse(result[i]['Docentry'].toString()) , 
        itemCode: result[i]['ItemCode'].toString(), 
        itemDescription: result[i]['ItemDescription'].toString(), 
        lineNum:int.parse( result[i]['LineNum'].toString()), 
        price: double.parse(result[i]['Price'].toString()) , 
        quantity:int.parse(result[i]['Quantity'].toString()) , 
        manufacturerSerialNumber: result[i]['ManufacturerSerialNumber'].toString(), 
        internalSerialNumber: result[i]['InternalSerialNumber'].toString(),  
        notes: result[i]['Notes'].toString(),
        manageby: result[i]['ManageBy'].toString()
        );
    });
  }
  static Future<List<wmstransInwtabSerialModel>> InwgetBinAndSerailNo(
      String docEntry, String itemCode, int? linenum, Database db) async {
    log("${docEntry}::${itemCode}::${linenum}");
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result2 = await db.rawQuery(
      "SELECT * FROM wmstransoutwardSerial ",
    );
    log("sdadad::" + result2.toString());
    final List<Map<String, Object?>> result = await db.rawQuery(
      "SELECT * FROM wmstransInwSerial WHERE TransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID ='$linenum'",
    );
    print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstransInwtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
          manageBy: result[i]["ManageBy"].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }
  static Future<List<wmstransoutwardtabSerialModel>> outwardgetBinAndSerailNo(
      String docEntry, String itemCode, int? linenum, Database db) async {
    log("${docEntry}::${itemCode}::${linenum}");
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result2 = await db.rawQuery(
      "SELECT * FROM wmstransoutwardSerial ",
    );
    log("sdadad::" + result2.toString());
    final List<Map<String, Object?>> result = await db.rawQuery(
      "SELECT * FROM wmstransoutwardSerial WHERE TransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID ='$linenum'",
    );
    print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstransoutwardtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
          manageby: result[i]['ManageBy'].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }

  // static Future<List<Documents>> getBinAndSerailNo(
  //     String docEntry, String itemCode, int? linenum, Database db) async {
  //   //  final Database db = await createDB();
  //   final List<Map<String, Object?>> result2 =
  //       await db.rawQuery("SELECT * FROM wmsinward ");
  //   final List<Map<String, Object?>> result = await db.rawQuery(
  //     "SELECT * FROM wmsinward WHERE DocEntry = '$docEntry' AND ItemCode ='$itemCode' AND LineNum ='$linenum'",
  //   );
  //   print("result: $result2");
  //   // print("result length : present ${result.length}");

  //   return List.generate(result.length, (i) {
  //     return Documents(
  //       Brand: result[i]['brand'].toString(),
  //       Product: result[i]['product'].toString(),
  //       Category: result[i]['category'].toString(),
  //       itemdocentry: int.parse(result[i]['itemDocEntry'].toString()),
  //       itemname: result[i]['ItemName'].toString(),
  //       ManageBy: result[i]['ManageBy'].toString(),
  //       MfgDate: result[i]['MfgDate'].toString(),
  //       Pack_Quantity: double.parse(result[i]['Pack_Quantity'].toString()),
  //       Unit_Quantity: double.parse(result[i]['Unit_Quantity'].toString()),
  //       TagText: result[i]['TagText'].toString(),
  //       WhsCode: result[i]['WhsCode'].toString(),
  //       docEntry: int.parse(result[i]['DocEntry'].toString()),
  //       itemCode: result[i]['ItemCode'].toString(),
  //       lineNum: int.parse(result[i]['LineNum'].toString()),
  //       numAtCard: result[i]['NumAtCard'].toString(),
  //       serialNum: result[i]['SerialNum'].toString(),
  //       quantity: double.parse(result[i]['Quantity'].toString()),
  //       expirydate: result[i]['Expirydate'].toString(),
  //     );
  //   });
  // }

  // static Future<int?> serialExists(
  //     String docEntry, String serial, Database db) async {
  //   //  final Database db = await createDB();
  //   var result = await db.rawQuery(
  //     "SELECT count(*) cnt FROM wmsinward WHERE DocEntry = '$docEntry' AND SerialNum ='$serial'",
  //   );
  //   print("alredy serial: $result");
  //   int? exists = Sqflite.firstIntValue(result);
  //   print("alredy serial present: $exists");
  //   return exists; //its retur 1 if its present
  // }
    static Future<int?> InwuidExists(
      String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    var result = await db.rawQuery(
      "SELECT * FROM wmstransInwitem WHERE UTransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    print("result123123: present $result");
    int? exists = Sqflite.firstIntValue(result);
    //    print("data: present $exists");
    return exists; //its retur 1 if its present
  }

  static Future<int?> outwarduidExists(
      String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    var result = await db.rawQuery(
      "SELECT * FROM wmstransoutwarditem WHERE UTransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    print("result123123: present $result");
    int? exists = Sqflite.firstIntValue(result);
    //    print("data: present $exists");
    return exists; //its retur 1 if its present
  }
static Future<void> transferInwexistdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransinwitemtable WHERE UTransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> Transferinwfinaldelete(
      int docEntry,  Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransinwitemtable WHERE UTransNum = '$docEntry' ",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> TransferInwfinalserialdelete(
      int docEntry,  Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransInwSerialtable WHERE TransNum = '$docEntry' ",
    );
    // print("delete id: "+id.toString());
  }
   static Future<void> TransferInwexistserialdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransInwSerialtable WHERE TransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> outitemdeletebytransnum(
      String docEntry,  Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransoutwarditemtable WHERE UTransNum = '$docEntry' ",
    );
    // print("delete id: "+id.toString());
  }
    static Future<void> outserialdeletebytransnum(
      String docEntry, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransoutwardSerialtable WHERE TransNum = '$docEntry' ",
    );
    // print("delete id: "+id.toString());
  }
  static Future<void> outexistdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransoutwarditemtable WHERE UTransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }

  static Future<void> outexistserialdelete(
      int docEntry, String itemCode, String lineNO, Database db) async {
    // final Database db = await createDB();
    var id = await db.rawQuery(
      "DELETE FROM $wmstransoutwardSerialtable WHERE TransNum = '$docEntry' AND ItemCode ='$itemCode' AND LineID = '$lineNO'",
    );
    // print("delete id: "+id.toString());
  }

  // static Future<int?> uidExists(
  //     String docEntry, String itemCode, String lineNO, Database db) async {
  //   //  final Database db = await createDB();
  //   var result = await db.rawQuery(
  //     "SELECT * FROM $tablename WHERE DocEntry = '$docEntry' AND ItemCode ='$itemCode' AND LineNum = '$lineNO'",
  //   );
  //   print("result123123: present $result");
  //   int? exists = Sqflite.firstIntValue(result);
  //   //    print("data: present $exists");
  //   return exists; //its retur 1 if its present
  // }

  // static Future<void> delete(
  //     int docEntry, String itemCode, String lineNO, Database db) async {
  //   // final Database db = await createDB();
  //   var id = await db.rawQuery(
  //     "DELETE FROM $tablename WHERE DocEntry='$docEntry' AND ItemCode ='$itemCode' AND LineNum = '$lineNO'",
  //   );
  //   // print("delete id: "+id.toString());
  // }

  // static Future insert(Documents values, Database db) async {
  //   // final Database db = await createDB();
  //   final id = await db.insert(tablename, values.toMap());
  //   print("result: $id");
  // }
static Future<int> getoverallcounttransInwa(
      Database db, String? docentry, String? itemcode, int? linenum) async {
    log("docentry::" + docentry.toString());
    var result2 =await db.rawQuery(
        "select * from $wmstransInwSerialtable");
        log("result2::"+result2.toString());
    var result = await db.rawQuery(
        "select SUM(Scannedqty) AS TotalQuantity from $wmstransInwSerialtable where TransNum='$docentry' AND ItemCode='$itemcode' AND LineID='$linenum' group by TransNum,ItemCode");
    log("result::" + result.toString());
    if (result.isNotEmpty) {
      return result.first['TotalQuantity'] as int? ?? 0;
    } else {
      return 0;
    }
  }
  static Future<int> getoverallcountoutward(
      Database db, String? docentry, String? itemcode, int? linenum) async {
    log("docentry::" + docentry.toString());
    var result = await db.rawQuery(
        "select SUM(Scannedqty) AS TotalQuantity from $wmstransoutwardSerialtable where TransNum='$docentry' AND ItemCode='$itemcode' AND LineID='$linenum' group by TransNum,ItemCode");
    log("result::" + result.toString());
    if (result.isNotEmpty) {
      return result.first['TotalQuantity'] as int? ?? 0;
    } else {
      return 0;
    }
  }

  // static Future<int> getoverallcount(
  //     Database db, String? docentry, String? itemcode, int? linenum) async {
  //   log("docentry::" + docentry.toString());
  //   var result = await db.rawQuery(
  //       "select SUM(Quantity) AS TotalQuantity from $tablename where DocEntry='$docentry' AND ItemCode='$itemcode' AND LineNum='$linenum' group by Docentry,ItemCode");
  //   log("result::" + result.toString());
  //   if (result.isNotEmpty) {
  //     return result.first['TotalQuantity'] as int? ?? 0;
  //   } else {
  //     return 0;
  //   }
  // }
static Future<List<wmstransInwtabSerialModel>> getdataTransinw(
    Database db,
    String? docentry,
  ) async {
    final List<Map<String, Object?>> result = await db.rawQuery('''
 SELECT * From wmstransInwSerial where TransNum='$docentry'
''');
    return List.generate(result.length, (i) {
      return wmstransInwtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
          manageBy: result[i]["ManageBy"].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }
  static Future<List<wmstransoutwardtabSerialModel>> getdataoutward(
    Database db,
    String? docentry,
  ) async {
    final List<Map<String, Object?>> result = await db.rawQuery('''
 SELECT * From wmstransoutwardSerial where TransNum='$docentry'
''');
    return List.generate(result.length, (i) {
      return wmstransoutwardtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
            manageby: result[i]['ManageBy'].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }

//   static Future<List<Documents>> getdata(
//     Database db,
//     String? docentry,
//   ) async {
//     final List<Map<String, Object?>> result = await db.rawQuery('''
//  SELECT * From wmsinward where DocEntry='$docentry'
// ''');
//     return List.generate(result.length, (i) {
//       return Documents(
//           itemdocentry: int.parse(result[i]['itemDocEntry'].toString()),
//           Brand: result[i]['brand'].toString(),
//           Product: result[i]['product'].toString(),
//           Category: result[i]['category'].toString(),
//           itemname: result[i]['ItemName'].toString(),
//           ManageBy: result[i]['ManageBy'].toString(),
//           MfgDate: result[i]['MfgDate'].toString(),
//           Pack_Quantity: double.parse(result[i]['Pack_Quantity'].toString()),
//           Unit_Quantity: double.parse(result[i]['Unit_Quantity'].toString()),
//           TagText: result[i]['TagText'].toString(),
//           WhsCode: result[i]['WhsCode'].toString(),
//           docEntry: int.parse(result[i]['DocEntry'].toString()),
//           itemCode: result[i]['ItemCode'].toString(),
//           lineNum: int.parse(result[i]['LineNum'].toString()),
//           numAtCard: result[i]['NumAtCard'].toString(),
//           serialNum: result[i]['SerialNum'].toString(),
//           quantity: double.parse(result[i]['Quantity'].toString()),
//           expirydate: result[i]['Expirydate'].toString());
//     });
//   }
static Future<List<wmstransInwtabSerialModel>>
      inwsaveAllserialDatafinal(
          String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstransInwSerial WHERE TransNum = "$docEntry" AND ItemCode ="$itemCode" AND LineID = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstransInwtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
          manageBy: result[i]["ManageBy"].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }
  static Future<List<wmstransoutwardtabSerialModel>>
      outwardsaveAllserialDatafinal(
          String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstransoutwardSerial WHERE TransNum = "$docEntry" AND ItemCode ="$itemCode" AND LineID = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");


    return List.generate(result.length, (i) {
      return wmstransoutwardtabSerialModel(
          branch: result[i]['Branch'].toString(),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()),
          qty: double.parse(result[i]['Qty'].toString()),
          serialnum: result[i]['Serialnum'].toString(),
          transNum: result[i]['TransNum'].toString(),
           manageby: result[i]['ManageBy'].toString(),
          transtype: result[i]['Transtype'].toString());
    });
  }
static Future<List<wmstransInwtabitemModel>> inwsaveAllDatafinal(
      String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    // final List<Map<String, Object?>> result2 = await db.rawQuery(
    //   'SELECT * FROM wmstransoutwarditem WHERE UTransNum = "$docEntry" ',
    // );
    // print("resultfinal: $result2");
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstransInwitem WHERE UTransNum = "$docEntry" AND ItemCode ="$itemCode" AND LineID = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstransInwtabitemModel(
        docentry: int.parse(result[i]['Docentry'].toString()),
          fromWarehouse: result[i]['FromWarehouse'].toString(),
          itemCode: result[i]['ItemCode'].toString(),
          lineID: int.parse(result[i]['LineID'].toString()), 
          quantity: double.parse(result[i]['Quantity'].toString()),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          toWarehouse: result[i]['ToWarehouse'].toString(),
          manageby:result[i]['ManageBy'].toString() ,
          uTransNum: result[i]['UTransNum'].toString());
    });
  }
  static Future<List<wmstransoutwardtabitemModel>> outwardsaveAllDatafinal(
      String docEntry, String itemCode, String lineNO, Database db) async {
    //  final Database db = await createDB();
    final List<Map<String, Object?>> result2 = await db.rawQuery(
      'SELECT * FROM wmstransoutwarditem WHERE UTransNum = "$docEntry" ',
    );
    print("resultfinal: $result2");
    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT * FROM wmstransoutwarditem WHERE UTransNum = "$docEntry" AND ItemCode ="$itemCode" AND LineID = "$lineNO" ',
    );
    print("resultfinal: $result");
    //  print("result length : present ${result.length}");

    return List.generate(result.length, (i) {
      return wmstransoutwardtabitemModel(
          fromWarehouse: result[i]['FromWarehouse'].toString(),
          itemCode: result[i]['ItemCode'].toString(),
          baseentry: int.parse(result[i]['Baseentry'].toString()) ,
          lineID: int.parse(result[i]['LineID'].toString()),
          quantity: double.parse(result[i]['Quantity'].toString()),
          scannedqty: int.parse(result[i]['Scannedqty'].toString()),
          toWarehouse: result[i]['ToWarehouse'].toString(),
          uTransNum: result[i]['UTransNum'].toString());
    });
  }



  // static Future<List<Documents>> saveAllDatafinal(
  //     String docEntry, String itemCode, String lineNO, Database db) async {
  //   //  final Database db = await createDB();
  //   final List<Map<String, Object?>> result = await db.rawQuery(
  //     'SELECT * FROM wmsinward WHERE DocEntry = "$docEntry" AND ItemCode ="$itemCode" AND LineNum = "$lineNO" ',
  //   );
  //   print("resultfinal: $result");
  //   //  print("result length : present ${result.length}");

  //   return List.generate(result.length, (i) {
  //     return Documents(
  //         itemdocentry: int.parse(result[i]['itemDocEntry'].toString()),
  //         Brand: result[i]['brand'].toString(),
  //         Product: result[i]['product'].toString(),
  //         Category: result[i]['category'].toString(),
  //         itemname: result[i]['ItemName'].toString(),
  //         ManageBy: result[i]['ManageBy'].toString(),
  //         MfgDate: result[i]['MfgDate'].toString(),
  //         Pack_Quantity: double.parse(result[i]['Pack_Quantity'].toString()),
  //         Unit_Quantity: double.parse(result[i]['Unit_Quantity'].toString()),
  //         TagText: result[i]['TagText'].toString(),
  //         WhsCode: result[i]['WhsCode'].toString(),
  //         docEntry: int.parse(result[i]['DocEntry'].toString()),
  //         itemCode: result[i]['ItemCode'].toString(),
  //         lineNum: int.parse(result[i]['LineNum'].toString()),
  //         numAtCard: result[i]['NumAtCard'].toString(),
  //         serialNum: result[i]['SerialNum'].toString(),
  //         quantity: double.parse(result[i]['Quantity'].toString()),
  //         expirydate: result[i]['Expirydate'].toString());
  //   });
  // }

}
