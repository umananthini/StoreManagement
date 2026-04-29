const String wmstranspurchaseSerialtable = "wmstranspurchaseSerial";

class wmstranspurchaseSerialColumn {
  static String lineNum = "LineNum";
  static String docentry = "Docentry";
  static String manufacturerSerialNumber = "ManufacturerSerialNumber";
  static String internalSerialNumber = "InternalSerialNumber";
  static String itemCode = "ItemCode";
  static String itemDescription = "ItemDescription";
  static String quantity = "Quantity";
  static String price = "Price";
  static String scannedqty = "Scannedqty";
  static String notes = "Notes";
  static String manageby = "ManageBy";
  static String taxrate = "taxRate";
}

class wmstranspurchaseSerialModel {
  int? docentry;
  int? lineNum;
  String? itemCode;
  String? itemDescription;
  int? quantity;
  double? price;
  int? scannedqty;
  String? manufacturerSerialNumber;
  String? internalSerialNumber;
  String? notes;
  String? manageby;
  int? taxRate;
  wmstranspurchaseSerialModel(
      {required this.scannedqty,
      required this.docentry,
      required this.itemCode,
      required this.itemDescription,
      required this.lineNum,
      required this.price,
      required this.quantity,
      required this.internalSerialNumber,
      required this.manufacturerSerialNumber,
      required this.notes,
      required this.manageby,
      required this.taxRate});

  Map<String, Object?> toMap() => {
        wmstranspurchaseSerialColumn.scannedqty: scannedqty,
        wmstranspurchaseSerialColumn.docentry: docentry,
        wmstranspurchaseSerialColumn.itemCode: itemCode,
        wmstranspurchaseSerialColumn.itemDescription: itemDescription,
        wmstranspurchaseSerialColumn.lineNum: lineNum,
        wmstranspurchaseSerialColumn.price: price,
        wmstranspurchaseSerialColumn.quantity: quantity,
        wmstranspurchaseSerialColumn.manufacturerSerialNumber:
            manufacturerSerialNumber,
        wmstranspurchaseSerialColumn.internalSerialNumber: internalSerialNumber,
        wmstranspurchaseSerialColumn.notes: notes,
        wmstranspurchaseSerialColumn.manageby: manageby,
        wmstranspurchaseSerialColumn.taxrate: taxRate
      };
}

const String wmstranspurchaseitemtable = "wmstranspurchaseitemtable";

class wmstranspurchaseitemColumn {
  static String docentry = "Docentry";
  static String lineNum = "LineNum";
  static String itemCode = "ItemCode";
  static String itemDescription = "ItemDescription";
  static String quantity = "Quantity";
  static String price = "Price";
  static String warehouseCode = "WarehouseCode";
  static String salesPersonCode = "SalesPersonCode";
  static String baseType = "BaseType";
  static String baseEntry = "BaseEntry";
  static String baseLine = "BaseLine";
  static String taxCode = "TaxCode";
  static String manageBy = "ManageBy";
  static String scannedqty = "Scannedqty";
  static String taxRate = "taxRate";
}

class wmstranspurchaseitemModel {
  int? docentry;
  int? lineNum;
  String? itemCode;
  String? itemDescription;
  int? quantity;
  double? price;
  String? warehouseCode;
  int? salesPersonCode;
  String? baseType;
  int? baseEntry;
  int? baseLine;
  String? taxCode;
  String? manageBy;
  int? taxRate;
  int? scannedqty;
  wmstranspurchaseitemModel(
      {required this.scannedqty,
      required this.baseEntry,
      required this.docentry,
      required this.baseLine,
      required this.baseType,
      required this.itemCode,
      required this.itemDescription,
      required this.lineNum,
      required this.manageBy,
      required this.price,
      required this.quantity,
      required this.salesPersonCode,
      required this.taxRate,
      required this.taxCode,
      required this.warehouseCode});

  Map<String, Object?> tomap() => {
        wmstranspurchaseitemColumn.scannedqty: scannedqty,
        wmstranspurchaseitemColumn.baseEntry: baseEntry,
        wmstranspurchaseitemColumn.docentry: docentry,
        wmstranspurchaseitemColumn.baseLine: baseLine,
        wmstranspurchaseitemColumn.baseType: baseType,
        wmstranspurchaseitemColumn.itemCode: itemCode,
        wmstranspurchaseitemColumn.itemDescription: itemDescription,
        wmstranspurchaseitemColumn.lineNum: lineNum,
        wmstranspurchaseitemColumn.manageBy: manageBy,
        wmstranspurchaseitemColumn.price: price,
        wmstranspurchaseitemColumn.quantity: quantity,
        wmstranspurchaseitemColumn.salesPersonCode: salesPersonCode,
        wmstranspurchaseitemColumn.taxCode: taxCode,
        wmstranspurchaseitemColumn.warehouseCode: warehouseCode,
        wmstranspurchaseitemColumn.taxRate: taxRate,
      };
}
