




// import 'dart:convert';

// class LoadTransferInwardheader{
//   int?rescode;
//   String? execption;
//   List<LoadTransferInward>?data;
//   LoadTransferInwardheader({
//     required this.data,
//     required this.execption,
//     required this.rescode
//   });
//   factory LoadTransferInwardheader.fromJson(Map<String,dynamic>jsons,int statusCode){
//     if(jsons!=null){
//       var Listss= json.decode(jsons["data"]) as List;
// List <LoadTransferInward> finalListss=Listss.map((e) =>LoadTransferInward.fromJson(e)).toList();
//    return LoadTransferInwardheader(
//     data: finalListss,
//      execption: null,
//       rescode: statusCode);
//     }else{
//       return LoadTransferInwardheader(
//     data: null,
//      execption:"No Data" ,
//       rescode: statusCode);
//     }
//   }
//   factory LoadTransferInwardheader.execption(Map<String,dynamic>jsons,int statusCode){
//     return  LoadTransferInwardheader(
//       data: null,
//        execption: "API Error", 
//        rescode: statusCode);
//   }
//   factory LoadTransferInwardheader.issue(String jsons,int rescode){
//     return LoadTransferInwardheader(
//       data: null,
//        execption: "Network Error", 
//        rescode: 500);
//   }
// }

// class LoadTransferInward {
//   int? DocEntry;
//   int? linenum;
//   String?ItemCode;
//    String?ItemName;
//     double?Quantity;
//     //  String?Brand;
//     //   String?Product;
//     //    String?Category;
//     //     String?SerialNum;
//     //      String?WhsCode;
//     //       String?mnfSerial;
//           LoadTransferInward({
//             // required this.Brand,
//             // required this.Category,
//             required this.DocEntry,
//             required this.ItemCode,
//             required this.ItemName,
//             // required this.Product,
//             required this.Quantity,
//             // required this.SerialNum,
//             // required this.WhsCode,
//             required this.linenum,
//             // required this.mnfSerial
//           });
// factory LoadTransferInward.fromJson(Map<String,dynamic>jsons){
//   return LoadTransferInward(
//     // Brand: jsons["Brand"]??"",
//     //  Category: jsons["Category"]??"",
//       DocEntry: jsons["DocEntry"]??0,
//        ItemCode: jsons["ItemCode"]??"",
//         ItemName: jsons["ItemName"]??"",
//         //  Product: jsons["Product"]??"",
//           Quantity: jsons["Quantity"]??0.0,
//           //  SerialNum: jsons["SerialNum"]??"",
//           //   WhsCode: jsons["WhsCode"]??"",
//              linenum: jsons["linenum"]??0, 
//             //  mnfSerial: jsons["mnfSerial"]??""
//              );
// }
// }
// class LoadTransferInwarditems {

//   int?DocEntry;
//   int?linenum;
//   String?ItemCode;
//    String?ItemName;
//     double?Quantity;
//      String?Brand;
//       String?Product;
//        String?Category;
//         String?SerialNum;
//          String?WhsCode;
//           String?mnfSerial;
//         LoadTransferInwarditems({
//           required this.Brand,
//           required this.Category,
//           required this.DocEntry,
//           required this.ItemCode,
//           required this.ItemName,
//           required this.Product,
//           required this.Quantity,
//           required this.SerialNum,
//           required this.WhsCode,
//           required this.linenum,
//           required this.mnfSerial,
//         });
// factory LoadTransferInward.fromJson(Map<String,dynamic>jsons){
//   if(jsons!=null){
// var inwardlist=json.decode(jsons['InwardItems'])as List;
// List<LoadTransferInward> finalinwardlist= inwardlist.map((e) =>LoadTransferInward.fromJson(e)).toList();
//   return LoadTransferInward(
//     DocEntry: json["InwardItems"]??0,
//      ItemCode: ItemCode, 
//      ItemName: ItemName, 
//      Quantity: Quantity,
//       linenum: linenum)
  
//   }
// }}


import 'dart:convert';

