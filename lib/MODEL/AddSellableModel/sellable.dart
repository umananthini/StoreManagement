
// import 'dart:convert';

// class AddSellableHeader{
//   int?rescode;
//   String?execption;
//   List<AddSellable>? data;
//   AddSellableHeader({
//     required this.data,
//     required this.execption,
//     required this.rescode,
//   });
//   factory AddSellableHeader.fromjson(Map<String,dynamic>jsons,int stcode){
//     if(jsons!=null){
// var finaldata= json.decode(jsons["data"])as List;
// List<AddSellable> finaldatalist=
//     }
//   }
// }



// class AddSellable {
//   String? ItemCode;
//   String?SerialNum;
//   double?SerialBatchQty;
//   int?BoxNo;
//   String? ProductSerialNo;
//   AddSellable({
//     required this.BoxNo,
//     required this.ItemCode,
//     required this.ProductSerialNo,
//     required this.SerialBatchQty,
//     required this.SerialNum
//   });
//   factory AddSellable.fromjson(Map<String,dynamic>jsons){
//     return AddSellable
//     (BoxNo: jsons["BoxNo"]??0,
//      ItemCode: jsons["ItemCode"]??"", 
//      ProductSerialNo: jsons["ProductSerialNo"]??"", 
//      SerialBatchQty: jsons["SerialBatchQty"]??0.0, 
//      SerialNum: jsons["SerialNum"]??""
//      );
//   }

// }