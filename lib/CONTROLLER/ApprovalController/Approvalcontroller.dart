import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/MODEL/getApprovalModel/getApprovalModel.dart';
import 'package:warehousemanagement/SERVICES/approvalApi/getapprovalApi.dart';
import 'package:warehousemanagement/SERVICES/approvalApi/postfinalApi.dart';

class ApprovalController extends ChangeNotifier {
  init() {
    clearAll();
    getinitialdata();
    notifyListeners();
  }

  postmethiod(BuildContext context, Getapprovalchild data) {
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Screens.width(context),
                    height: Screens.padingHeight(context) * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: thirdcolor,
                        borderRadius: BorderRadius.only(
                            // topLeft: Radius.circular(10),
                            // topRight:  Radius.circular(10),
                            )),
                    child: Text(
                      "Alert",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.02,
                  ),
                  Container(
                    child: Text(
                      "Do You want to accept the Approval ?",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: finalloading == true
                            ? () {}
                            : () {
                                postfinalApi(context, data);
                                notifyListeners();
                              },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: finalloading == true
                              ? SpinKitThreeBounce(
                                  size: Screens.width(context) * 0.05,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: Screens.width(context) * 0.2,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.thumb_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.02,
                  ),
                ],
              ),
            ),
          );
        });
  }

  bool? finalloading = false;
  postfinalApi(BuildContext context, Getapprovalchild data) async {
    finalloading = true;
    notifyListeners();
    await FinalApprovalApi.getData(data.ItemCode, data.SerialNo).then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 200) {
        finalloading = false;
        showdialogsave(context, "Assets/check.png", "Success",
            "Approved successfully..!!");
      } else if (value.stcode! >= 400 && value.stcode! <= 400) {
        finalloading = false;
        showdialogsave(context, "Assets/check.png", "Failed - 400",
            value.exception.toString());
        notifyListeners();
      } else {
        finalloading = false;
        showdialogsave(
            context, "Assets/check.png", "Failed - 500", 'Server not Connect');
        notifyListeners();
      }
    });
  }

  showdialogsave(
      BuildContext context, String? image, String title, String body) {
    showDialog(
        context: context,
        builder: (_) {
          final theme = Theme.of(context);
          return StatefulBuilder(builder: (context, setst) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: Screens.padingHeight(context) * 0.13,
                    width: Screens.width(context),
                    decoration: const BoxDecoration(
                        // color:Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Center(
                      child: Image.asset(
                        "$image", //Asset/check.png
                        height: Screens.padingHeight(context) * 0.1,
                        width: Screens.width(context) * 0.2,
                      ),
                    ),
                  ),
                  Container(
                    // height: Screens.padingHeight(context)*0.2,
                    padding: EdgeInsets.symmetric(
                        horizontal: Screens.width(context) * 0.01,
                        vertical: Screens.padingHeight(context) * 0.005),
                    child: Column(
                      children: [
                        title.contains("Success")
                            ? Text("transwer outward added successfully")
                            : Text(
                                title,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        title.contains("Success")
                            ? Text(
                                "Doc Number - $body",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.normal),
                              )
                            : Text(
                                body,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: thirdcolor),
                            onPressed: () {
                              setst(() {
                                if (title.contains("Success")) {
                                  Get.offAllNamed(ConstantRoutes.approval);
                                } else {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: const Text("ok"))
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  clearAll() {
    getapproval.clear();
    isloading = false;
    exception = '';
    notifyListeners();
  }

  bool isloading = false;
  String? exception = '';
  List<Getapprovalchild> getapproval = [];
  List<Getapprovalchild> Searchfiltergetapproval = [];
  Approvalfilterdetails(String v) {
    print('saearch :' + v!);
    if (v.isNotEmpty) {
      // isloading=true;

      Searchfiltergetapproval = getapproval
          .where((e) =>
              (e).ItemCode!.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).ItemName.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).SerialNo.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ) ||
              (e).Category.toString().toLowerCase().contains(
                    v.toLowerCase(),
                  ))
          .toList();

      notifyListeners();
    } else if (v.isEmpty) {
      Searchfiltergetapproval = getapproval;
      notifyListeners();
    }
  }

  getinitialdata() async {
    getapproval.clear();
    isloading = true;
    exception = '';
    notifyListeners();
    await GetApprovalApi.getData().then((value) {
      if (value.stcodee! >= 200 && value.stcodee! <= 210) {
        if (value.child != null && value.child!.isNotEmpty) {
          getapproval = value.child!;
          Searchfiltergetapproval = getapproval;
          isloading = false;
          exception = '';
          notifyListeners();
        } else if (value.child == null || value.child!.isEmpty) {
          isloading = false;
          exception = 'No data ..!!';
          Fluttertoast.showToast(
              msg: "No data ..!!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          notifyListeners();
        }
      } else if (value.stcodee! >= 400 && value.stcodee! <= 410) {
        isloading = false;
        exception = '${value.exception} ..!!';
        Fluttertoast.showToast(
            msg: "${value.exception} ..!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
      } else {
        isloading = false;
        exception = 'Server not connect';
        Fluttertoast.showToast(
            msg: "Server not connect",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
      }
    });
  }
}
