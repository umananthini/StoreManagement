import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/TransferInwardController/transferinwardctrl.dart';

import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class LoadTransferInwardpage extends StatefulWidget {
  const LoadTransferInwardpage({super.key});

  @override
  State<LoadTransferInwardpage> createState() => _LoadTransferInwardpageState();
}

class _LoadTransferInwardpageState extends State<LoadTransferInwardpage> {
  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      if (context.read<TransferInwardctrl>().pageChanged == 1) {
        // getQty.clear();
        // getItemsQty();
        // getAllQuantity();
        // if(context.read<inwardcontroller>().isPressed==false){
        context.read<TransferInwardctrl>().showdialogback(context);
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
        return Future.value(false);
      } else if (context.read<TransferInwardctrl>().pageChanged == 0) {
        Get.offAllNamed(ConstantRoutes.transferinward);
        return Future.value(true);
      }
    }
    return Future.value(true);
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransferInwardctrl>().pageChanged = 0;
    });
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
                            onbackpress();
                            context
                                .read<TransferInwardctrl>()
                                .searchfilter2
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
                      "Transfer Inward",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    // Text(
                    //   'Version: ${"${ConstantValues.versionNum}"}',
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //   ),
                    // )
                  ],
                ),
                Text(
                  'Version: ${"${ConstantValues.versionNum}"}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )

                // InkWell(
                //   onTap: (){
                //     setState(() {

                //      context
                //         .read<TransferInwardctrl>().issearchpressed2 =! context
                //         .read<TransferInwardctrl>().issearchpressed2;
                //     });
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //       vertical: Screens.padingHeight(context)*0.005,
                //       horizontal: Screens.width(context)*0.01

                //     ),
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Color.fromARGB(31, 255, 255, 255)
                //     ),
                //     child: Icon(Icons.search,
                //     color: Colors.white,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: context.read<TransferInwardctrl>().pageController,
          onPageChanged: (value) {
            log("value${value.toString()}");
            context.read<TransferInwardctrl>().pageChanged = value;
          },
          children: [
            Firstpage(context, theme),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Screens.width(context) * 0.02,
                    vertical: Screens.padingHeight(context) * 0.02),
                color: Colors.grey[200],
                height: Screens.fullHeight(context),
                width: Screens.width(context),
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
                                vertical: Screens.padingHeight(context) * 0.01,
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
                                          child: context
                                                      .read<
                                                          TransferInwardctrl>()
                                                      .TransferLoad1 !=
                                                  null
                                              ? Text(
                                                  "${context.read<TransferInwardctrl>().TransferLoad1!.ItemCode.toString()}",
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.grey[500]),
                                                )
                                              : Container()),
                                      SizedBox(
                                        height: Screens.padingHeight(context) *
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
                                                  .read<TransferInwardctrl>()
                                                  .tn
                                                  .toString(),
                                              style: theme.textTheme.bodyMedium!
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  // color: Colors.red,
                                  width: Screens.width(context) * 0.6,
                                  child: context
                                              .read<TransferInwardctrl>()
                                              .TransferLoad1 !=
                                          null
                                      ? Text(
                                          " ${context.read<TransferInwardctrl>().TransferLoad1!.ItemName.toString()}",
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.grey[500]),
                                        )
                                      : Container()),
                              Container(
                                  child: Row(
                                children: [
                                  Text(
                                    "Quantity :",
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        fontSize: 14, color: Colors.grey[500]),
                                  ),
                                  context
                                              .read<TransferInwardctrl>()
                                              .TransferLoad1 !=
                                          null
                                      ? Text(
                                          "${context.read<TransferInwardctrl>().ScannedQty()}/${context.read<TransferInwardctrl>().TransferLoad1!.Quantity.toString()}",
                                        )
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
                              // color: Colors.red
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: Screens.width(context) * 0.02,
                                  ),
                                  alignment: Alignment.center,
                                  width: Screens.width(context) * 0.75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
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
                                        hintStyle: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 15,
                                                color: Colors.grey[500]),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.01,
                                            horizontal:
                                                Screens.width(context) * 0.01),
                                        border: InputBorder.none),
                                    controller: context
                                        .read<TransferInwardctrl>()
                                        .scanserialctrl1,
                                    onEditingComplete: () {
                                      setState(() {
                                        context
                                                .read<TransferInwardctrl>()
                                                .scanedvalueee =
                                            context
                                                .read<TransferInwardctrl>()
                                                .scanserialctrl1
                                                .text;
                                        if (context
                                                .read<TransferInwardctrl>()
                                                .TransferLoad1!
                                                .manageby!
                                                .toLowerCase()
                                                .toString() ==
                                            "b") {
                                          setState(() {
                                            print(
                                                ">>>>>>>>>>>>${context.read<TransferInwardctrl>().TransferLoad1!.manageby}");
                                            context
                                                .read<TransferInwardctrl>()
                                                .quantityEnable = true;
                                            context
                                                .read<TransferInwardctrl>()
                                                .quantitycontroller
                                                .text = "1";
                                            // FocusScope.of(context).requestFocus(focusnode5);
                                          });
                                        } else {
                                          context
                                              .read<TransferInwardctrl>()
                                              .afterserialscanned(
                                                  context
                                                      .read<
                                                          TransferInwardctrl>()
                                                      .scanedvalueee
                                                      .toString(),
                                                  context);
                                        }
                                      });
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      QRscannerState.detailsoutwardscan = false;
                                      QRscannerState.transferinw = true;
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const QRscanner()))
                                          .then((value) {
                                        QRscannerState.transferinw = false;
                                        context
                                                .read<TransferInwardctrl>()
                                                .scanserialctrl1
                                                .text =
                                            context
                                                .read<TransferInwardctrl>()
                                                .scanedvalueee
                                                .toString();
                                        if (context
                                                .read<TransferInwardctrl>()
                                                .TransferLoad1!
                                                .manageby!
                                                .toLowerCase()
                                                .toString() ==
                                            "b") {
                                          setState(() {
                                            print(
                                                ">>>>>>>>>>>>${context.read<TransferInwardctrl>().TransferLoad1!.manageby}");
                                            context
                                                .read<TransferInwardctrl>()
                                                .quantityEnable = true;
                                            context
                                                .read<TransferInwardctrl>()
                                                .quantitycontroller
                                                .text = "1";
                                            // FocusScope.of(context).requestFocus(focusnode5);
                                          });
                                        } else {
                                          context
                                              .read<TransferInwardctrl>()
                                              .afterserialscanned(
                                                  context
                                                      .read<
                                                          TransferInwardctrl>()
                                                      .scanserialctrl1
                                                      .text,
                                                  context);
                                        }
                                      });
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.018,
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                          context.watch<TransferInwardctrl>().quantityEnable ==
                                  false
                              ? SizedBox()
                              : Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          Screens.padingHeight(context) * 0.02,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              left:
                                                  Screens.width(context) * 0.02,
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
                                              // focusNode: focusnode5,
                                              controller: context
                                                  .read<TransferInwardctrl>()
                                                  .quantitycontroller,
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return "Required *";
                                              //   }

                                              //   return null;
                                              // },
                                              decoration: InputDecoration(
                                                  labelText: 'Enter Quantity',
                                                  labelStyle: theme
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
                                              onEditingComplete: () {},
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<TransferInwardctrl>()
                                                  .afterserialscanned(
                                                      context
                                                          .read<
                                                              TransferInwardctrl>()
                                                          .scanserialctrl1
                                                          .text,
                                                      context);
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
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.double_arrow_sharp,
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
                        child: Column(
                      children: [
                        // ,

                        // SizedBox(height: Screens.padingHeight(context)*0.01,),

                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Screens.padingHeight(context) * 0.01,
                                horizontal: Screens.width(context) * 0.02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: white,
                            ),
                            height: Screens.padingHeight(context) * 0.5,
                            width: Screens.width(context),
                            child: ListView.builder(
                              itemCount: context
                                  .watch<TransferInwardctrl>()
                                  .DBdata
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        Screens.padingHeight(context) * 0.005,
                                    horizontal: Screens.width(context) * 0.005,
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
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.01,
                                            horizontal:
                                                Screens.width(context) * 0.01,
                                          ),

                                          width: Screens.width(context) * 0.55,

                                          // color: Colors.amber,

                                          // decoration: BoxDecoration(),
                                          child: Text(
                                            context
                                                .read<TransferInwardctrl>()
                                                .DBdata[index]
                                                .serialnum
                                                .toString(),
                                            // textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          width: Screens.width(context) * 0.1,
                                          // color: Color.fromARGB(255, 7, 65, 255),

                                          child: Text(context
                                              .read<TransferInwardctrl>()
                                              .DBdata[index]
                                              .scannedqty
                                              .toString()),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<TransferInwardctrl>()
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
                        )
                      ],
                    )),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Container(
                      height: Screens.padingHeight(context) * 0.065,
                      width: Screens.width(context) * 0.85,
                      decoration: const BoxDecoration(),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: thirdcolor,
                          ),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              context.read<TransferInwardctrl>().savedbinw();
                            });
                          },
                          child: Text(
                            "Save And Back",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container second(BuildContext context) {
    return Container(
      height: Screens.bodyheight(context),
      width: 200,
      color: Colors.pink,
    );
  }

  Container Firstpage(BuildContext context, ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(
        top: Screens.padingHeight(context) * 0.01,
        left: Screens.width(context) * 0.03,
        right: Screens.width(context) * 0.03,
      ),
      height: Screens.fullHeight(context),
      width: Screens.width(context),
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.read<TransferInwardctrl>().issearchpressed2 == false
                ? Container()
                : Container(
                    // height: Screens.padingHeight(context) * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller:
                          context.read<TransferInwardctrl>().searchfilter2,
                      onChanged: (v) {
                        context.read<TransferInwardctrl>().SearchFiltertrans(v);
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
                        errorBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
            SizedBox(
              height: Screens.padingHeight(context) * 0.02,
            ),
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TransNo :',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 93, 93, 93),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    // width: Screens.width(context)*0.4,
                    // color: Colors.seriamber,
                    child: Text(
                      context.read<TransferInwardctrl>().tn.toString(),
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 29, 29, 29),

                        fontSize: 14,
                        // fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: Screens.padingHeight(context) * 0.02,
            ),

            // Container(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Vendor Invoice No.',
            //               style: theme.textTheme.bodyMedium!.copyWith(
            //                   color: thirdcolor, fontWeight: FontWeight.w400),
            //             ),
            //             SizedBox(height: Screens.padingHeight(context) * 0.005),
            //             Container(
            //               height: Screens.padingHeight(context) * 0.05,
            //               width: Screens.width(context) * 0.4,
            //               decoration: BoxDecoration(
            //                   color: grey,
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: TextFormField(
            //                 decoration: const InputDecoration(
            //                   // hintText: "Created By",
            //                   hintStyle: TextStyle(color: Colors.grey),
            //                   // suffixIcon: Icon(Icons.camera_alt,
            //                   // color: primarycolor,
            //                   // size: 30,

            //                   // ),

            //                   border: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   focusedBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   errorBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Invoice Date',
            //               style: theme.textTheme.bodyMedium!.copyWith(
            //                   color: thirdcolor, fontWeight: FontWeight.w400),
            //             ),
            //             SizedBox(height: Screens.padingHeight(context) * 0.005),
            //             Container(
            //               height: Screens.padingHeight(context) * 0.05,
            //               width: Screens.width(context) * 0.4,
            //               decoration: BoxDecoration(
            //                   color: grey,
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: TextFormField(
            //                 decoration: const InputDecoration(
            //                   // hintText: "Created By",
            //                   hintStyle: TextStyle(color: Colors.grey),
            //                   // suffixIcon: Icon(Icons.camera_alt,
            //                   // color: primarycolor,
            //                   // size: 30,

            //                   // ),

            //                   border: const OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   focusedBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   errorBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: Screens.padingHeight(context) * 0.01,
            ),

            Container(
              // color: Colors.amber,
              height: Screens.bodyheight(context) * 0.76,
              width: Screens.width(context),
              child: context.read<TransferInwardctrl>().TransferInward.isEmpty
                  ? Center(
                      child: Container(
                        child: const Text("No Data"),
                      ),
                    )
                  : context.read<TransferInwardctrl>().loadtransinwloading ==
                          true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primarycolor,
                          ),
                        )
                      : context
                              .read<TransferInwardctrl>()
                              .TransferInward
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
                                  height: Screens.padingHeight(context) * 0.08,
                                  width: Screens.width(context) * 0.4,
                                ),
                                SizedBox(
                                    height:
                                        Screens.padingHeight(context) * 0.02),
                                Text("No Data..!"),
                              ],
                            ))
                          : ListView.builder(
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: context
                                  .read<TransferInwardctrl>()
                                  .TransferInward
                                  .length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onDoubleTap: () {},
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<TransferInwardctrl>()
                                          .scanserialctrl1
                                          .clear();
                                      context
                                          .read<TransferInwardctrl>()
                                          .indexx = index;

                                      context
                                          .read<TransferInwardctrl>()
                                          .dataget(context);
                                      context
                                              .read<TransferInwardctrl>()
                                              .TransferLoad1 =
                                          context
                                              .read<TransferInwardctrl>()
                                              .TransferInward[index];
                                    });

                                    context
                                        .read<TransferInwardctrl>()
                                        .SingleItemAdded(context
                                            .read<TransferInwardctrl>()
                                            .TransferInward[index]);

                                    context
                                        .read<TransferInwardctrl>()
                                        .firstbuttonclicked();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Screens.padingHeight(context) *
                                                0.005),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.02,
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.01),
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
                                          ] //                  boxShadow: [
                                          //   BoxShadow(
                                          //     color:fourthcolor,
                                          //     blurRadius: 4,
                                          //     spreadRadius:0.5
                                          //   )
                                          // ]
                                          ),
                                      child: Column(
                                        children: [
                                          Container(
                                            // color: Colors.amber,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    width:
                                                        Screens.width(context) *
                                                            0.9,
                                                    //  color: Colors.red,
                                                    child: Text(
                                                      "${context.read<TransferInwardctrl>().TransferInward[index].ItemCode.toString()}",
                                                      // "${grpDetailsFilter[i].ItemCode}",
                                                      style: theme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              color: Colors
                                                                  .grey[500]),
                                                    )),
                                                SizedBox(
                                                    height:
                                                        Screens.padingHeight(
                                                                context) *
                                                            0.01),
                                                Container(
                                                    // color: Colors.amber,
                                                    alignment: Alignment.center,
                                                    width:
                                                        Screens.width(context) *
                                                            0.9,
                                                    //  color: Colors.red,
                                                    child: Text(
                                                      "${context.read<TransferInwardctrl>().TransferInward[index].ItemName.toString()}",
                                                      // "${grpDetailsFilter[i].Dscription}",
                                                      style: theme
                                                          .textTheme.bodyMedium!
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
                                                    Screens.width(context) *
                                                        0.01),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width:
                                                        Screens.width(context) *
                                                            0.6,
                                                    //  color: Colors.red,
                                                    child: Container(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Quantity :",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          Text(
                                                            " ${context.read<TransferInwardctrl>().filtergetqty.length == 0 || context.read<TransferInwardctrl>().filtergetqty.isEmpty ? '0' : context.read<TransferInwardctrl>().filtergetqty[index]}/${context.read<TransferInwardctrl>().TransferInward[index].Quantity.toString()}",
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                CircleAvatar(
                                                  radius:
                                                      Screens.width(context) *
                                                          0.045,
                                                  backgroundColor: thirdcolor,
                                                  child: const Icon(
                                                    Icons
                                                        .keyboard_arrow_right_rounded,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
            ),
            SizedBox(
              height: Screens.padingHeight(context) * 0.025,
            ),

            // Container(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Attachment 1',
            //               style: theme.textTheme.bodyMedium!.copyWith(
            //                   color: thirdcolor,
            //                   fontWeight: FontWeight.w400),
            //             ),
            //             SizedBox(
            //                 height:
            //                     Screens.padingHeight(context) * 0.005),
            //             Container(
            //               height: Screens.padingHeight(context) * 0.05,
            //               width: Screens.width(context) * 0.4,
            //               decoration: BoxDecoration(
            //                   color: grey,
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: TextFormField(
            //                 readOnly: true,
            //                 decoration: const InputDecoration(
            //                   // hintText: "Created By",
            //                   hintStyle: TextStyle(color: Colors.grey),
            //                   suffixIcon: Icon(
            //                     Icons.camera_alt,
            //                     color: primarycolor,
            //                     size: 20,
            //                   ),

            //                   border: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   focusedBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   errorBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Attachment 2',
            //               style: theme.textTheme.bodyMedium!.copyWith(
            //                   color: thirdcolor,
            //                   fontWeight: FontWeight.w400),
            //             ),
            //             SizedBox(
            //                 height:
            //                     Screens.padingHeight(context) * 0.005),
            //             Container(
            //               height: Screens.padingHeight(context) * 0.05,
            //               width: Screens.width(context) * 0.4,
            //               decoration: BoxDecoration(
            //                   color: grey,
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: TextFormField(
            //                 readOnly: true,
            //                 decoration: const InputDecoration(
            //                   // hintText: "Created By",
            //                   hintStyle: TextStyle(color: Colors.grey),
            //                   suffixIcon: Icon(
            //                     Icons.camera_alt,
            //                     color: primarycolor,
            //                     size: 20,
            //                   ),

            //                   border: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   focusedBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                   errorBorder: OutlineInputBorder(
            //                       borderSide: BorderSide.none),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: Screens.padingHeight(context) * 0.03,
            // ),
            // Expanded(child: Container()),
            Container(
              height: Screens.padingHeight(context) * 0.06,
              width: Screens.width(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: thirdcolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                // onPressed: () {},
                onPressed: context
                            .watch<TransferInwardctrl>()
                            .saveenablebutton ==
                        false
                    // context
                    //             .watch<inwardcontroller>()
                    //             .grpTotal !=
                    //         context
                    //             .read<inwardcontroller>()
                    //             .getqty
                    ? null
                    : context.watch<TransferInwardctrl>().finallodaing == true
                        ? null
                        : () {
                            context
                                .read<TransferInwardctrl>()
                                .savefinal(context);
                          },
                child: context.watch<TransferInwardctrl>().finallodaing == false
                    ? Text('Save',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: grey,
                        ))
                    : SpinKitThreeBounce(
                        size: Screens.width(context) * 0.05,
                        color: Colors.white,
                      ),
              ),
            ),
            //          Padding(
            // padding: EdgeInsets.only(
            //     bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }
}
