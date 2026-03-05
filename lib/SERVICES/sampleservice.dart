


import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:warehousemanagement/SERVICES/URL.dart';
import 'package:warehousemanagement/MODEL/samplemodel.dart';

class sampleservice {
  int stcode=500;
  static Future <factoryyy> getdata(List<Sample1>sample11)async{
    try{
final response= await http.post(
  Uri.parse("${URL.queryApi}Inv/v1/AddStockInward"),
  headers: {
    "Authorization":"bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbmNyeXB0ZWRDbGFpbXMiOiJtSmZ6WGFOMUR4ZlJvRnM5RGVzcGxmQWdwdUxsbm1FTmk4NThPUGI2QzB6MDEzYVlkVFVuYjFlWDVNd1A5cUwrRkRJelZxTHNFZlUxZnJPTnlEck1FcTBwZ1doL1cvRVpiMjFERHoxdmRYQllaRlcwTU80TXhzc1RNbTMzUFYxZHpBNFVFZUx0R3JIeEpVZmRaV0VuSGVqYmxSTTJIZDhKaE45N1lLaXZVRmhkU0hLdlErdWdtSVdQN0lnbFN3c1JmYVRWL0J0L3Z0cjRaeVN3V3JUc3ZDU2UySXU0bVk0dXJNck5td25RczBrWEpvZHFmQS9JNGJNWVc5N1F1SUovK2hDTmUvaFBMdk41WVVQQyt3L2UvcDUxOGNNVTN2ckpUNTJzbXU2QUM2Yz0iLCJuYmYiOjE3NTcwNDk5MDMsImV4cCI6MTc1NzA3ODcwMywiaWF0IjoxNzU3MDQ5OTAzfQ.nwnP7O9MEHW85G8ShiXhL9Vl7ztgU6lCLpg7T3EJVGd6xUj5wy7JbPPVSHDrVUhwf66SY-8A0qMY_nsduOfzlg",
   "Content-Type":"application/json"
    },
    body: jsonEncode({
  "itemCode": "string",
  "docEntry": 0,
  "lineNum": 0,
  "itemname": "string",
  "serialBatch": "string",
  "brand": "string",
  "product": "string",
  "category": "string",
  "approved": true,
  "transNum": "string",
  "transferQty": 0,
  "transtype": "string",
  "branch": "string",
  "inwardLineNums": sample11!.map((e) => e.tojson()).toList()
})
);

if(response.statusCode==200){
 return factoryyy.fromJson(json.decode(response.body), response.statusCode);
}else{
 return factoryyy.execption(json.decode(response.body), response.statusCode);

}
    }catch(e){
 return factoryyy.issues(e.toString(),500);

    }
  }
}