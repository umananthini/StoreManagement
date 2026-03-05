


class factoryyy{
  String?execption;
int? stcode;
Sample? value;
factoryyy({
     required this.execption,
     required this.stcode,
     required this.value
});
factory factoryyy.fromJson(Map<String,dynamic>jsons,int stcode){
  if(jsons.isEmpty){
  return factoryyy
  (execption:null, 
  stcode: stcode, 
  value: Sample.fromJson(jsons));

  }else{
    return factoryyy
  (execption:'No Data..!', 
  stcode: stcode, 
  value: null);
  }

}
factory factoryyy.execption(Map<String,dynamic>jsons,int stcode){
  return factoryyy
  (execption: "Api Error",
   stcode: stcode, 
   value: null);
}
factory factoryyy.issues(String jsons,int stcode){
  return factoryyy(
    execption: 'Network error', 
    stcode: stcode,
     value: null);
}
}




class Sample {
  String? itemCode;
  int? docEntry;
  int? lineNum;
  String? itemname;
  String? serialBatch;
  String? brand;
  String? product;
  String? category;
  bool? approved;
  String? transNum;
  int? transferQty;
  String? transtype;
  String? branch;
  List<Sample1>? inwardLineNums;
  Sample({
required this.approved,
required this.branch,
required this.brand,
required this.category,
required this.docEntry,
required this.inwardLineNums,
required this.itemCode,
required this.itemname,
required this.lineNum,
required this.product,
required this.serialBatch,
required this.transNum,
required this.transferQty,
required this.transtype

  });
  factory Sample.fromJson(Map<String,dynamic>jsons){
    if(jsons!=null){
       var Listrrr= jsons['inwardLineNums'] as List;
      final  List<Sample1> dataListrrr=Listrrr.map((e) =>Sample1.fromJson(e) ).toList();
      return Sample(
        approved: jsons["approved"]??false,
         branch: jsons["branch"]??"",
          brand: jsons["brand"]??"",
           category: jsons["category"]??"", 
           docEntry: jsons["docEntry"]??0, 
           inwardLineNums: dataListrrr, 
           itemCode: jsons["itemCode"]??"",
            itemname: jsons["itemname"]??"",
             lineNum: jsons["lineNum"]??0, 
             product: jsons["product"]??"",
              serialBatch: jsons["serialBatch"]??"", 
              transNum: jsons["transNum"]??"", 
              transferQty: jsons["transferQty"]??0,
               transtype: jsons["transtype"]??"");
    }else{
 return Sample(
        approved: null,
         branch:null,
          brand: null,
           category: null, 
           docEntry: null, 
           inwardLineNums: null, 
           itemCode: null,
            itemname: null,
             lineNum: null, 
             product:null,
              serialBatch: null, 
              transNum: null, 
              transferQty:null,
               transtype: null);
    }
  }
}

class Sample1 {
  String? itemCode;
  String? fromWarehouseCode;
  String? warehouseCode;
  int? qty;
  List<Sample2>? inwardLineNums;
  Sample1({
    required this.fromWarehouseCode,
    required this.inwardLineNums,
    required this.itemCode,
    required this.qty,
    required this.warehouseCode,
  });
  factory Sample1.fromJson(Map<String,dynamic>jsons){
    if(jsons!=null){
       var Listttt = jsons["serialBatchNums"]as List;
final List<Sample2> finallist= Listttt.map((e)=> Sample2.fromjson(e) ).toList();
 return Sample1(
      
      fromWarehouseCode: jsons["fromWarehouseCode"]??"",
       inwardLineNums:  finallist, 
       itemCode:  jsons["itemCode"]??"", 
       qty:  jsons["qty"]??"", 
       warehouseCode:  jsons["warehouseCode"]??"");
    }else{
       return Sample1(
      
      fromWarehouseCode:null ,
       inwardLineNums:  null, 
       itemCode: null, 
       qty: null, 
       warehouseCode:  null);
    }
   
  }
  Map<String,dynamic>tojson(){
    Map<String,dynamic>map={
      "itemCode": itemCode,
      "fromWarehouseCode": fromWarehouseCode,
      "warehouseCode":warehouseCode,
      "qty": qty,
      "serialBatchNums":inwardLineNums!.isEmpty? []: inwardLineNums!.map((e) => e.tojsons()).toList()
    };
    return map;
  }


 
}

class Sample2 {
  String? manufacturerSerialNumber;
  String? internalSerialNumber;
  int? qty;
  Sample2({
required this.internalSerialNumber,
required this.manufacturerSerialNumber,
required this.qty
  });
  factory Sample2.fromjson(Map<String,dynamic>jsons){
    return Sample2(
      internalSerialNumber:jsons['internalSerialNumber'] ??"",
       manufacturerSerialNumber: jsons['manufacturerSerialNumber'] ??"", 
       qty: jsons['qty'] ??0);
  }
   Map<String,dynamic>tojsons(){
    Map<String,dynamic>map=   {
          "manufacturerSerialNumber": manufacturerSerialNumber,
          "internalSerialNumber":internalSerialNumber,
          "qty": qty,
        }; 
        return map;
  }
}
