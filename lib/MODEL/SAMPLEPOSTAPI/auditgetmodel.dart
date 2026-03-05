


import 'dart:convert';

class auditgetmodelheader{
  String? execption;
  int?stcode;
 List<auditgetmodel>? auditgetmodeldata;
 auditgetmodelheader({
  required this.auditgetmodeldata,
  required this.execption,
  required this.stcode,
 });
 factory auditgetmodelheader.fromJson(Map<String,dynamic>jsons,int rescode){
 if(jsons==null){
  var Listt=json.decode(jsons["data"])as List;
  List<auditgetmodel> finalList=Listt.map((e) =>auditgetmodel.fromJson((e)) ).toList();
return auditgetmodelheader(
  auditgetmodeldata: finalList, 
  execption: null,
   stcode: rescode);
 }else{
  return auditgetmodelheader(
  auditgetmodeldata:null, 
  execption: 'No data..!',
   stcode: rescode);
 }
 }
 factory auditgetmodelheader.execption(Map<String,dynamic>jsons,int rescode){
  return auditgetmodelheader(
    auditgetmodeldata:null ,
     execption:jsons["respdesc"] , 
     stcode: rescode);
 }
 factory auditgetmodelheader.issues(String jsons,int rescode){
  return auditgetmodelheader(
    auditgetmodeldata: null,
     execption: "Api Error",
      stcode: rescode);
 }
}




class auditgetmodel{
String? Itemcode;
String?Itemname;
auditgetmodel({
  required this.Itemcode,
  required this.Itemname,
});
factory auditgetmodel.fromJson(Map<String,dynamic>jsons){
  return auditgetmodel(
    Itemcode: jsons["Itemcode"]??"", 
    Itemname: jsons["Itemname"]??"");
}

}