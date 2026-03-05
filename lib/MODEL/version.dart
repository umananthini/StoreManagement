



import 'dart:convert';

class versionnnnnumheader{
  int?stcode;
  String?execption;
  List<versionnum>?vn;
  versionnnnnumheader({
    required this.execption,
    required this.stcode,
    required this.vn,
  });
  factory versionnnnnumheader.fromJson(Map<String,dynamic>jsons,int rescode){
    if(jsons !=null){
      var Lists= json.decode(jsons["data"])as List;
       List<versionnum> finallist=Lists.map((e) => versionnum.fromJson(e)).toList();
       return versionnnnnumheader(
        execption: null,
         stcode: rescode,
          vn: finallist);
          }else {
             return versionnnnnumheader(
        execption: "No Data..",
         stcode: rescode,
          vn: null);
          }
  }
  factory versionnnnnumheader.execption(Map<String,dynamic>jsons,int rescode){
        return versionnnnnumheader(
        execption: jsons['respDesc'],
         stcode: rescode,
          vn: null);
  }
   factory versionnnnnumheader.issue(String jsons,int rescode){
        return versionnnnnumheader(
        execption:jsons,
         stcode: rescode,
          vn: null);
  }
}



class versionnum{
  int?Id;
  String? Version;
  versionnum({
required this.Version,
required this.Id,

  });
  factory versionnum.fromJson(Map<String,dynamic>jsons){
    return versionnum(
      Version: jsons["Version"]??"",
       Id:  jsons["Id"]??0,);
  }
}