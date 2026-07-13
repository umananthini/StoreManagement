import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/TransferOutwardController/getoutwardctrl.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

import '../../CONSTANT/constantrouts.dart';

class TransOutsecondpage extends StatefulWidget {
  const TransOutsecondpage({super.key});

  @override
  State<TransOutsecondpage> createState() => _TransOutsecondpageState();
}

class _TransOutsecondpageState extends State<TransOutsecondpage> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransferOutwardctrl>().secondpageint();
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      if (context.read<TransferOutwardctrl>().pageChanged == 1) {
        // getQty.clear();
        // getItemsQty();
        // getAllQuantity();
        // if(context.read<inwardcontroller>().isPressed==false){
        context.read<TransferOutwardctrl>().showdialogback(context);
        // return Future.value(false);
        //       }

        // context.read<inwardcontroller>().pageController.animateToPage(
        //     --context.read<inwardcontroller>().pageChanged,
        //     duration: Duration(milliseconds: 250),
        //     curve: Curves.bounceIn);
        // data.clear();
        // mycontroller[0].text = '';
        // mycontroller[1].clear();
        // serialScannedData = '';
        return Future.value(true);
      } else if (context.read<TransferOutwardctrl>().pageChanged == 0) {
        Get.offAllNamed(ConstantRoutes.transferoutward);
        return Future.value(true);
      }
    }
    return Future.value(true);
  }

  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
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
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                        )),
                    SizedBox(
                      width: Screens.width(context) * 0.015,
                    ),
                    Text(
                      "Transfer Outward",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ],
                ),
                Text(
                  'Version: ${"${ConstantValues.versionNum}"}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[150],
        body: SafeArea(
            child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: context.read<TransferOutwardctrl>().pageController,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Screens.width(context) * 0.03,
                  vertical: Screens.padingHeight(context) * 0.02),
              child: Form(
                key: formkey2,
                child: Column(
                  children: [
                    //          Container(
                    //   // height: Screens.padingHeight(context) * 0.06,
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                    //   child: TextFormField(
                    //           onChanged: (v) {
                    //           context
                    //               .read<TransferOutwardctrl>().secondOutwardfilterdetails
                    //               (v);
                    //         },
                    //         cursorColor: thirdcolor,
                    //     decoration: const InputDecoration(
                    //       contentPadding: EdgeInsets.all(0),
                    //       hintText: "Search",
                    //       hintStyle: TextStyle(color: Colors.grey),
                    //       prefixIcon: Icon(
                    //         Icons.search,
                    //         color: primarycolor,
                    //       ),
                    //       border: OutlineInputBorder(borderSide: BorderSide.none),
                    //       focusedBorder:
                    //           OutlineInputBorder(borderSide: BorderSide.none),
                    //       enabledBorder:
                    //           OutlineInputBorder(borderSide: BorderSide.none),
                    //       errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    //     ),
                    //   ),
                    // ),

                    // Container(

                    //   child: TextFormField(
                    //       onChanged: (v) {
                    //   context
                    //       .read<TransferOutwardctrl>().secondOutwardfilterdetails
                    //       (v);
                    // },
                    //     cursorColor: primarycolor,
                    //     decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         focusedBorder: InputBorder.none,
                    //         isDense: true,
                    //         contentPadding: const EdgeInsets.symmetric(
                    //             horizontal: 15, vertical: 17),
                    //         filled: true,
                    //         fillColor: Colors.grey.shade100,
                    //         prefixIconConstraints: const BoxConstraints(
                    //             maxHeight: 30, minWidth: 20),

                    //         hintText: "Search here"),
                    //   ),
                    // ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    context.read<TransferOutwardctrl>().selectedtransno2 !=
                                null &&
                            context
                                .read<TransferOutwardctrl>()
                                .selectedtransno2!
                                .isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "TransNo :",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color:
                                          const Color.fromARGB(255, 93, 93, 93),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    context
                                        .read<TransferOutwardctrl>()
                                        .selectedtransno2
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.02,
                    ),
                    Expanded(
                        child: context
                                    .watch<TransferOutwardctrl>()
                                    .itempageloading ==
                                true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : context
                                    .read<TransferOutwardctrl>()
                                    .itemdetailslist
                                    .isEmpty
                                ? const Center(
                                    child: Text("No data..!"),
                                  )
                                : context
                                        .read<TransferOutwardctrl>()
                                        .searchfilterseconditemdetailslist
                                        .isEmpty
                                    ? Container(
                                        // height: Screens.padingHeight(context),
                                        // width: Screens.,
                                        child: Column(
                                        children: [
                                          SizedBox(
                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.1),
                                          Image.asset(
                                            "Assets/error-file.png",
                                            height:
                                                Screens.padingHeight(context) *
                                                    0.08,
                                            width: Screens.width(context) * 0.4,
                                          ),
                                          SizedBox(
                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.02),
                                          Text("No Data..!"),
                                        ],
                                      ))
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: context
                                            .read<TransferOutwardctrl>()
                                            .searchfilterseconditemdetailslist
                                            .length,
                                        itemBuilder: (context, ind) {
                                          return InkWell(
                                              onTap: () async {
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .thirdindex = null;
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .thirdOutwarditems = null;
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .thirdindex = ind;
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .thirdOutwarditems = context
                                                        .read<TransferOutwardctrl>()
                                                        .searchfilterseconditemdetailslist[
                                                    ind];

                                                // await  context
                                                //       .read<TransferOutwardctrl>()
                                                //       .dataget(context);
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .Thirdpageclicked(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.005,
                                                    horizontal:
                                                        Screens.width(context) *
                                                            0.01),
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
                                                      color: white,
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
                                                      Column(
                                                        children: [
                                                          Container(
                                                            // color: Colors.amber,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: Screens.width(
                                                                            context) *
                                                                        0.9,
                                                                    //  color: Colors.red,
                                                                    child: Text(
                                                                      "${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ItemCode}",
                                                                      // "${grpDetailsFilter[i].ItemCode}",
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                              color: Colors.grey[500]),
                                                                    )),
                                                                SizedBox(
                                                                    height: Screens.padingHeight(
                                                                            context) *
                                                                        0.01),
                                                                Container(
                                                                    // color: Colors.amber,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: Screens.width(
                                                                            context) *
                                                                        0.9,
                                                                    //  color: Colors.red,
                                                                    child: Text(
                                                                      "${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ItemDetails}",
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
                                                            // color: Colors.red,
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
                                                                    width: Screens.width(
                                                                            context) *
                                                                        0.6,
                                                                    //  color: Colors.red,
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            "Quantity :",
                                                                            style:
                                                                                theme.textTheme.bodyMedium!.copyWith(color: Colors.grey[500], fontSize: 14),
                                                                          ),
                                                                          Text(
                                                                            "${context.read<TransferOutwardctrl>().getqty.length == 0 || context.read<TransferOutwardctrl>().getqty.isEmpty ? '0' : context.read<TransferOutwardctrl>().getqty[ind]}/${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ReqQty}",
                                                                            style:
                                                                                theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                                CircleAvatar(
                                                                  radius: Screens
                                                                          .width(
                                                                              context) *
                                                                      0.035,
                                                                  backgroundColor:
                                                                      thirdcolor,
                                                                  child:
                                                                      const Icon(
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
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        })),
                    TextFormField(
                      cursorColor: primarycolor,
                      controller: context
                          .read<TransferOutwardctrl>()
                          .commentscontroller,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "*Remarks Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        labelText: "Remarks",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    SizedBox(
                      width: Screens.width(context),
                      height: Screens.padingHeight(context) * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: thirdcolor),
                          onPressed: context
                                      .watch<TransferOutwardctrl>()
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
                                          .watch<TransferOutwardctrl>()
                                          .finallodaing ==
                                      true
                                  ? null
                                  : () {
                                      if (formkey2.currentState!.validate()) {
                                        context
                                            .read<TransferOutwardctrl>()
                                            .savefinal(context);
                                      }
                                    },
                          child: context
                                      .watch<TransferOutwardctrl>()
                                      .finallodaing ==
                                  false
                              ? const Text("Save")
                              : SpinKitThreeBounce(
                                  size: Screens.width(context) * 0.05,
                                  color: Colors.white,
                                )),
                    ),
                  ],
                ),
              ),
            ),
            context.read<TransferOutwardctrl>().thirdOutwarditems == null
                ? Container()
                : Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.symmetric(
                        horizontal: Screens.width(context) * 0.03,
                        vertical: Screens.padingHeight(context) * 0.02),
                    child: Column(
                      children: [
                        Expanded(
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
                                            Screens.padingHeight(context) *
                                                0.01,
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
                                                  Screens.width(context) *
                                                      0.04),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // color: Colors.red,
                                                width: Screens.width(context) *
                                                    0.7,
                                                child: Text(
                                                  "${context.read<TransferOutwardctrl>().thirdOutwarditems!.ItemCode.toString()}",
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.grey[500]),
                                                ),
                                              ),
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
                                                      context
                                                          .read<
                                                              TransferOutwardctrl>()
                                                          .thirdOutwarditems!
                                                          .TransNo
                                                          .toString(),
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
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        width: Screens.width(context) * 0.6,
                                        child: Text(
                                          " ${context.read<TransferOutwardctrl>().thirdOutwarditems!.ItemDetails.toString()}",
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey[500]),
                                        ),
                                      ),
                                      Container(
                                          child: Row(
                                        children: [
                                          Text(
                                            "Quantity :",
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: Colors.grey[500]),
                                          ),
                                          Text(
                                            "${context.read<TransferOutwardctrl>().scannedQty()}/${context.read<TransferOutwardctrl>().thirdOutwarditems!.ReqQty!.toStringAsFixed(0)}",
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        Screens.padingHeight(context) * 0.02,
                                  ),
                                  Container(
                                    width: Screens.width(context),
                                    height:
                                        Screens.padingHeight(context) * 0.06,
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
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Required *";
                                              }

                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Scan Serial Number',
                                                hintStyle: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontSize: 15,
                                                        color:
                                                            Colors.grey[500]),
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
                                            controller: context
                                                .read<TransferOutwardctrl>()
                                                .scancontroller,
                                            onEditingComplete: () {
                                              context
                                                      .read<TransferOutwardctrl>()
                                                      .scanedvalueee =
                                                  context
                                                      .read<
                                                          TransferOutwardctrl>()
                                                      .scancontroller
                                                      .text;
                                              if (context
                                                      .read<
                                                          TransferOutwardctrl>()
                                                      .thirdOutwarditems!
                                                      .ManageBy!
                                                      .toLowerCase()
                                                      .toString() ==
                                                  "b") {
                                                setState(() {
                                                  print(
                                                      ">>>>>>>>>>>>${context.read<TransferOutwardctrl>().thirdOutwarditems!.ManageBy}");
                                                  context
                                                      .read<
                                                          TransferOutwardctrl>()
                                                      .quantityEnable = true;
                                                  context
                                                      .read<
                                                          TransferOutwardctrl>()
                                                      .quantitycontroller
                                                      .text = "1";
                                                  // FocusScope.of(context).requestFocus(focusnode5);
                                                });
                                              } else {
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .afterserialScanned(
                                                        context
                                                            .read<
                                                                TransferOutwardctrl>()
                                                            .scanedvalueee
                                                            .toString(),
                                                        context);
                                              }
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              QRscannerState
                                                  .detailsoutwardscan = true;
                                              QRscannerState.transferinw =
                                                  false;
                                              Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const QRscanner()))
                                                  .then((value) {
                                                context
                                                        .read<TransferOutwardctrl>()
                                                        .scancontroller
                                                        .text =
                                                    context
                                                        .read<
                                                            TransferOutwardctrl>()
                                                        .scanedvalueee
                                                        .toString();

                                                if (context
                                                        .read<
                                                            TransferOutwardctrl>()
                                                        .thirdOutwarditems!
                                                        .ManageBy!
                                                        .toLowerCase()
                                                        .toString() ==
                                                    "b") {
                                                  setState(() {
                                                    print(
                                                        ">>>>>>>>>>>>${context.read<TransferOutwardctrl>().thirdOutwarditems!.ManageBy}");
                                                    context
                                                        .read<
                                                            TransferOutwardctrl>()
                                                        .quantityEnable = true;
                                                    context
                                                        .read<
                                                            TransferOutwardctrl>()
                                                        .quantitycontroller
                                                        .text = "1";
                                                    // FocusScope.of(context).requestFocus(focusnode5);
                                                  });
                                                } else {
                                                  context
                                                      .read<
                                                          TransferOutwardctrl>()
                                                      .afterserialScanned(
                                                          context
                                                              .read<
                                                                  TransferOutwardctrl>()
                                                              .scanedvalueee
                                                              .toString(),
                                                          context);
                                                }
                                              });
                                            });
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Screens.width(context) *
                                                          0.018,
                                                  vertical:
                                                      Screens.padingHeight(
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
                                              .watch<TransferOutwardctrl>()
                                              .quantityEnable ==
                                          false
                                      ? SizedBox()
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: Screens.padingHeight(
                                                      context) *
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
                                                      left: Screens.width(
                                                              context) *
                                                          0.02,
                                                    ),
                                                    alignment: Alignment.center,
                                                    width:
                                                        Screens.width(context) *
                                                            0.75,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                      color: Colors.grey[200],
                                                    ),
                                                    child: TextFormField(
                                                      // focusNode: focusnode5,
                                                      controller: context
                                                          .read<
                                                              TransferOutwardctrl>()
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
                                                                          .grey[
                                                                      500]),
                                                          contentPadding: EdgeInsets.symmetric(
                                                              vertical:
                                                                  Screens.padingHeight(
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
                                                                TransferOutwardctrl>()
                                                            .afterserialScanned(
                                                                context
                                                                    .read<
                                                                        TransferOutwardctrl>()
                                                                    .scanedvalueee
                                                                    .toString(),
                                                                context);
                                                      });
                                                    },
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                Screens.width(
                                                                        context) *
                                                                    0.018,
                                                            vertical: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.01),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Screens.padingHeight(context) * 0.01,
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      Screens.padingHeight(context) * 0.01,
                                  horizontal: Screens.width(context) * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: white,
                              ),
                              height: Screens.padingHeight(context) * 0.5,
                              width: Screens.width(context),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: context
                                    .read<TransferOutwardctrl>()
                                    .showlist
                                    .length,
                                itemBuilder: (con, ind) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          Screens.padingHeight(context) * 0.005,
                                      horizontal:
                                          Screens.width(context) * 0.005,
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
                                          Text(
                                            "${context.read<TransferOutwardctrl>().showlist[ind].serialnum.toString()}",
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(),
                                          ),
                                          Text(
                                            "${context.read<TransferOutwardctrl>().showlist[ind].scannedqty}",
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                context
                                                    .read<TransferOutwardctrl>()
                                                    .deleterequest(ind);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ))
                          ],
                        )),
                        SizedBox(
                          height: Screens.padingHeight(context) * 0.01,
                        ),
                        SizedBox(
                          width: Screens.width(context),
                          height: Screens.padingHeight(context) * 0.06,
                          // color: primarycolor,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: thirdcolor),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                context.read<TransferOutwardctrl>().savedbinw();
                              },
                              child: const Text(
                                "Save And Back",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
          ],
        )),
      ),
    );
  }
}
