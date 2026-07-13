import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/SellabletoDisplayController/SellabletoDisController.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class SellabletodisplayScreen extends StatefulWidget {
  const SellabletodisplayScreen({super.key});

  @override
  State<SellabletodisplayScreen> createState() =>
      _SellabletodisplayScreenState();
}

class _SellabletodisplayScreenState extends State<SellabletodisplayScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SellableoDispController>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
                        });
                      },
                      child: Icon(
                        Icons.arrow_back,
                      )),
                  SizedBox(
                    width: Screens.width(context) * 0.015,
                  ),
                  Text(
                    "Sellable To Display",
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
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(
            horizontal: Screens.width(context) * 0.03,
            vertical: Screens.padingHeight(context) * 0.02),
        child: Form(
          key: context.read<SellableoDispController>().formkey,
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: context
                                  .read<SellableoDispController>()
                                  .scancontroller2,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Box Seial Required *";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Box Serial Number',
                                  hintStyle: theme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Colors.grey[500]),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical:
                                          Screens.padingHeight(context) * 0.01,
                                      horizontal:
                                          Screens.width(context) * 0.01),
                                  border: InputBorder.none),
                              onEditingComplete: () {
                                setState(() {
                                  context
                                      .read<SellableoDispController>()
                                      .hideproductserialbutton();
                                  context
                                          .read<SellableoDispController>()
                                          .Scanvalue1 =
                                      context
                                          .read<SellableoDispController>()
                                          .scancontroller2
                                          .text;
                                  context
                                      .read<SellableoDispController>()
                                      .afterserialScanned(
                                          context
                                              .read<SellableoDispController>()
                                              .Scanvalue1
                                              .toString(),
                                          context);
                                });
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                context
                                    .read<SellableoDispController>()
                                    .Scanvalue1 = null;
                                QRscannerState.sellableBoxdetailsscan = true;
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QRscanner())).then((value) {
                                context
                                        .read<SellableoDispController>()
                                        .scancontroller2
                                        .text =
                                    context
                                        .read<SellableoDispController>()
                                        .Scanvalue1
                                        .toString();
                                context
                                    .read<SellableoDispController>()
                                    .afterserialScanned(
                                        context
                                            .read<SellableoDispController>()
                                            .Scanvalue1
                                            .toString(),
                                        context);
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Screens.width(context) * 0.018,
                                    vertical:
                                        Screens.padingHeight(context) * 0.01),
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
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Container(
                      child: context
                                  .watch<SellableoDispController>()
                                  .isloading ==
                              true
                          ? Container(
                              padding: EdgeInsets.only(
                                  top: Screens.padingHeight(context) * 0.1),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: secondary,
                                ),
                              ))
                          : Column(
                              children: [
                                context
                                            .watch<SellableoDispController>()
                                            .isshowtextfield ==
                                        false
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Screens.width(context) * 0.01,
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.2,
                                                  child: Text(
                                                    "Item Code :",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.7,
                                                  child: Text(
                                                    " ${context.read<SellableoDispController>().GetBoxSeriallist[0].ItemCode}",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Screens.padingHeight(
                                                      context) *
                                                  0.005,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.2,
                                                  child: Text(
                                                    "Item Name :",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.7,
                                                  child: Text(
                                                    " ${context.read<SellableoDispController>().GetBoxSeriallist[0].ItemName}",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.2,
                                                  child: Text(
                                                    "Division :",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      Screens.width(context) *
                                                          0.7,
                                                  child: Text(
                                                    " ${context.read<SellableoDispController>().GetBoxSeriallist[0].Division}",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  height: Screens.padingHeight(context) * 0.02,
                                ),
                                context
                                            .watch<SellableoDispController>()
                                            .isshowtextfield ==
                                        false
                                    ? Container()
                                    : Container(
                                        width: Screens.width(context),
                                        height: Screens.padingHeight(context) *
                                            0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(05),
                                          // color: Colors.red
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
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                readOnly: context
                                                            .watch<
                                                                SellableoDispController>()
                                                            .checkFUR ==
                                                        true
                                                    ? true
                                                    : false,
                                                controller: context
                                                    .read<
                                                        SellableoDispController>()
                                                    .scancontroller,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Product Seial Required *";
                                                  }

                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Product Serial Number',
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
                                                              SellableoDispController>()
                                                          .Scanvalue2 =
                                                      context
                                                          .read<
                                                              SellableoDispController>()
                                                          .scancontroller2
                                                          .text;

                                                  context
                                                      .read<
                                                          SellableoDispController>()
                                                      .afterproductscanned(
                                                          context
                                                              .read<
                                                                  SellableoDispController>()
                                                              .Scanvalue2
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
                                                          SellableoDispController>()
                                                      .Scanvalue2 = null;
                                                  QRscannerState
                                                          .sellablerpoductdetailsscan =
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
                                                              SellableoDispController>()
                                                          .scancontroller
                                                          .text =
                                                      context
                                                          .read<
                                                              SellableoDispController>()
                                                          .Scanvalue2
                                                          .toString();
                                                  context
                                                      .read<
                                                          SellableoDispController>()
                                                      .afterproductscanned(
                                                          context
                                                              .read<
                                                                  SellableoDispController>()
                                                              .Scanvalue2
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
                                      ),

                                SizedBox(
                                  height: Screens.padingHeight(context) * 0.01,
                                ),

                                // context
                                //         .watch<SellableoDispController>()
                                //         .isshowtextfield ==false?Container(): context  .read<SellableoDispController>()
                                //                     .scancontroller.text.isEmpty?Container():
                                //      Row(
                                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //         children: [
                                //           Container(
                                //               width: Screens.width(context) * 0.75,
                                //               child: ElevatedButton(
                                //                   style: ElevatedButton.styleFrom(
                                //                       backgroundColor: secondary),
                                //                   onPressed: () {
                                //                    context.read<SellableoDispController>().generateRandomCode();
                                //                   },
                                //                   child: Text(
                                //                     'Generate',
                                //                     style: theme.textTheme.bodyMedium!
                                //                         .copyWith(color: white),
                                //                   ))

                                //               ),
                                //               // SizedBox(width: Screens.width(context)*0.02,),
                                //           Container(
                                //             padding: EdgeInsets.all(10),
                                //             decoration: BoxDecoration(
                                //                 borderRadius: BorderRadius.circular(7),
                                //                 color: secondary),
                                //             child: InkWell(
                                //               onTap: (){
                                //                    context.read<SellableoDispController>().generateRandomCode();

                                //               },
                                //               child: Icon(
                                //                 Icons.refresh,
                                //                 color: Colors.white,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),

                                // SizedBox(
                                //   height: Screens.padingHeight(context) * 0.04,
                                // ),

                                //                  context.read<SellableoDispController>().randomnumber!.isEmpty
                                //     ? Container()
                                //     : Container(
                                //         alignment: Alignment.center,
                                //         width: Screens.width(context) * 0.6,
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: Screens.padingHeight(context) * 0.02,
                                //             vertical: Screens.width(context) * 0.08),
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(10),
                                //             color: Color.fromARGB(255, 255, 255, 255),
                                //             boxShadow: [
                                //               BoxShadow(
                                //                   color:
                                //                       const Color.fromARGB(255, 220, 220, 220),
                                //                   blurRadius: 4,
                                //                   spreadRadius: 0.05
                                //                   // blurStyle: BlurStyle.normal
                                //                   )
                                //             ]),
                                //         child: Text(
                                //           '${context.read<SellableoDispController>().randomnumber.toString()}',
                                //           style: theme.textTheme.bodyMedium!.copyWith(
                                //               color: const Color.fromARGB(255, 0, 0, 0),
                                //               fontWeight: FontWeight.w600,
                                //               fontSize: 25,
                                //               fontStyle: FontStyle.italic),
                                //         ),
                                //       ),
                              ],
                            ),
                    )
                  ],
                ),
              )),
              Container(
                width: Screens.width(context),
                height: Screens.padingHeight(context) * 0.06,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: thirdcolor),
                    onPressed:
                        context.watch<SellableoDispController>().finalloading ==
                                true
                            ? () {}
                            : () {
                                context
                                    .read<SellableoDispController>()
                                    .finalvalidate(context);
                              },
                    child:
                        context.watch<SellableoDispController>().finalloading ==
                                true
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text('Save')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
