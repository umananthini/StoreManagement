const String wmstransoutwardSerialtable = "wmstransoutwardSerial";

class wmstransoutwardtabSerialColumn {
  static String lineID = "LineID";
  static String transtype = "Transtype";
  static String branch = "Branch";
  static String serialnum = "Serialnum";
  static String transNum = "TransNum";
  static String itemCode = "ItemCode";
  static String qty = "Qty";
  static String scannedqty = "Scannedqty";
  static String manageby= "ManageBy";

}

class wmstransoutwardtabSerialModel {
  int? lineID;
  String? transtype;
  String? branch;
  String? serialnum;
  String? transNum;
  String? itemCode;
  double? qty;
  String?manageby;
  int? scannedqty;
  wmstransoutwardtabSerialModel(
      {required this.branch,
      required this.scannedqty,
      required this.itemCode,
      required this.lineID,
      required this.qty,
      required this.serialnum,
      required this.transNum,
      required this.manageby,
      required this.transtype});

  Map<String, Object?> toMap() => {
        wmstransoutwardtabSerialColumn.scannedqty: scannedqty,
        wmstransoutwardtabSerialColumn.branch: branch,
        wmstransoutwardtabSerialColumn.lineID: lineID,
        wmstransoutwardtabSerialColumn.transtype: transtype,
        wmstransoutwardtabSerialColumn.serialnum: serialnum,
        wmstransoutwardtabSerialColumn.transNum: transNum,
        wmstransoutwardtabSerialColumn.itemCode: itemCode,
        wmstransoutwardtabSerialColumn.qty: qty,
        wmstransoutwardtabSerialColumn.manageby: manageby,
      };
}

const String wmstransoutwarditemtable = "wmstransoutwarditem";

class wmstransoutwardtabitemColumn {
  static String baseentry = "Baseentry";
  static String lineID = "LineID";
  static String itemCode = "ItemCode";
  static String quantity = "Quantity";
  static String fromWarehouse = "FromWarehouse";
  static String toWarehouse = "ToWarehouse";
  static String uTransNum = "UTransNum";
  static String scannedqty = "Scannedqty";
}

class wmstransoutwardtabitemModel {
  int? baseentry;
  int? lineID;
  String? itemCode;
  double? quantity;
  String? fromWarehouse;
  String? toWarehouse;
  String? uTransNum;
  int? scannedqty;
  wmstransoutwardtabitemModel(
      {required this.fromWarehouse,
      required this.baseentry,
      required this.itemCode,
      required this.lineID,
      required this.quantity,
      required this.scannedqty,
      required this.toWarehouse,
      required this.uTransNum});
  Map<String, Object?> tomap() => {
        wmstransoutwardtabitemColumn.baseentry: baseentry,
        wmstransoutwardtabitemColumn.fromWarehouse: fromWarehouse,
        wmstransoutwardtabitemColumn.itemCode: itemCode,
        wmstransoutwardtabitemColumn.lineID: lineID,
        wmstransoutwardtabitemColumn.quantity: quantity,
        wmstransoutwardtabitemColumn.scannedqty: scannedqty,
        wmstransoutwardtabitemColumn.toWarehouse: toWarehouse,
        wmstransoutwardtabitemColumn.uTransNum: uTransNum,
      };
}
