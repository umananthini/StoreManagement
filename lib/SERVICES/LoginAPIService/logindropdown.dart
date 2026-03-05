
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:warehousemanagement/SERVICES/URL.dart';

import 'package:warehousemanagement/MODEL/LoginApi/LoginDropDownModel/logindropdown.dart';

class LogInDropDownServices{
  int? rescode=500;
  static Future <LoginDropDownHeader>getdata()async{
    try{  
       final responce=await http.get(Uri.parse("${URL.queryApi}Inv/v1/GetDatabase"),
       );
       log("aaa::"+responce.statusCode.toString());
      //  log("aaaaaa::"+responce.body.toString());
       if(responce.statusCode==200){
         return LoginDropDownHeader.fromJson(json.decode(responce.body),responce.statusCode);
       }else{
         return LoginDropDownHeader.execption(json.decode(responce.body),responce.statusCode);

       }
    }catch(e){
      log("${e.toString()}");
       return LoginDropDownHeader.issues("${e.toString()}",500);

    }
  }
}