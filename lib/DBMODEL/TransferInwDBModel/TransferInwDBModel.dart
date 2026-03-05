

const String wmstransInwSerialtable = "wmstransInwSerial";

class wmstransInwtabSerialColumn {
  static String lineID = "LineID";
  static String transtype = "Transtype";
  static String branch = "Branch";
  static String serialnum = "Serialnum";
  static String transNum = "TransNum";
  static String itemCode = "ItemCode";
  static String qty = "Qty";
  static String scannedqty = "Scannedqty";
  static String manageBy="ManageBy";
}

class wmstransInwtabSerialModel {
  int? lineID;
  String? transtype;
  String? branch;
  String? serialnum;
  String? transNum;
  String? itemCode;
  String? manageBy;
  double? qty;
  int? scannedqty;
  wmstransInwtabSerialModel(
      {required this.branch,
      required this.scannedqty,
      required this.itemCode,
      required this.lineID,
      required this.qty,
      required this.serialnum,
      required this.transNum,
      required this.manageBy,
      required this.transtype});

  Map<String, Object?> toMap() => {
        wmstransInwtabSerialColumn.scannedqty: scannedqty,
        wmstransInwtabSerialColumn.branch: branch,
        wmstransInwtabSerialColumn.lineID: lineID,
        wmstransInwtabSerialColumn.transtype: transtype,
        wmstransInwtabSerialColumn.serialnum: serialnum,
        wmstransInwtabSerialColumn.transNum: transNum,
        wmstransInwtabSerialColumn.itemCode: itemCode,
        wmstransInwtabSerialColumn.manageBy: manageBy,
        wmstransInwtabSerialColumn.qty: qty,
      };
}

const String wmstransinwitemtable = "wmstransInwitem";

class wmstransInwtabitemColumn {
  static String lineID = "LineID";
  static String itemCode = "ItemCode";
  static String quantity = "Quantity";
  static String fromWarehouse = "FromWarehouse";
  static String toWarehouse = "ToWarehouse";
  static String uTransNum = "UTransNum";
  static String scannedqty = "Scannedqty";
  static String docentry = "Docentry";
   static String manageby= "ManageBy";
}

class wmstransInwtabitemModel {
  int? lineID;
  String? itemCode;
  double? quantity;
  String? fromWarehouse;
  String? toWarehouse;
  String? uTransNum;
  int? scannedqty;
  int? docentry;
  String? manageby;
  wmstransInwtabitemModel(
      {required this.fromWarehouse,
      required this.docentry,
      required this.itemCode,
      required this.lineID,
      required this.quantity,
      required this.scannedqty,
      required this.toWarehouse,
      required this.manageby,
      required this.uTransNum});
  Map<String, Object?> tomap() => {
        wmstransInwtabitemColumn.fromWarehouse: fromWarehouse,
        wmstransInwtabitemColumn.itemCode: itemCode,
        wmstransInwtabitemColumn.lineID: lineID,
        wmstransInwtabitemColumn.quantity: quantity,
        wmstransInwtabitemColumn.scannedqty: scannedqty,
        wmstransInwtabitemColumn.toWarehouse: toWarehouse,
        wmstransInwtabitemColumn.uTransNum: uTransNum,
       wmstransInwtabitemColumn.docentry: docentry,
       wmstransInwtabitemColumn.manageby: manageby,
      };
}
