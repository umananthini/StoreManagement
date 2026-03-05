import 'dart:convert';

class getapprovehead{
  List<Getapprovalchild>? child;
  String? exception;
  int? stcodee;
  getapprovehead({
    required this.child,
    required this.exception,
    required this.stcodee

  });
  factory getapprovehead.fromJson(Map<String,dynamic> jsons,int stcode){
    if(jsons !=null){
      var list =json.decode(jsons['data']) as List;
      if(list.isNotEmpty){
 List<Getapprovalchild> datalist =list.map((e) => Getapprovalchild.fromJson(e)).toList();
return getapprovehead(
  child: datalist, 
  exception: null, 
  stcodee: stcode
  );
      }else{
        return getapprovehead(
  child: null, 
  exception: "No data", 
  stcodee: stcode
  );
      }
      

    }else{
        return getapprovehead(
  child: null, 
  exception: "No data", 
  stcodee: stcode
  );

    }
  }
factory getapprovehead.errors(Map<String,dynamic> jsons,int rescode){
  return getapprovehead(
  child: null, 
  exception: jsons['respDesc']??'', 
  stcodee: rescode
  );
}
factory getapprovehead.issues(String jsons,int rescode){
  return getapprovehead(
  child: null, 
  exception: jsons, 
  stcodee: rescode
  );
}
}

class Getapprovalchild{
  String? ItemCode;
  String? ItemName;
  String? StoreCode;
  String? SerialNo;
  String? Category;
  Getapprovalchild({
    required this.Category,
    required this.ItemCode,
    required this.ItemName,
    required this.SerialNo,
    required this.StoreCode

  });

  factory Getapprovalchild.fromJson(Map<String,dynamic> json){
    return Getapprovalchild(
      Category: json['Category']??"", 
      ItemCode: json['ItemCode']??"", 
      ItemName: json['ItemName']??"", 
      SerialNo: json['SerialNo']??"", 
      StoreCode: json['StoreCode']??""
      );
  }
}