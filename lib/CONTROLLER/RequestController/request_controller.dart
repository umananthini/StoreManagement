import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/MODEL/Requestmodel/request_model.dart';
import 'package:warehousemanagement/SERVICES/requestApi/requestListApi.dart';

class RequestController extends ChangeNotifier {

  void init()async{
   await fetchRequest();
  }

  showRequestPopup(String cardCode,String value,String id,String approvalSp,String rejectSp,BuildContext context){
          showDialog(
    context: context, 
    builder: (_){
      final theme =Theme.of(context);
      return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight:  Radius.circular(10),
                  )
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Screens.width(context),
              height: Screens.padingHeight(context)*0.06,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: thirdcolor,
                borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(10),
                  // topRight:  Radius.circular(10),
                )
        
              ),
           child: Text(
            "Alert",
           style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white
           ),),
            ),
            SizedBox(
              height: Screens.padingHeight(context)*0.02,
            ),
            Text("Do You want to accept the Request ?",style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                       ),),
            SizedBox(
              height: Screens.padingHeight(context)*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                 onTap: (){
                   getApproval(cardCode,value,id,approvalSp);
                 },
                  child:
                   Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                    ),
                    child:isApproval==true?
                        Center(
                          child: SpinKitThreeBounce(
                                  size: Screens.width(context) * 0.05,
                                  color: Colors.white,),
                        ):
                      
                     Icon(Icons.thumb_up,
                    color: Colors.white,
                    ),
        
                        
                  ),
                ),
                SizedBox(
                  width: Screens.width(context)*0.2,
                ),
                InkWell(
                  onTap: (){
                 getReject(cardCode,value,id,rejectSp);
                 
                  },
                  child: Container(
                   padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                    ),
                    child:isReject==true?
                        Center(
                          child: SpinKitThreeBounce(
                                  size: Screens.width(context) * 0.05,
                                  color: Colors.white,),
                        ):
                    
                    
                     Icon(Icons.thumb_down,
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(
              height: Screens.padingHeight(context)*0.02,
            ),
          ],
        ),

      );
    }
    );
  }

 List<RequestList> requestsData=[];
 String? error;
 String?exception;
 bool? isLoading=false;
  bool? isApproval=false;
   bool? isReject=false;

fetchRequest()async{
  requestsData.clear();
  isLoading=true;
  notifyListeners();
await RequestListApi.getData().then((value){
  if(value.stCode!>=200 && value.stCode!<=210){
requestsData=value.requests;
// print("requestsData:${value.response},${requestsData}");
 isLoading=false;
 error="";
 exception="";
notifyListeners();
  }
  else if (value.stCode! >= 400 && value.stCode! <= 410) {
    error=value.response;
     exception="";
     isLoading=false;
    notifyListeners();
  }
  else{
exception=value.exception!;
 error="";
 isLoading=false;
notifyListeners();
  }
 
});

}


getApproval(String cardCode,String value,String id,String sp,)async{
  isApproval=true;
  notifyListeners();
await RequestListApi.getApprovalData(cardCode, value, id, sp).then((value)async{
  if(value.stcode!>=200&& value.stcode!<=210){
    await fetchRequest();
    // Future.delayed(Duration(milliseconds: 005));
   Get.snackbar(
  "${value.response}",
  "",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.green,
  colorText: Colors.white,
  margin: const EdgeInsets.all(10),
);
 isApproval=false;
 

Get.back();


notifyListeners();
  }
  else{
  Get.snackbar(
  "${value.response}",
  "",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.red,
  colorText: Colors.white,
  margin: const EdgeInsets.all(10),
);
  isApproval=false;
Get.back();

notifyListeners();

  }
});
}


getReject(String cardCode,String value,String id,String sp,)async{
  isReject=true;
  notifyListeners();
await RequestListApi.getRejectData(cardCode, value, id, sp).then((value)async{
  if(value.stcode!>=200&& value.stcode!<=210){
    await fetchRequest();
   Get.snackbar(
  "${value.response}",
  "",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.green,
  colorText: Colors.white,
  margin: const EdgeInsets.all(10),
);
isReject=false;

Get.back();
notifyListeners();
  }
  else{
  Get.snackbar(
  "${value.response}",
  "",
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.red,
  colorText: Colors.white,
  margin: const EdgeInsets.all(10),
);
  isReject=false;
Get.back();

notifyListeners();

  }
});
}






}