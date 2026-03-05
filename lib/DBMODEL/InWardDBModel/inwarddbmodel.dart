// const String tablename = "wmsinward";

// class Columns {
//   static const String   itemdocentry= "itemDocEntry";
//   static const String   Brand= "brand";
//   static const String   Product= "product"; 
//   static const String   Category= "category";
//   static const String docEntry = "DocEntry";
//   static const String numAtCard = "NumAtCard";
//   static const String lineNum = "LineNum";
//   static const String itemCode = "ItemCode";
//   static const String serialNum = "SerialNum";
//   static const String expirydate = "Expirydate";
//   static const String quantity = "Quantity";
//   static const String manageBy = "ManageBy";
//   static const String whsCode = "WhsCode";
//   static const String itemName = "ItemName";
//   static const String unit_Quantity = "Unit_Quantity";
//   static const String pack_Quantity = "Pack_Quantity";
//   static const String tagText = "TagText";
//   static const String mfgDate = "MfgDate";

// //  static final String alterphone = "alterphone";
// }

// class Documents {
//   final int itemdocentry;
//   final String Brand;
//   final String Product;
//   final String Category ;
  
//   final int docEntry;
//   final String numAtCard;
//   final int lineNum;
//   final String itemCode;
//   final String itemname;
//   final String serialNum;
//   final String expirydate;
//   double quantity;
//   final String ManageBy;
//   final String WhsCode;
//   final double Unit_Quantity;
//   final double Pack_Quantity;
//   final String TagText;
//   final String MfgDate;
 
// //final int alterphone ;

//   Documents(
//       {
//       required this.itemdocentry,
// required this.Brand,
// required this.Category,
// required this.Product,
//       required this.itemname,
//       required this.docEntry,
//       required this.itemCode,
//       required this.lineNum,
//       required this.numAtCard,
//       required this.serialNum,
//       required this.quantity,
//       required this.expirydate,
//       required this.ManageBy,
//       required this.MfgDate,
//       required this.Pack_Quantity,
//       required this.TagText,
//       required this.Unit_Quantity,
//       required this.WhsCode});

//   Map<String, Object?> toMap() => {
//         Columns.Brand: Brand,
//         Columns.Product: Product,
//         Columns.Category: Category,
//         Columns.itemdocentry: itemdocentry,
//         Columns.itemName: itemname,
//         Columns.docEntry: docEntry,
//         Columns.numAtCard: numAtCard,
//         Columns.lineNum: lineNum,
//         Columns.itemCode: itemCode,
//         Columns.serialNum: serialNum,
//         Columns.expirydate: expirydate,
//         Columns.quantity: quantity,
//         Columns.manageBy: ManageBy,
//         Columns.mfgDate: MfgDate,
//         Columns.pack_Quantity: Pack_Quantity,
//         Columns.tagText: TagText,
//         Columns.unit_Quantity: Unit_Quantity,
//         Columns.whsCode: WhsCode,
//       };
//       }