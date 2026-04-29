import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/Displaytosellable/displaytosellable.dart';
import 'package:warehousemanagement/PAGES/DisplaytoSellable/displaytosllable2.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class DisplaytoSellable extends StatefulWidget {
  const DisplaytoSellable({super.key});

  @override
  State<DisplaytoSellable> createState() => _DisplaytoSellableState();
}

class _DisplaytoSellableState extends State<DisplaytoSellable> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DisplayToSellablectrl>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    "Display To Sellable",
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(
                horizontal: Screens.padingHeight(context) * 0.02,
                vertical: Screens.width(context) * 0.02),
            height: Screens.bodyheight(context),
            width: Screens.width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Screens.width(context) * 0.7,
                  child: TextFormField(
                    controller: context
                        .read<DisplayToSellablectrl>()
                        .displaynewcontroller,
                    onEditingComplete: () {
                      if (context
                          .read<DisplayToSellablectrl>()
                          .displaynewcontroller
                          .text
                          .isNotEmpty) {
                        context
                                .read<DisplayToSellablectrl>()
                                .displayproductserial
                                .text =
                            context
                                .read<DisplayToSellablectrl>()
                                .displaynewcontroller
                                .text;
                        context
                            .read<DisplayToSellablectrl>()
                            .afterserialScanned(
                                context
                                    .read<DisplayToSellablectrl>()
                                    .displaynewcontroller
                                    .text
                                    .toString(),
                                context);
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Scan Items",
                        hintStyle: theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 15, color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                  ),
                ),
                // SizedBox(
                //   height: Screens.padingHeight(context) * 0.01,
                // ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<DisplayToSellablectrl>().diplayScanvalue1 =
                          null;

                      QRscannerState.displayBoxdetailsscan = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QRscanner())).then((value) {
                      context
                              .read<DisplayToSellablectrl>()
                              .displayproductserial
                              .text =
                          context
                              .read<DisplayToSellablectrl>()
                              .diplayScanvalue1
                              .toString();
                      log("context" +
                          context
                              .read<DisplayToSellablectrl>()
                              .diplayScanvalue1
                              .toString());
                      context.read<DisplayToSellablectrl>().afterserialScanned(
                          context
                              .read<DisplayToSellablectrl>()
                              .diplayScanvalue1
                              .toString(),
                          context);
                    });
                  },
                  child: Container(
                    height: Screens.padingHeight(context) * 0.5,
                    width: Screens.width(context) * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.qr_code_2,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: Screens.padingHeight(context) * 0.4,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Screens.padingHeight(context) * 0.04),
                Text(
                  "SCAN ITEMS",
                  style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 196, 196, 196)),
                ),
                SizedBox(height: Screens.padingHeight(context) * 0.07),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
