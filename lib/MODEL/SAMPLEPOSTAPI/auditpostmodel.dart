
class Auditmodel{
int?docEntry;
String?branch;
String?auditDate;
String?itemCode;
String?itemName;
String?serialNum;
String?productSerialNum;
String?deviceCode;
String?scanTime;
String?traceId;


Auditmodel({
  required this.auditDate,
    required this.branch,
    required this.deviceCode,
    required this.docEntry,
    required this.itemCode,
    required this.itemName,
    required this.productSerialNum,
    required this.scanTime,
    required this.serialNum,
    required this.traceId

});
factory Auditmodel.fromJson(Map<String,dynamic>jsons){
  return Auditmodel(
    auditDate: jsons["auditDate"]??"",
     branch:  jsons["branch"]??"", 
     deviceCode:  jsons["deviceCode"]??"", 
     docEntry:  jsons["docEntry"]??0,
      itemCode:  jsons["itemCode"]??"", 
      itemName:  jsons["itemName"]??"",
       productSerialNum:  jsons["productSerialNum"]??"",
        scanTime:  jsons["scanTime"]??"", 
        serialNum:  jsons["serialNum"]??"", 
        traceId:  jsons["traceId"]??"");
}

}
Map<String,dynamic>toJson(){
  Map<String,dynamic> map={
    "docEntry": 4,
    "branch": "HYD04",
    "auditDate": "2025-10-10T09:30:00.000Z",
    "itemCode": "ITM1004",
    "itemName": "LG Refrigerator 260L",
    "serialNum": "SNLG260R998",
    "productSerialNum": "PRD-REF-260L-004",
    "deviceCode": "DV004",
    "scanTime": "2025-10-10T09:31:22.500Z",
    "traceId": "c7a13b60-8d46-4d8d-84a1-0c5678a5421f"
  };
  return map;
}