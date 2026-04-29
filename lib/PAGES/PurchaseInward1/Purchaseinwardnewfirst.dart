import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class PurchaseInwNewFirst extends StatefulWidget {
  const PurchaseInwNewFirst({super.key});

  @override
  State<PurchaseInwNewFirst> createState() => _PurchaseInwNewFirstState();
}

class _PurchaseInwNewFirstState extends State<PurchaseInwNewFirst> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PurchaseInwardCtrl>().init();
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
      context.read<PurchaseInwardCtrl>().searchfilter1.clear();
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
                              Get.offAllNamed(ConstantRoutes.dashboard);
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        context.read<PurchaseInwardCtrl>().issearchpressed1 =
                            !context
                                .read<PurchaseInwardCtrl>()
                                .issearchpressed1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: Screens.padingHeight(context) * 0.005,
                          horizontal: Screens.width(context) * 0.01),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(31, 255, 255, 255)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Screens.width(context) * 0.02,
                vertical: Screens.padingHeight(context) * 0.01),
            width: Screens.width(context),
            color: Colors.grey[200],
            child: Column(
              children: [
                context.watch<PurchaseInwardCtrl>().issearchpressed1 == false
                    ? Container()
                    : Container(
                        height: Screens.padingHeight(context) * 0.05,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller:
                              context.read<PurchaseInwardCtrl>().searchfilter1,
                          cursorColor: thirdcolor,
                          onChanged: (v) {
                            context
                                .read<PurchaseInwardCtrl>()
                                .SearchFilterpurchaseinvdetails(v);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                            // suffixIcon: InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //         context.read<PurchaseInwardCtrl>().searchpurchase =
                            //           null;

                            //       QRscannerState.searchpurchasedetailsscan = true;
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => QRscanner())).then((value) =>

                            //               context.read<PurchaseInwardCtrl>().searchfilter1.text=context.read<PurchaseInwardCtrl>().searchpurchase.toString() );
                            //     });
                            //   },
                            //   child: Icon(
                            //     Icons.qr_code_2,
                            //     color: primarycolor,
                            //     size: 30,
                            //   ),
                            // ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: primarycolor,
                            ),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
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
                context.watch<PurchaseInwardCtrl>().isloading == true
                    ? Container(
                        height: Screens.padingHeight(context) * 0.7,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: primarycolor,
                          ),
                        ),
                      )
                    : context
                            .watch<PurchaseInwardCtrl>()
                            .filtervendorlist
                            .isEmpty
                        ? Center(
                            child: Container(
                                // height: Screens.padingHeight(context),
                                // width: Screens.,
                                child: Column(
                            children: [
                              SizedBox(
                                  height: Screens.padingHeight(context) * 0.1),
                              Image.asset(
                                "Assets/error-file.png",
                                height: Screens.padingHeight(context) * 0.08,
                                width: Screens.width(context) * 0.4,
                              ),
                              SizedBox(
                                  height: Screens.padingHeight(context) * 0.02),
                              Text("No Data..!"),
                            ],
                          )))
                        : context
                                .watch<PurchaseInwardCtrl>()
                                .searchfiltervendorlist
                                .isEmpty
                            ? Container(
                                // height: Screens.padingHeight(context),
                                // width: Screens.,
                                child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          Screens.padingHeight(context) * 0.1),
                                  Image.asset(
                                    "Assets/error-file.png",
                                    height:
                                        Screens.padingHeight(context) * 0.08,
                                    width: Screens.width(context) * 0.4,
                                  ),
                                  SizedBox(
                                      height:
                                          Screens.padingHeight(context) * 0.02),
                                  Text("No Data..!"),
                                ],
                              ))
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: context
                                      .read<PurchaseInwardCtrl>()
                                      .searchfiltervendorlist
                                      .length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          context
                                              .read<PurchaseInwardCtrl>()
                                              .docentryfirst = index;
                                          context
                                                  .read<PurchaseInwardCtrl>()
                                                  .secondpagevendorlist =
                                              context
                                                  .read<PurchaseInwardCtrl>()
                                                  .searchfiltervendorlist[index];

                                          Get.offAllNamed(
                                            ConstantRoutes.purchaseinwnewsec,
                                          );
                                          // context.read<PurchaseInwardCtrl>().secondpageinit();
                                        });
                                      },
                                      onDoubleTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.005,
                                          horizontal:
                                              Screens.width(context) * 0.005,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Screens.width(context) * 0.02,
                                              vertical: Screens.padingHeight(
                                                      context) *
                                                  0.02),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 239, 239, 239),
                                                    blurRadius: 5,
                                                    spreadRadius: 4)
                                              ]),
                                          // height: Screens.padingHeight(context)*0.3,
                                          width: Screens.width(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                // color: Colors.red,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey[50],
                                                      ),
                                                      child: Icon(
                                                        Icons.person,
                                                        size: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.05,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: Screens
                                                                      .padingHeight(
                                                                          context) *
                                                                  0.008),
                                                          // alignment: Alignment.start

                                                          width: Screens.width(
                                                                  context) *
                                                              0.45,
                                                          // color: const Color.fromARGB(255, 75, 57, 4),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal:
                                                                      Screens.width(
                                                                              context) *
                                                                          0.015,
                                                                  vertical:
                                                                      Screens.padingHeight(
                                                                              context) *
                                                                          0.003,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              primarycolor),
                                                                  // color: const Color.fromARGB(255, 245, 245, 245)
                                                                ),
                                                                child: Text(
                                                                  context
                                                                      .read<
                                                                          PurchaseInwardCtrl>()
                                                                      .searchfiltervendorlist[
                                                                          index]
                                                                      .Brand
                                                                      .toString(),
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        1,
                                                                        1,
                                                                        1),
                                                                    fontSize:
                                                                        13,
                                                                    // letterSpacing: 1,
                                                                    // fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: Screens
                                                                        .padingHeight(
                                                                            context) *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                context
                                                                    .read<
                                                                        PurchaseInwardCtrl>()
                                                                    .searchfiltervendorlist[
                                                                        index]
                                                                    .Vendor
                                                                    .toString(),
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                        color: Colors.grey[
                                                                            500],
                                                                        fontSize:
                                                                            15,
                                                                        // letterSpacing: 1,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Screens
                                                                  .padingHeight(
                                                                      context) *
                                                              0.008,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: Screens
                                                                      .padingHeight(
                                                                          context) *
                                                                  0.008),

                                                          width: Screens.width(
                                                                  context) *
                                                              0.5,
                                                          // color: Colors.amber,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                // color:
                                                                //     Colors.red,
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.2,
                                                                child: Text(
                                                                  context
                                                                      .read<
                                                                          PurchaseInwardCtrl>()
                                                                      .searchfiltervendorlist[
                                                                          index]
                                                                      .DocNum
                                                                      .toString(),
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(
                                                                    fontSize:
                                                                        13.5,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                // color: Colors.amber,
                                                                height: Screens
                                                                        .padingHeight(
                                                                            context) *
                                                                    0.02,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      height: Screens.padingHeight(
                                                                              context) *
                                                                          0.004,
                                                                      width: Screens.width(
                                                                              context) *
                                                                          0.002,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          183,
                                                                          183,
                                                                          183),
                                                                    ),
                                                                    Container(
                                                                      height: Screens.padingHeight(
                                                                              context) *
                                                                          0.005,
                                                                      width: Screens.width(
                                                                              context) *
                                                                          0.002,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          183,
                                                                          183,
                                                                          183),
                                                                    ),
                                                                    Container(
                                                                      height: Screens.padingHeight(
                                                                              context) *
                                                                          0.005,
                                                                      width: Screens.width(
                                                                              context) *
                                                                          0.002,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          183,
                                                                          183,
                                                                          183),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.02,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                // color: const Color
                                                                //     .fromARGB(
                                                                //     255,
                                                                //     231,
                                                                //     186,
                                                                //     182),
                                                                width: Screens
                                                                        .width(
                                                                            context) *
                                                                    0.22,
                                                                child: Text(
                                                                  context
                                                                      .read<
                                                                          PurchaseInwardCtrl>()
                                                                      .searchfiltervendorlist[
                                                                          index]
                                                                      .PORef
                                                                      .toString(),
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodyMedium!
                                                                      .copyWith(
                                                                    fontSize:
                                                                        12.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // color: Colors.amber,
                                                child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .center,

                                                            width: Screens.width(
                                                                    context) *
                                                                0.25,
                                                            // color: Colors.amber,
                                                            child: Text(
                                                              context
                                                                  .read<
                                                                      PurchaseInwardCtrl>()
                                                                  .searchfiltervendorlist[
                                                                      index]
                                                                  .VendorCode
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Vendor Code",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        14,
                                                                    // letterSpacing: 1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.01),
                                                    Container(
                                                      width: Screens.width(
                                                              context) *
                                                          0.24,
                                                      // color: Colors.amber,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                          Container(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.001,
                                                            width: Screens.width(
                                                                    context) *
                                                                0.015,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                183, 183, 183),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: Screens
                                                                .padingHeight(
                                                                    context) *
                                                            0.01),
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .center,

                                                            width: Screens.width(
                                                                    context) *
                                                                0.25,
                                                            // color: Colors.amber,
                                                            child: Text(
                                                              context
                                                                  .read<
                                                                      PurchaseInwardCtrl>()
                                                                  .searchfiltervendorlist[
                                                                      index]
                                                                  .DocDate
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Doc Date",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
              ],
            ),
          )),
    );
  }
}
