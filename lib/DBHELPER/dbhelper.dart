import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:warehousemanagement/DBMODEL/InWardDBModel/inwarddbmodel.dart';
import 'package:warehousemanagement/DBMODEL/OutwardModel/TransOutwardDBModel.dart';
import 'package:warehousemanagement/DBMODEL/TransferInwDBModel/TransferInwDBModel.dart';
import 'package:warehousemanagement/DBMODEL/purchaseInwDBModel/PurchaseInwDBModel.dart';

class DBHelper {
  static Database? _db;
  DBHelper._() {}
  static Future<Database?> getinstance() async {
    String path = await getDatabasesPath();
    log("path::" + path.toString());
    if (_db == null) {
      _db = await openDatabase(join(path, 'WMSstore.db'),
          version: 1, onCreate: createtable);
    }
    return _db;
  }

  static void createtable(Database database, int version) async {
    // await database.execute('''
    //        create table $tablename(
    //          NId integer primary key autoincrement,
    //          ${Columns.Brand} varchar,
    //          ${Columns.docEntry} integer,
    //         ${Columns.Category} varchar,
    //          ${Columns.Product} varchar,
    //          ${Columns.itemdocentry} integer,
    //          ${Columns.numAtCard} varchar,
    //          ${Columns.lineNum} integer,
    //          ${Columns.itemCode} varchar,
    //          ${Columns.serialNum} varchar,
    //          ${Columns.quantity} decimal,
    //          ${Columns.expirydate} varchar,
    //          ${Columns.manageBy} varchar,
    //          ${Columns.whsCode} varchar,
    //          ${Columns.unit_Quantity} decimal,
    //          ${Columns.pack_Quantity} decimal,
    //          ${Columns.tagText} varchar,
    //          ${Columns.mfgDate} varchar,
    //          ${Columns.itemName} varchar
    //          )
    //     ''');
    await database.execute('''
                 create table $wmstranspurchaseSerialtable(
                 NId integer primary key autoincrement,
                 ${wmstranspurchaseSerialColumn.docentry} int,
                 ${wmstranspurchaseSerialColumn.lineNum} int,
                 ${wmstranspurchaseSerialColumn.itemCode} varchar,
                 ${wmstranspurchaseSerialColumn.itemDescription} varchar,
                 ${wmstranspurchaseSerialColumn.quantity} int,
                 ${wmstranspurchaseSerialColumn.price} decimal,
                 ${wmstranspurchaseSerialColumn.scannedqty} int,
                 ${wmstranspurchaseSerialColumn.manufacturerSerialNumber} varchar,
                 ${wmstranspurchaseSerialColumn.internalSerialNumber} varchar,
                 ${wmstranspurchaseSerialColumn.notes} varchar,
                  ${wmstranspurchaseSerialColumn.manageby} varchar
                 )
                 ''');
    await database.execute('''
                 create table $wmstranspurchaseitemtable(
                 NId integer primary key autoincrement,
                 ${wmstranspurchaseitemColumn.docentry} int,
                 ${wmstranspurchaseitemColumn.lineNum} int,
                 ${wmstranspurchaseitemColumn.itemCode} varchar,
                 ${wmstranspurchaseitemColumn.itemDescription} varchar,
                 ${wmstranspurchaseitemColumn.quantity} int,
                 ${wmstranspurchaseitemColumn.price} decimal,
                 ${wmstranspurchaseitemColumn.warehouseCode} varchar,
                 ${wmstranspurchaseitemColumn.salesPersonCode} int,
                 ${wmstranspurchaseitemColumn.baseType} varchar,
                 ${wmstranspurchaseitemColumn.baseEntry} int,
                 ${wmstranspurchaseitemColumn.baseLine} int,
                 ${wmstranspurchaseitemColumn.taxCode} varchar,
                 ${wmstranspurchaseitemColumn.manageBy} varchar,
                 ${wmstranspurchaseitemColumn.scannedqty} int
                 )
                 ''');

    await database.execute('''
                 create table $wmstransoutwardSerialtable(
                 NId integer primary key autoincrement,
                 ${wmstransoutwardtabSerialColumn.branch} varchar,
                 ${wmstransoutwardtabSerialColumn.lineID} int,
                 ${wmstransoutwardtabSerialColumn.transtype} varchar,
                 ${wmstransoutwardtabSerialColumn.serialnum} varchar,
                 ${wmstransoutwardtabSerialColumn.transNum} varchar,
                 ${wmstransoutwardtabSerialColumn.itemCode} varchar,
                 ${wmstransoutwardtabSerialColumn.manageby} varchar,
                 ${wmstransoutwardtabSerialColumn.qty} decimal,
                 ${wmstransoutwardtabSerialColumn.scannedqty} int
                 )
                 ''');
    await database.execute('''
                 create table $wmstransoutwarditemtable(
                 NId integer primary key autoincrement,
                 ${wmstransoutwardtabitemColumn.itemCode} varchar,
                 ${wmstransoutwardtabitemColumn.lineID} int,
                 ${wmstransoutwardtabitemColumn.uTransNum} varchar,
                 ${wmstransoutwardtabitemColumn.toWarehouse} varchar,
                 ${wmstransoutwardtabitemColumn.fromWarehouse} varchar,
                 ${wmstransoutwardtabitemColumn.quantity} decimal,
                 ${wmstransoutwardtabitemColumn.scannedqty} int,
                 ${wmstransoutwardtabitemColumn.baseentry} int
                 )
                 ''');
                  await database.execute('''
                 create table $wmstransInwSerialtable(
                 NId integer primary key autoincrement,
                 ${wmstransInwtabSerialColumn.branch} varchar,
                 ${wmstransInwtabSerialColumn.lineID} int,
                 ${wmstransInwtabSerialColumn.transtype} varchar,
                 ${wmstransInwtabSerialColumn.serialnum} varchar,
                 ${wmstransInwtabSerialColumn.transNum} varchar,
                 ${wmstransInwtabSerialColumn.itemCode} varchar,
                 ${wmstransInwtabSerialColumn.manageBy} varchar,
                 ${wmstransInwtabSerialColumn.qty} decimal,
                 ${wmstransInwtabSerialColumn.scannedqty} int
                 )
                 ''');
    await database.execute('''
                 create table $wmstransinwitemtable(
                 NId integer primary key autoincrement,
                 ${wmstransInwtabitemColumn.itemCode} varchar,
                 ${wmstransInwtabitemColumn.lineID} int,
                 ${wmstransInwtabitemColumn.uTransNum} varchar,
                 ${wmstransInwtabitemColumn.toWarehouse} varchar,
                 ${wmstransInwtabitemColumn.fromWarehouse} varchar,
                 ${wmstransInwtabitemColumn.manageby} varchar,
                 ${wmstransInwtabitemColumn.quantity} decimal,
                 ${wmstransInwtabitemColumn.scannedqty} int,
                 ${wmstransInwtabitemColumn.docentry} int
                 )
                 ''');
  }
}
