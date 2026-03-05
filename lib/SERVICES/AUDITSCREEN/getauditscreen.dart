

import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:warehousemanagement/MODEL/SAMPLEPOSTAPI/auditgetmodel.dart';

class getauditservice{
int rescode =500;
static Future<auditgetmodelheader> getdata()async{
  try{
final responce=await http.get(Uri.parse('http://164.52.194.125:7089/api/Inv/v1/GetDisplayStockAudit?productserialnum=serialnumber'),
headers: {
  "Authorization":"bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbmNyeXB0ZWRDbGFpbXMiOiJtSmZ6WGFOMUR4ZlJvRnM5RGVzcGxmQWdwdUxsbm1FTmk4NThPUGI2QzB6MDEzYVlkVFVuYjFlWDVNd1A5cUwrRkRJelZxTHNFZlUxZnJPTnlEck1FdEZScVM4ZXlEMDgxR1hlT29LSUhzU0VYV0hJSlc2empoTStRdGNWUTB1R1FoMTloT3hmc1JEcGd5L25BN0poaXhSTjNFVDU0S2NpbzZ0YXFRWVU1SjUxeDBvQTdxcW1weGNIdEFFenhRRzR4NlUvWVV2bDUrc2lMNWsxUnlyM2c0M2tma0RVdkdrZ2M4S3h0SDF4L3Q1V3d2bVV6V0ljZmppSEJtcnVOb0RCSlZRU1EzSUpmTTBWd3NuWTV3WVpVU2tpaGFXV0ZVR0oyZ0VZMUJQQ2szSnVYSDIwanhmN3U4cjlHbk9VZHFYQyIsIm5iZiI6MTc2MDE1OTQxNCwiZXhwIjoxNzYwMTg4MjE0LCJpYXQiOjE3NjAxNTk0MTR9.LOMJGy_5C3aEVxboE6nn-PUjOB9NNsq839OOgFGm_uyqGKTejtDi3e-ktihoHEEdGBeKlsvlPp7-hkKExmFk3g"
}



);
 if (responce.statusCode == 200) {
return auditgetmodelheader.fromJson(json.decode(responce.body), responce.statusCode);
}else{
return auditgetmodelheader.execption(json.decode(responce.body), responce.statusCode);

}
  }catch(e){
return auditgetmodelheader.issues("${e.toString()}", 500);

  }
}
}