class LoadTransferHeader{
  int?statuscode;
  String? execption;
data? Dataa;
LoadTransferHeader({
  required this.Dataa,
  required this.execption,
  required this.statuscode,
});
factory LoadTransferHeader.fromJson(Map<String,dynamic>jsons,int statusCode){
  if(jsons!=null){
     var datalist=json.decode(jsons["data"])as Map<String,dynamic>;

    return LoadTransferHeader(
      Dataa:data.fromJson(datalist) ,
       execption: null, 
       statuscode: statusCode);

  }else{
     return LoadTransferHeader(
      Dataa:null ,
       execption: "No Data", 
       statuscode: statusCode);

  }
}
factory LoadTransferHeader.execption(Map<String,dynamic>jsons,int statusCode){
  return LoadTransferHeader(
    Dataa: null,
     execption: jsons["respDesc"], 
     statuscode: statusCode);
}
factory LoadTransferHeader.issues(String jsons,int statusCode){
     return LoadTransferHeader(
      Dataa: null,
       execption:"Net Work Issue" ,
        statuscode: 500);
}}

class data{
  List<loadtransferinward1>? LoadTransferInward1;
 List <loadtransferInwardItems1>?LoadTransferInwardItems1;
  data({
    required this.LoadTransferInward1,
    required this.LoadTransferInwardItems1,
  });
  factory data.fromJson(Map<String,dynamic>jsons){
    if(jsons["Inward"]!=null){
     var Inward1=(jsons["Inward"])as List;
List<loadtransferinward1> finalInward1=Inward1.map((e) =>loadtransferinward1.fromJson(e) ).toList();
      var InwardItems1=(jsons["InwardItems"])as List;
List<loadtransferInwardItems1> finalInwardItems1=InwardItems1.map((e) =>loadtransferInwardItems1.fromJson(e) ).toList();
      return data(
      LoadTransferInward1: finalInward1,
       LoadTransferInwardItems1: finalInwardItems1);
    
    }else{
       return data(
      LoadTransferInward1: null,
       LoadTransferInwardItems1: null);
    }
  
  }
}

class loadtransferinward1{
   int?DocEntry;
   int?linenum;
   String?Brand;
  String?Product;
  String?Category;
   String?ItemCode;
   String?ItemName;
   double?Quantity;
   String? manageby;
loadtransferinward1({
required this.DocEntry,
required this.ItemCode,
required this.ItemName,
required this.Quantity,
required this.linenum,
required this.manageby,
required this.Brand,
  required this.Category,
  required this.Product,

});
factory loadtransferinward1.fromJson(Map<String,dynamic>jsons){
  if(jsons!=null){

  
return loadtransferinward1(
  DocEntry: jsons["DocEntry"]??0, 
  ItemCode:  jsons["ItemCode"]??"", 
  ItemName:  jsons["ItemName"]??"",
   Quantity:  jsons["Quantity"]??0.0, 
   linenum:  jsons["linenum"]??0,
     Brand: jsons["Brand"]??"", 
    Category:  jsons["Category"]??"", 
      Product:  jsons["Product"]??"",
      manageby: jsons["ManageBy"]??""

   );
  }else{
return 
loadtransferinward1(
    Brand: null, 
        Product: null, 

      Category: null,
  DocEntry: null,
  ItemCode:  null, 
  ItemName:  null,
   Quantity:  null, 
   linenum: null,
   manageby: null
   );
  }
}
}
class loadtransferInwardItems1{

  int?DocEntry;
  int?linenum;
  String?ItemCode;
  String?ItemName;
  double?Quantity;
  
  String?SerialNum;
  String?WhsCode;
  String?mnfSerial;
 loadtransferInwardItems1({
  
  required this.DocEntry,
  required this.ItemCode,
  required this.ItemName,
  required this.Quantity,
  required this.SerialNum,
  required this.WhsCode,
  required this.linenum,
  required this.mnfSerial,
 });
 factory loadtransferInwardItems1.fromJson(Map<String,dynamic>jsons){
  if(jsons!=null){

  return loadtransferInwardItems1(
  
    DocEntry:  jsons["DocEntry"]??0,
     ItemCode:  jsons["ItemCode"]??"",
      ItemName:  jsons["ItemName"]??"", 
       Quantity:  jsons["Quantity"]??0.0,
        SerialNum:  jsons["SerialNum"]??"",
        WhsCode:  jsons["WhsCode"]??"",
         linenum:  jsons["linenum"]??0,
          mnfSerial:  jsons["mnfSerial"]??"");
  }else{
     return loadtransferInwardItems1(
    
       DocEntry: null, 
       ItemCode: null, 
       ItemName: null,
        Quantity: null, 
        SerialNum: null,
         WhsCode: null,
          linenum: null, 
          mnfSerial: null
          );
  }
 }

}
