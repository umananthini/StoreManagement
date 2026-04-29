import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/TransferOutwardController/getoutwardctrl.dart';

class TransferOutwardScreen extends StatefulWidget {
  const TransferOutwardScreen({super.key});

  @override
  State<TransferOutwardScreen> createState() => _TransferOutwardScreenState();
}

class _TransferOutwardScreenState extends State<TransferOutwardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransferOutwardctrl>().init();
    });
  }
  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)){
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
      
    }
    return Future.value(true);
  }
 GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);

    return PopScope(
        canPop: false,
      onPopInvoked: (bool didPop) {
        log("didPop::$didPop");
        if (didPop) return;
        onbackpress();
      },
      child: Scaffold(
         appBar: AppBar(
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
                        "Transfer Outward",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: white, fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Screens.padingHeight(context)*0.01,
                vertical: Screens.width(context) * 0.01,
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                 
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // alignment: Alignment.center,
                            // height: Screens.padingHeight(context) * 0.05,
                            width: Screens.width(context) * 0.7,
                            // decoration: BoxDecoration(
                            // color: Colors.white,
                            // border: Border.all(
                            //     color: Color.fromARGB(255, 228, 228, 228)),
                            // borderRadius: BorderRadius.all(Radius.circular(5))),
                            child:  DropdownButtonFormField(
                                isDense: true,
                                // itemHeight: 10,
                                isExpanded: true,
                                value: context
                                    .read<TransferOutwardctrl>()
                                    .branchDropDown,
                                validator: (v) {
                                  if (v == null) {
                                    return "*Choose The Branch";
                                  }
                                  return null;
                                },
                               icon: context
                                    .read<TransferOutwardctrl>().BranchListloading==true? Container(
                                      height: Screens.padingHeight(context)*0.023,
                                      width: Screens.width(context)*0.045,

                                      child: CircularProgressIndicator(color: secondary,
                                      strokeWidth :3
                                      ),
                                    ) : Icon(Icons.arrow_drop_down),
                                decoration: const InputDecoration(
                               
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    suffixIconConstraints: BoxConstraints(
                                        maxHeight: 20, minWidth: 10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 228, 228, 228),
                                        ),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 228, 228, 228),
                                        ),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 228, 228, 228),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                hint: const Text(
                                  "Select branch",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 152, 152, 152),
                                      fontSize: 14),
                                ),
                                items: context
                                    .watch<TransferOutwardctrl>()
                                    .Branchlistdata
                                    .map((e) {
                                  return DropdownMenuItem(
                                      value: "${e.ToWhsCode}",
                                      child: Text(
                                        "${e.WhsName}",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: Colors.grey, fontSize: 13),
                                      ));
                                }).toList(),
                                onChanged: (val) {
                                  context
                                      .read<TransferOutwardctrl>()
                                      .branchDropDown = val.toString();
                                }),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: Screens.padingHeight(context) * 0.06,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirdcolor),
                                onPressed: () {
                                   if (formkey.currentState!.validate()) {
                                  context
                                      .read<TransferOutwardctrl>().searchfilteritemdetailslist.clear();
                                           context
                                      .read<TransferOutwardctrl>()
                                      .firstvalidate();

                                   }
                                 
                                },
                                child: const Icon(Icons.double_arrow)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                   context
                                  .watch<TransferOutwardctrl>()
                                  .finalOutwardlist
                                  .isEmpty?Container(): Container(
                    height: Screens.padingHeight(context) * 0.05,
                    decoration: BoxDecoration(
                         color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      cursorColor: thirdcolor,
                      onChanged: (v) {
                        context
                            .read<TransferOutwardctrl>()
                            .Outwardfilterdetails(v);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        
                         
                         
                        prefixIcon: Icon(
                          Icons.search,
                          color: primarycolor,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        errorBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Expanded(
                      child: context
                                  .watch<TransferOutwardctrl>()
                                  .outwardloading ==
                              true
                          ? SizedBox(
                              height: Screens.padingHeight(context) * 0.7,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: primarycolor,
                                ),
                              ),
                            )
                          : context
                                  .read<TransferOutwardctrl>()
                                  .searchfilteritemdetailslist
                                  .isEmpty?  Container(
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
                              )): SizedBox(
                                  height: Screens.padingHeight(context),
                                  width: Screens.width(context),
                                  // color: Colors.amber,
                                  child: ListView.builder(
                                      itemCount: context
                                          .read<TransferOutwardctrl>()
                                          .searchfilteritemdetailslist
                                          .length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            log("index::$index");
                                            context
                                                .read<TransferOutwardctrl>()
                                                .transnoclicked(context
                                                    .read<TransferOutwardctrl>()
                                                    .searchfilteritemdetailslist[index]
                                                    .TransNo
                                                    .toString());
                                          },
                                           child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Screens.padingHeight(context)*0.005,
                                      horizontal: Screens.width(context)*0.01

                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.02,
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.02),
                                       decoration:BoxDecoration(
                                      color: white,
                                    borderRadius: BorderRadius.circular(10),

                                         boxShadow: 
                                    [BoxShadow(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      blurRadius: 5,
                                      spreadRadius: 4
                                    )]                     
                                       ) ,
                                      // height: Screens.padingHeight(context)*0.3,
                                      width: Screens.width(context),
                                      child: Column(
                                        children: [
                                          Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            // color: Colors.amber,
                                      
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Container(
                                            
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[50],
                                      
                                            ),
                                            child: Icon(Icons.store_mall_directory,
                                            size: Screens.padingHeight(context)*0.05,),
                                          ),
                                          SizedBox(height: Screens.padingHeight(context)*0.02,),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: Screens.width(context)*0.005,
                                              vertical: Screens.padingHeight(context)*0.003
                                              ),
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.2,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                                    color: fourth
                                                    
                                                    ),
                                                    child: Text(context
                                                            .read<
                                                                TransferOutwardctrl>()
                                                            .searchfilteritemdetailslist[
                                                                index]
                                                            .TransNo
                                                            .toString()),
                                                  ),
                                            ],
                                          )
                                          ),
                                      
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              // color: Colors.amber,
                                              child:Column(
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.25,
                                                    // color: Colors.red,
                                                    child: Text(context
                                                            .read<
                                                                TransferOutwardctrl>()
                                                            .config
                                                            .alignDate1(context
                                                                .read<
                                                                    TransferOutwardctrl>()
                                                                .searchfilteritemdetailslist[
                                                                    index]
                                                                .TransDate
                                                                .toString())),
                                                  ),
                                                  Text("Trans Date",
                                                     style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: Colors.grey[500],
                                                fontSize: 14,
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.w400
                                                  ),
                                                  )
                                                ],
                                              ),
                                              
                                            ),
                                             Container(
                                                            
                                                            // color: Colors.amber,
                                                            height: Screens.padingHeight(context)*0.05,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                     Container(
                                                    height: Screens.padingHeight(context)*0.004,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                    Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                   Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                      Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                      Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                  
                                                   
                                                              ],
                                                            ),
                                                           ),
                                                            Container(
                                              // color: Colors.amber,
                                              child:Column(
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.25,
                                                    // color: Colors.red,
                                                    child:Text(context
                                                            .read<
                                                                TransferOutwardctrl>()
                                                            .searchfilteritemdetailslist[
                                                                index]
                                                            .ReqQty
                                                            .toString()),
                                                  ),
                                                  Text("Request Qty",
                                                     style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: Colors.grey[500],
                                                fontSize: 14,
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.w400
                                                  ),
                                                  ),
                                                  
                                                ],
                                              ),
                                              
                                            ),
                                            
                                            
                                          ],
                                        )
                                        ],
                                      ),
                                                 
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
