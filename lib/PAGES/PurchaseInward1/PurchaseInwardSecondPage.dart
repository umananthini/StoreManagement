import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class PurchaseInwSecond extends StatefulWidget {
  const PurchaseInwSecond({super.key});

  @override
  State<PurchaseInwSecond> createState() => _PurchaseInwSecondState();
}

class _PurchaseInwSecondState extends State<PurchaseInwSecond> {
  @override
  Future<void> Selecteddate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: thirdcolor, // header background color + selected date
              onPrimary: Colors.white, // text color on header
              onSurface: Colors.black, // default text color
            ),
            dialogBackgroundColor: Colors.white, // background of dialog
          ),
          child: child!, // keep the actual date picker
        );
      },
    );

    if (picked != null) {
      context.read<PurchaseInwardCtrl>().invoicedatecontroller.text =
          "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PurchaseInwardCtrl>().secondpageinit();
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      if (context.read<PurchaseInwardCtrl>().pageChanged == 1) {
        context.read<PurchaseInwardCtrl>().showdialogback(context);
        context.read<PurchaseInwardCtrl>().invoicepressed = false;

        return Future.value(false);
      } else if (context.read<PurchaseInwardCtrl>().pageChanged == 0) {
        Get.offAllNamed(ConstantRoutes.purchaseinwnew);
        context.read<PurchaseInwardCtrl>().invoicepressed = false;
        return Future.value(true);
      }
    }
    return Future.value(true);
  }

  FocusNode focusnode2 = FocusNode();
  
  FocusNode focusnode5 = FocusNode();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: grey,
        appBar: AppBar(
          // centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: secondary,
          // leading: Icon(Icons.abc),
          title: Container(
            padding: EdgeInsets.symmetric(
                vertical: Screens.padingHeight(context) * 0.01),
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            onbackpress();
                            context
                                .read<PurchaseInwardCtrl>()
                                .searchfilter1
                                .clear();
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                        )),
                    SizedBox(
                      width: Screens.width(context) * 0.015,
                    ),
                    Text(
                      "Purchase Inward",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ],
                ),
                //   InkWell(
                //     onTap: (){
                //       setState(() {

                //        context
                //           .read<PurchaseInwardCtrl>().issearchpressed2 = !  context
                //           .read<PurchaseInwardCtrl>().issearchpressed2;
                //       });
                //     },
                //     child:

                // context.read<PurchaseInwardCtrl>().pageChanged == 1?Container():    Container(
                //       padding: EdgeInsets.symmetric(
                //         vertical: Screens.padingHeight(context)*0.005,
                //         horizontal: Screens.width(context)*0.01

                //       ),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Color.fromARGB(31, 255, 255, 255)
                //       ),
                //       child: Icon(Icons.search,
                //       color: Colors.white,
                //       ),
                //     ),
                //   )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: context.read<PurchaseInwardCtrl>().pageController,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Screens.padingHeight(context) * 0.01,
                    horizontal: Screens.width(context) * 0.03),
                color: Colors.grey[200],
                child: Form(
                  key: context.read<PurchaseInwardCtrl>().formkey2,
                  child: Column(
                    children: [
                      context.watch<PurchaseInwardCtrl>().issearchpressed2 ==
                              false
                          ? Container()
                          : Container(
                              // height: Screens.padingHeight(context) * 0.06,
                              height: Screens.padingHeight(context) * 0.05,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: context
                                    .read<PurchaseInwardCtrl>()
                                    .searchfilter2,
                                onChanged: (v) {
                                  context
                                      .read<PurchaseInwardCtrl>()
                                      .filtersecondvendoritem(v);
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
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                      // Container(
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         enabledBorder: InputBorder.none,
                      //         focusedBorder: InputBorder.none,
                      //         isDense: true,
                      //         contentPadding: const EdgeInsets.symmetric(
                      //             horizontal: 15, vertical: 13),
                      //         filled: true,
                      //         fillColor: Colors.grey.shade100,
                      //         prefixIconConstraints:
                      //             const BoxConstraints(maxHeight: 30, minWidth: 20),
                      //         prefixIcon: Icon(
                      //           Icons.search,
                      //           color: thirdcolor,
                      //         ),
                      //         hintText: "Search here"),
                      //   ),
                      // ),
                      SizedBox(
                        height: Screens.padingHeight(context) * 0.01,
                      ),
                      context.read<PurchaseInwardCtrl>().secondpagevendorlist !=
                              null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      Screens.padingHeight(context) * 0.01,
                                  horizontal: Screens.width(context) * 0.01),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Screens.width(context) * 0.04),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: Colors.red,
                                          width: Screens.width(context) * 0.7,
                                          child: Text(
                                            "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.Vendor}",
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 15,
                                                    color: Colors.grey[500]),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              Screens.padingHeight(context) *
                                                  0.01,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // color: Colors.amber,
                                              // width: Screens.width(context)*0.2,
                                              child: Text(
                                                "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.DocNum}",
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                  fontSize: 14,
                                                  //  color: Colors.grey[500]
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: Screens.width(context) *
                                                  0.015,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.02,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.004,
                                                    width:
                                                        Screens.width(context) *
                                                            0.002,
                                                    color: const Color.fromARGB(
                                                        255, 183, 183, 183),
                                                  ),
                                                  Container(
                                                    height:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.005,
                                                    width:
                                                        Screens.width(context) *
                                                            0.002,
                                                    color: const Color.fromARGB(
                                                        255, 183, 183, 183),
                                                  ),
                                                  Container(
                                                    height:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.005,
                                                    width:
                                                        Screens.width(context) *
                                                            0.002,
                                                    color: const Color.fromARGB(
                                                        255, 183, 183, 183),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Screens.width(context) *
                                                  0.015,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              // width: Screens.width(context)*0.2,
                                              child: Text(
                                                "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.VendorCode}",
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                  fontSize: 14,
                                                  //  color: Colors.grey[500]
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: Screens.padingHeight(context) * 0.005,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Screens.width(context) * 0.02),
                        height: Screens.padingHeight(context) * 0.05,
                        width: Screens.width(context),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invoice Details",
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey[500]),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  context
                                          .read<PurchaseInwardCtrl>()
                                          .invoicepressed =
                                      !context
                                          .read<PurchaseInwardCtrl>()
                                          .invoicepressed;
                                });
                              },
                              child: Icon(
                                context
                                            .watch<PurchaseInwardCtrl>()
                                            .invoicepressed ==
                                        false
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: secondary,
                              ),
                            )
                          ],
                        ),
                      ),
                      context.watch<PurchaseInwardCtrl>().invoicepressed ==
                              false
                          ? Container()
                          : Container(
                              // height: Screens.padingHeight(context)*0.3,

                              padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context) * 0.02,
                                  vertical:
                                      Screens.padingHeight(context) * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: Screens.width(context) * 0.4,
                                        child: TextFormField(
                                          readOnly: true,
                                          onTap: () {
                                            setState(() {
                                              Selecteddate();
                                            });
                                          },
                                          controller: context
                                              .read<PurchaseInwardCtrl>()
                                              .invoicedatecontroller,
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return "*Invoice Date Required";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 12),
                                            labelText: "Invoice Date",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: Screens.width(context) * 0.4,
                                        child: TextFormField(
                                          controller: context
                                              .read<PurchaseInwardCtrl>()
                                              .invoicenumcontroller,
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return "*Invoice Num Required";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 12),
                                            // hintText: "hhh",
                                            labelText: "Invoice Num",
                                            // labelStyle: theme.textTheme.bodyMedium!.copyWith(
                                            //   color: thirdcolor
                                            // ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //  SizedBox(height: Screens.padingHeight(context)*0.01,),

                                  SizedBox(
                                    height:
                                        Screens.padingHeight(context) * 0.01,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      controller: context
                                          .read<PurchaseInwardCtrl>()
                                          .commentcontroller,
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return "*Comments Required";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 12),
                                        labelText: "Comments",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Screens.padingHeight(context) * 0.01,
                                  ),
                                ],
                              ),
                            ),

                      // context.read<PurchaseInwardCtrl>().secondpagevendorlist !=
                      //         null
                      //     ? Container(
                      //       color: Colors.amber,
                      //         child: Text(
                      //           "Vendor Code : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.VendorCode}",
                      //           style: theme.textTheme.bodyMedium!
                      //               .copyWith(fontWeight: FontWeight.bold),
                      //         ),
                      //       )
                      //     : Container(),
                      // SizedBox(
                      //   height: Screens.padingHeight(context) * 0.01,
                      // ),
                      // context.read<PurchaseInwardCtrl>().secondpagevendorlist !=
                      //         null
                      //     ? Container(
                      //         child: Text(
                      //           "Vendor Name : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.Vendor}",
                      //           style: theme.textTheme.bodyMedium!
                      //               .copyWith(fontWeight: FontWeight.bold),
                      //         ),
                      //       )
                      //     : Container(),
                      SizedBox(
                        height: Screens.padingHeight(context) * 0.01,
                      ),
                      Expanded(
                          child: context
                                      .watch<PurchaseInwardCtrl>()
                                      .secondpageloading ==
                                  true
                              ? Center(
                                  child: Container(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : context
                                      .read<PurchaseInwardCtrl>()
                                      .filtersecondvendoritemlist
                                      .isEmpty
                                  ? Container(
                                      // height: Screens.padingHeight(context),
                                      // width: Screens.,
                                      child: Column(
                                      children: [
                                        SizedBox(
                                            height:
                                                Screens.padingHeight(context) *
                                                    0.1),
                                        Image.asset(
                                          "Assets/error-file.png",
                                          height:
                                              Screens.padingHeight(context) *
                                                  0.08,
                                          width: Screens.width(context) * 0.4,
                                        ),
                                        SizedBox(
                                            height:
                                                Screens.padingHeight(context) *
                                                    0.02),
                                        Text("No Data..!"),
                                      ],
                                    ))
                                  : ListView.builder(
                                      itemCount: context
                                          .read<PurchaseInwardCtrl>()
                                          .filtersecondvendoritemlist
                                          .length,
                                      itemBuilder: (c, i) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                              top: Screens.width(context) *
                                                  0.005,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .thirdindex = i;
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .ACSerial = false;
                                                     context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      . quantityEnable=false;
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .scancontroller1
                                                      .clear();
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .scancontroller2
                                                      .clear();

                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .dataget(context);

                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .thirdvendoritemlist = null;
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .thirdvendoritemlist = context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .filtersecondvendoritemlist[
                                                      i];
                                                });

                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .pageController
                                                    .animateToPage(
                                                        ++context
                                                            .read<
                                                                PurchaseInwardCtrl>()
                                                            .pageChanged,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    250),
                                                        curve: Curves.bounceIn);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      Screens.padingHeight(
                                                              context) *
                                                          0.005,
                                                  horizontal:
                                                      Screens.width(context) *
                                                          0.005,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: Screens.width(
                                                              context) *
                                                          0.02,
                                                      vertical:
                                                          Screens.padingHeight(
                                                                  context) *
                                                              0.02),
                                                  decoration: BoxDecoration(
                                                      color: ListViewcontainer,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    239,
                                                                    239,
                                                                    239),
                                                            blurRadius: 5,
                                                            spreadRadius: 4)
                                                      ]),
                                                  // height: Screens.padingHeight(context)*0.3,
                                                  width: Screens.width(context),

                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.9,
                                                                //  color: Colors.red,
                                                                child: Text(
                                                                  "${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].itemcode}",
                                                                  // "${grpDetailsFilter[i].ItemCode}",
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.grey[500]),
                                                                )),
                                                            SizedBox(
                                                                height: Screens
                                                                        .padingHeight(
                                                                            context) *
                                                                    0.01),
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.9,
                                                                //  color: Colors.red,
                                                                child: Text(
                                                                  "${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].ItemName}",
                                                                  // "${grpDetailsFilter[i].Dscription}",
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                Screens.width(
                                                                        context) *
                                                                    0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.6,
                                                                //  color: Colors.red,
                                                                child:
                                                                    Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "Quantity :",
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyMedium!
                                                                            .copyWith(
                                                                                color: Colors.grey[500],
                                                                                fontSize: 14),
                                                                      ),
                                                                      Text(
                                                                        " ${context.read<PurchaseInwardCtrl>().getqty == null || context.read<PurchaseInwardCtrl>().getqty.length == 0 || context.read<PurchaseInwardCtrl>().getqty.isEmpty ? '0' : context.read<PurchaseInwardCtrl>().getqty[i]}/${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].Qty}",
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyMedium!
                                                                            .copyWith(fontSize: 14),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )),
                                                            CircleAvatar(
                                                              radius: Screens.width(
                                                                      context) *
                                                                  0.035,
                                                              backgroundColor:
                                                                  thirdcolor,
                                                              child: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_right_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                      })),

                      SizedBox(
                        height: Screens.padingHeight(context) * 0.01,
                      ),

                      Container(
                        width: Screens.width(context),
                        height: Screens.padingHeight(context) * 0.06,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: thirdcolor),
                            onPressed: context
                                        .watch<PurchaseInwardCtrl>()
                                        .saveenablebutton ==
                                    false
                                // context
                                //             .watch<inwardcontroller>()
                                //             .grpTotal !=
                                //         context
                                //             .read<inwardcontroller>()
                                //             .getqty
                                ? null
                                : context
                                            .watch<PurchaseInwardCtrl>()
                                            .finallodaing ==
                                        true
                                    ? null
                                    : () {
                                        if (context
                                                .read<PurchaseInwardCtrl>()
                                                .formkey2
                                                .currentState!
                                                .validate() &&
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .invoicedatecontroller
                                                .text
                                                .isNotEmpty &&
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .invoicenumcontroller
                                                .text
                                                .isNotEmpty &&
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .commentcontroller
                                                .text
                                                .isNotEmpty) {
                                          context
                                              .read<PurchaseInwardCtrl>()
                                              .savefinal(context);
                                        } else {
                                          setState(() {
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .showtoastInw();
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .invoicepressed = true;
                                          });
                                        }
                                      },
                            child: context
                                        .watch<PurchaseInwardCtrl>()
                                        .finallodaing ==
                                    false
                                ? const Text("Save")
                                : SpinKitThreeBounce(
                                    size: Screens.width(context) * 0.05,
                                    color: Colors.white,
                                  )),
                      )
                    ],
                  ),
                ),
              ),
              context.read<PurchaseInwardCtrl>().thirdvendoritemlist == null
                  ? Container()
                  : Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.symmetric(
                          horizontal: Screens.width(context) * 0.03,
                          vertical: Screens.padingHeight(context) * 0.02),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Screens.width(context) * 0.01,
                              vertical: Screens.padingHeight(context) * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          Screens.padingHeight(context) * 0.01,
                                      horizontal:
                                          Screens.width(context) * 0.01),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[50],
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          size: 40,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Screens.width(context) * 0.04),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                // color: Colors.red,
                                                width: Screens.width(context) *
                                                    0.7,
                                                child: context
                                                            .read<
                                                                PurchaseInwardCtrl>()
                                                            .secondpagevendorlist !=
                                                        null
                                                    ? Text(
                                                        "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.Vendor}",
                                                        style: theme.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey[500]),
                                                      )
                                                    : Container()),
                                            SizedBox(
                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.01,
                                            ),
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.amber,
                                                  // width: Screens.width(context)*0.2,
                                                  child: Text(
                                                    "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.DocNum}",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                      fontSize: 14,
                                                      //  color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Screens.width(context) *
                                                          0.015,
                                                ),
                                                Container(
                                                  // color: Colors.amber,
                                                  height: Screens.padingHeight(
                                                          context) *
                                                      0.02,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.004,
                                                        width: Screens.width(
                                                                context) *
                                                            0.002,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 183, 183, 183),
                                                      ),
                                                      Container(
                                                        height: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.005,
                                                        width: Screens.width(
                                                                context) *
                                                            0.002,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 183, 183, 183),
                                                      ),
                                                      Container(
                                                        height: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.005,
                                                        width: Screens.width(
                                                                context) *
                                                            0.002,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 183, 183, 183),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Screens.width(context) *
                                                          0.015,
                                                ),
                                                Container(
                                                    // color: Colors.amber,
                                                    // width: Screens.width(context)*0.2,
                                                    child: context
                                                                .read<
                                                                    PurchaseInwardCtrl>()
                                                                .secondpagevendorlist !=
                                                            null
                                                        ? Text(
                                                            "${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.VendorCode}",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                              fontSize: 14,
                                                              //  color: Colors.grey[500]
                                                            ),
                                                          )
                                                        : Container()),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        // color: Colors.red,
                                        width: Screens.width(context) * 0.6,
                                        child: context
                                                    .read<PurchaseInwardCtrl>()
                                                    .thirdvendoritemlist !=
                                                null
                                            ? Text(
                                                " ${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.itemcode}",
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color:
                                                            Colors.grey[500]),
                                              )
                                            : Container()),
                                    Container(
                                        child: Row(
                                      children: [
                                        Text(
                                          "Quantita :${context
                                                    .read<PurchaseInwardCtrl>()
                                                    .thirdvendoritemlist!
                                                    .u_category}",
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey[500]),
                                        ),
                                        context
                                                    .watch<PurchaseInwardCtrl>()
                                                    .thirdvendoritemlist !=
                                                null
                                            ? Text(
                                                "${context.read<PurchaseInwardCtrl>().ScannedQty()}/${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.Qty!}")
                                            : Container(),
                                      ],
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: Screens.padingHeight(context) * 0.02,
                                ),
                                Container(
                                  width: Screens.width(context),
                                  height: Screens.padingHeight(context) * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(05),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: Screens.width(context) * 0.02,
                                        ),
                                        alignment: Alignment.center,
                                        width: Screens.width(context) * 0.75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: Colors.grey[200],
                                        ),
                                        child: TextFormField(
                                          controller: context
                                              .read<PurchaseInwardCtrl>()
                                              .scancontroller1,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Required *";
                                            }

                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Scan Serial Number1',
                                              hintStyle: theme
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontSize: 15,
                                                      color: Colors.grey[500]),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical:
                                                          Screens.padingHeight(
                                                                  context) *
                                                              0.01,
                                                      horizontal: Screens.width(
                                                              context) *
                                                          0.01),
                                              border: InputBorder.none),
                                          onEditingComplete: () {
                                            context
                                                    .read<PurchaseInwardCtrl>()
                                                    .scanedvalueee1 =
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .scancontroller1
                                                    .text;
                                            if (context
                                                    .read<PurchaseInwardCtrl>()
                                                    .thirdvendoritemlist!
                                                    .u_category ==
                                                "AC") {
                                              setState(() {
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .ACSerial = true;
                                                Future.delayed(
                                                    Duration(milliseconds: 100),
                                                    () {
                                                  FocusScope.of(context)
                                                      .unfocus();

                                                  FocusScope.of(context)
                                                      .requestFocus(focusnode2);
                                                });
                                              });
                                            } else {
                                              if (context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .thirdvendoritemlist!
                                                      .manageBy
                                                      ?.toLowerCase()
                                                      .toString() ==
                                                  "b") {
                                                setState(() {
                                                  print(
                                                      ">>>>>>>>>>>>${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.manageBy}");
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .quantityEnable = true;
                                                      context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .quantitycontroller
                                                      .text = "1";
                                                    
                                                   Future.delayed(Duration(milliseconds: 300),(){
                                                     FocusScope.of(context)
                                                      .unfocus();
                                                       FocusScope.of(context).requestFocus(focusnode5);
                                         
                                                  });
                                                
                                                });
                                                
                                                              } else {
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .afterserialscanned(
                                                      context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .scanedvalueee1
                                                          .toString(),
                                                      "",
                                                      context,
                                                    );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<PurchaseInwardCtrl>()
                                                .scanedvalueee1 = null;
                                            QRscannerState
                                                .purchasedetailsscan1 = true;
                                          });

                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const QRscanner()))
                                              .then((value) {
                                            context
                                                    .read<PurchaseInwardCtrl>()
                                                    .scancontroller1
                                                    .text =
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .scanedvalueee1
                                                    .toString();

                                            if (context
                                                    .read<PurchaseInwardCtrl>()
                                                    .thirdvendoritemlist!
                                                    .u_category ==
                                                "AC") {
                                              setState(() {
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .ACSerial = true;
                                                Future.delayed(
                                                    Duration(milliseconds: 100),
                                                    () {
                                                  FocusScope.of(context)
                                                      .unfocus();

                                                  FocusScope.of(context)
                                                      .requestFocus(focusnode2);
                                                });
                                              });
                                            } else {
                                              if (context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .thirdvendoritemlist!
                                                      .manageBy
                                                      ?.toLowerCase()
                                                      .toString() ==
                                                  "b") {
                                                setState(() {
                                                  print(
                                                      ">>>>>>>>>>>>${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.manageBy}");
                                                  setState(() {
                                                    context
                                                        .read<
                                                            PurchaseInwardCtrl>()
                                                        .quantityEnable = true;
                                                   
                                                      context
                                                        .read<
                                                            PurchaseInwardCtrl>()
                                                        .quantitycontroller
                                                        .text = "1";
                                                         Future.delayed(Duration(milliseconds: 300),(){
                                                     FocusScope.of(context)
                                                      .unfocus();
                                                       FocusScope.of(context).requestFocus(focusnode5);
                                         
                                                  });
                                                        
                                                          //  FocusScope.of(context).requestFocus(focusnode5);
                                                   
                                                  });
                                                });
                                              } else {
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .afterserialscanned(
                                                        context
                                                            .read<
                                                                PurchaseInwardCtrl>()
                                                            .scanedvalueee1
                                                            .toString(),
                                                        "",
                                                        context);
                                              }
                                            }
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Screens.width(context) *
                                                        0.018,
                                                vertical: Screens.padingHeight(
                                                        context) *
                                                    0.01),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: secondary,
                                            ),
                                            child: Icon(
                                              Icons.qr_code,
                                              color: white,
                                              size: 30,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                context
                                            .watch<PurchaseInwardCtrl>()
                                            .quantityEnable ==
                                        false
                                    ? SizedBox()
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                Screens.padingHeight(context) *
                                                    0.02,
                                          ),
                                          IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    left:
                                                        Screens.width(context) *
                                                            0.02,
                                                  ),
                                                  alignment: Alignment.center,
                                                 width: Screens.width(context) * 0.75,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: Colors.grey[200],
                                                  ),
                                                  child: TextFormField(
                                                    focusNode: focusnode5,
                                                    controller: context
                                                        .read<
                                                            PurchaseInwardCtrl>()
                                                        .quantitycontroller,
                                                    // validator: (value) {
                                                    //   if (value!.isEmpty) {
                                                    //     return "Required *";
                                                    //   }

                                                    //   return null;
                                                    // },
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            'Enter Quantity',
                                                        labelStyle: theme
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey[500]),
                                                        contentPadding: EdgeInsets.symmetric(
                                                            vertical: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.01,
                                                            horizontal:
                                                                Screens.width(
                                                                        context) *
                                                                    0.01),
                                                        border:
                                                            InputBorder.none),
                                                    onEditingComplete: () {},
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .afterserialscanned(
                                                            context
                                                                .read<
                                                                    PurchaseInwardCtrl>()
                                                                .scanedvalueee1
                                                                .toString(),
                                                            "",
                                                            context,
                                                          );
                                                    });
                                                  },
                                                  child: Container(
                                                       padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    Screens.width(context) *
                                                        0.018,
                                                vertical: Screens.padingHeight(
                                                        context) *
                                                    0.01),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: secondary,
                                            ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Icon(
                                                        Icons
                                                            .double_arrow_sharp,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                SizedBox(
                                  height: Screens.padingHeight(context) * 0.02,
                                ),
                                context.watch<PurchaseInwardCtrl>().ACSerial ==
                                        true
                                    ? Container(
                                        width: Screens.width(context),
                                        height: Screens.padingHeight(context) *
                                            0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(05),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                left: Screens.width(context) *
                                                    0.02,
                                              ),
                                              alignment: Alignment.center,
                                              width:
                                                  Screens.width(context) * 0.75,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                color: Colors.grey[200],
                                              ),
                                              child: TextFormField(
                                                controller: context
                                                    .read<PurchaseInwardCtrl>()
                                                    .scancontroller2,
                                                focusNode: focusnode2,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Required Scan Serial Number 2*";
                                                  }

                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Scan Serial Number 2',
                                                    hintStyle: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            fontSize: 15,
                                                            color: Colors
                                                                .grey[500]),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.01,
                                                            horizontal:
                                                                Screens.width(
                                                                        context) *
                                                                    0.01),
                                                    border: InputBorder.none),
                                                onEditingComplete: () {
                                                  context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .scanedvalueee2 =
                                                      context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .scancontroller2
                                                          .text;
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .afterserialscanned(
                                                          context
                                                              .read<
                                                                  PurchaseInwardCtrl>()
                                                              .scancontroller1
                                                              .text
                                                              .toString(),
                                                          context
                                                              .read<
                                                                  PurchaseInwardCtrl>()
                                                              .scancontroller2
                                                              .text
                                                              .toString(),
                                                          context);
                                                },
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .scanedvalueee2 = null;
                                                  QRscannerState
                                                          .purchasedetailsscan2 =
                                                      true;
                                                });

                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const QRscanner()))
                                                    .then((value) {
                                                  context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .scancontroller2
                                                          .text =
                                                      context
                                                          .read<
                                                              PurchaseInwardCtrl>()
                                                          .scanedvalueee2
                                                          .toString();
                                                  context
                                                      .read<
                                                          PurchaseInwardCtrl>()
                                                      .afterserialscanned(
                                                          context
                                                              .read<
                                                                  PurchaseInwardCtrl>()
                                                              .scancontroller1
                                                              .text
                                                              .toString(),
                                                          context
                                                              .read<
                                                                  PurchaseInwardCtrl>()
                                                              .scancontroller2
                                                              .text
                                                              .toString(),
                                                          context);
                                                });
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: Screens.width(
                                                              context) *
                                                          0.018,
                                                      vertical:
                                                          Screens.padingHeight(
                                                                  context) *
                                                              0.01),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: secondary,
                                                  ),
                                                  child: Icon(
                                                    Icons.qr_code,
                                                    color: white,
                                                    size: 30,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.01,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context) * 0.01,
                                  vertical:
                                      Screens.padingHeight(context) * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: white,
                              ),
                              height: Screens.padingHeight(context) * 0.5,
                              width: Screens.width(context),
                              child: ListView.builder(
                                itemCount: context
                                    .watch<PurchaseInwardCtrl>()
                                    .DBdata
                                    .length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          Screens.padingHeight(context) * 0.005,
                                      horizontal: Screens.width(context) * 0.02,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.02,
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.01),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 239, 239, 239),
                                              blurRadius: 5,
                                              spreadRadius: 4)
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: white,
                                        //                  boxShadow: [
                                        //   BoxShadow(
                                        //     color:fourthcolor,
                                        //     blurRadius: 4,
                                        //     spreadRadius:0.5
                                        //   )
                                        // ]
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: Screens.width(context) * 0.4,
                                            // height: Screens.padingHeight(context)*0.01,
                                            // color: Colors.amber,

                                            // decoration: BoxDecoration(),
                                            child: Text(
                                              "${context.read<PurchaseInwardCtrl>().DBdata[index].manufacturerSerialNumber.toString()} / ${context.read<PurchaseInwardCtrl>().DBdata[index].internalSerialNumber.toString()}",
                                              // textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            width: Screens.width(context) * 0.1,
                                            // color: Color.fromARGB(255, 7, 65, 255),

                                            child: Text(context
                                                .read<PurchaseInwardCtrl>()
                                                .DBdata[index]
                                                .scannedqty
                                                .toString()),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                context
                                                    .read<PurchaseInwardCtrl>()
                                                    .deletedata(index);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screens.padingHeight(context) * 0.01,
                          ),
                          Container(
                            width: Screens.width(context),
                            height: Screens.padingHeight(context) * 0.06,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirdcolor),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<PurchaseInwardCtrl>()
                                      .savedbinw();
                                },
                                child: const Text("Save And Back")),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
