


import 'dart:convert';

import 'package:warehousemanagement/MODEL/samplemodel1.dart';
import 'package:http/http.dart' as http;


class SampleService1 {
  int stcode=500;
   
   static Future <samplemodelheader1> getdata()async{
    try{
  final responce= await http.get(Uri.parse(""));
if(responce.statusCode==200){
 return samplemodelheader1.fromJson(json.decode(responce.body), responce.statusCode);
}else{
 return samplemodelheader1.execption(json.decode(responce.body), responce.statusCode);

}
    }catch(e){
return  samplemodelheader1.issues(e.toString(), 500);
    }
   }
}