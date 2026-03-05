import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/ApprovalController/Approvalcontroller.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({super.key});

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ApprovalController>().init();
    });
  }
DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
      
    }
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log("didPop::$didPop");
        if (didPop) return;
        onbackpress();
      },
      child: Scaffold(
        backgroundColor:white,
        appBar:  AppBar(
            // centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: secondary,
            // leading: Icon(Icons.abc),
            title: Container(
              padding: EdgeInsets.symmetric(
                vertical: Screens.padingHeight(context)*0.01
              ),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                           Get.offAllNamed(ConstantRoutes.dashboard);

                            
                          });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Approval",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: white, fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
          ),
        body: Container(
          color: Colors.grey[200],
          width: Screens.width(context),
          padding: EdgeInsets.symmetric(
              horizontal: Screens.width(context) * 0.02,
              vertical: Screens.padingHeight(context) * 0.01),
          child: Column(
            children: [
               Container(
              // height: Screens.padingHeight(context) * 0.06,
              decoration: BoxDecoration(
                  color:Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                    onChanged: (v) { 
                      context
                          .read<ApprovalController>().Approvalfilterdetails
                          (v);
                    },
                    cursorColor: thirdcolor,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: secondary,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Screens.padingHeight(context)*0.01,),
              context.watch<ApprovalController>().isloading == true &&
                      context.read<ApprovalController>().exception == '' &&
                      context.read<ApprovalController>().getapproval.isEmpty
                  ? Center(child: CircularProgressIndicator(color: secondary,))
                  : context.watch<ApprovalController>().isloading == false &&
                          context.read<ApprovalController>().exception != '' &&
                          context.read<ApprovalController>().getapproval.isEmpty
                      ? Container(
                          child: Text(
                              "${context.read<ApprovalController>().exception}"),
                        )
                      :  context.read<ApprovalController>().Searchfiltergetapproval.isEmpty?
                       Container(
                              // height: Screens.padingHeight(context),
                              // width: Screens., 
                              child: Column(
                                children: [
                                   SizedBox(height: Screens.padingHeight(context)*0.1),
                                  Image.asset("Assets/error-file.png",
                                  height: Screens.padingHeight(context)*0.08,
                                  width: Screens.width(context)*0.4,
                                  ),
                                   SizedBox(height: Screens.padingHeight(context)*0.02),

                                  Text("No Data..!"),
                                ],
                              )): Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: context
                                  .read<ApprovalController>()
                                  .Searchfiltergetapproval
                                  .length,
                              itemBuilder: (contex, ind) {
                                return Container(
                                     padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context)*0.01,
                                  vertical: Screens.width(context)*0.01

                                ),
                                  child: InkWell(
                                    onTap: (){
                                      context.read<ApprovalController>().postmethiod(context,context
                                    .read<ApprovalController>()
                                    .Searchfiltergetapproval[ind]);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Screens.width(context) * 0.025,
                                          vertical:
                                              Screens.padingHeight(context) * 0.01),
                                              decoration: BoxDecoration(
                                                                        color: white,
                                    
                                    borderRadius: BorderRadius.circular(15),
                                      boxShadow: 
                                                                        [BoxShadow(
                                    color: Color.fromARGB(255, 239, 239, 239),
                                    blurRadius: 5,
                                    spreadRadius: 4
                                                                        )]           
                                                                        ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Item Code",
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.005,
                                          ),
                                          Container(
                                            child: Text(
                                              "${context.read<ApprovalController>().Searchfiltergetapproval[ind].ItemCode}",
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.01,
                                          ),
                                          Container(
                                            child: Text(
                                              "Item Name",
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13,
                                                      color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.005,
                                          ),
                                          Container(
                                            child: Text(
                                              "${context.read<ApprovalController>().Searchfiltergetapproval[ind].ItemName}",
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                               fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    Screens.width(context) * 0.3,
                                                child: Text(
                                                  "Serial No",
                                                  style: theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    Screens.width(context) * 0.3,
                                                alignment: Alignment.centerRight,

                                                child: Text(
                                                  "Catagory",
                                                  style: theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.005,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    Screens.width(context) * 0.4,

                                                child: Text(
                                                  "${context.read<ApprovalController>().Searchfiltergetapproval[ind].SerialNo}",
                                                  style: theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    Screens.width(context) * 0.45,
                                                alignment: Alignment.centerRight,

                                                child: Text(
                                                  "${context.read<ApprovalController>().Searchfiltergetapproval[ind].Category}",
                                                  style: theme.textTheme.bodyMedium!
                                                      .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Screens.padingHeight(context) *
                                                0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
            ],
          ),
        ),
      ),
    );
  }
}
