
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/Reportcontroller/reportctrl.dart';

class reportSecondscreen extends StatefulWidget {
  const reportSecondscreen({super.key});

  @override
  State<reportSecondscreen> createState() => _reportSecondscreenState();
}

class _reportSecondscreenState extends State<reportSecondscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.read<Reportctrl>().
    });
  }
   DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.report);
      
    }
    return Future.value(true);
  }
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log("didPop::$didPop");
        if (didPop) return;
        onbackpress();
      },
         child: Scaffold(
          
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
    appBar:      AppBar(
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
                           Get.offAllNamed(ConstantRoutes.report);

                            
                          });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Reports",
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
                vertical: Screens.padingHeight(context) * 0.01,
                horizontal: Screens.width(context) * 0.03),
                color: Colors.grey[200],
            child: Column(
              children: [
                 Container(
                      // height: Screens.padingHeight(context) * 0.06,
                      decoration: BoxDecoration(
            color:white, borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                onChanged: (v) { 
                 context
                          .read<Reportctrl>()
                          . SearchFiltereport(v);
                   
              },
              cursorColor: thirdcolor,
                        decoration: const InputDecoration(
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
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
              
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                context.read<Reportctrl>().secondpagereportlist !=
                        null
                    ? Container(
                        child: Text(
                          "Vendor Code : ${context.read<Reportctrl>().secondpagereportlist!.VendorCode}",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                context.read<Reportctrl>().secondpagereportlist !=
                        null
                    ? Container(
                        child: Text(
                          "Vendor Name : ${context.read<Reportctrl>().secondpagereportlist!.Vendor}",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                Expanded(
                    child:context
                            .watch<Reportctrl>()
                            .report2pageloading ==false?
                            Center(
                              child: Container(
                                child: CircularProgressIndicator(
                                  color: thirdcolor,
                                ),
                              ), 
                            ): context
                            .read<Reportctrl>()
                            .thirdpagereportlist
                            .isEmpty
                        ? Container(
                            child: const Center(child: Text("No data..!!")))
                        :   context
                            .read<Reportctrl>().searchfilterthirdpagereportlist.isEmpty? 
                           
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
                              )):  ListView.builder(
                            itemCount: context
                                .read<Reportctrl>()
                                .searchfilterthirdpagereportlist
                                .length,
                            itemBuilder: (c, i) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context)*0.01,
                                  vertical: Screens.width(context)*0.01

                                ),

                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: Screens.width(context) * 0.01,
                                      bottom: Screens.width(context) * 0.01),
                                  child: Container(
                                    
                                    width: Screens.width(context),
                                    padding: EdgeInsets.only(
                                        left: Screens.width(context) * 0.02,
                                        right:
                                            Screens.width(context) * 0.02,
                                        top: Screens.padingHeight(context) *
                                            0.02,
                                        bottom:
                                            Screens.padingHeight(context) *
                                                0.02),
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
                                    child: Container(
                                      width:
                                          Screens.width(context) * 0.6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Segment",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].Segment}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                           Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Doc Entry",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].DocEntry}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                         
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Item Code",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].itemcode}",
                                                    // "${grpDetailsFilter[i].ItemCode}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Item Name",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].ItemName}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Tax Code",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].TaxCode}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                          
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Qty",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].Qty}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                                    
                                          ),
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Price",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].Price}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Tax Code",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].TaxCode}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                           Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Tax Rate",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red, 
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].TaxRate}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                         SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "Sell Price",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].SellPrice}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                Screens.width(context) * 0.2,
                                            // color: Colors.amber,
                                            child: Text(
                                              "MRP",
                                              style: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                              Container(
                                                  width: Screens.width(
                                                          context) *
                                                      0.6,
                                                  //    color: Colors.red,
                                                  child: Text(
                                                    "${context.read<Reportctrl>().searchfilterthirdpagereportlist[i].MRP}",
                                                    // "${grpDetailsFilter[i].Dscription}",
                                                    style: theme.textTheme
                                                        .bodyMedium!
                                                        .copyWith(),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(
                                                        context) *
                                                    0.005,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                         
              ],
            ),
          ),
        ),
      ),
    );
  }
}   