import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/DashBoardController/dashboardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/detailpurchaseinwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class DetailPurchaseInwardScreen extends StatefulWidget {
  const DetailPurchaseInwardScreen({super.key});

  @override
  State<DetailPurchaseInwardScreen> createState() =>
      _DetailPurchaseInwardScreenState();
}

class _DetailPurchaseInwardScreenState
    extends State<DetailPurchaseInwardScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DetailPurchaseInwardctrl>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Container(
      height: Screens.fullHeight(context),
      width: Screens.width(context),
      child: Column(
        children: [
          Container(
            width: Screens.width(context),
            padding: EdgeInsets.only(
              top: Screens.padingHeight(context) * 0.04,
              bottom: Screens.padingHeight(context) * 0.01,
              left: Screens.width(context) * 0.01,
              right: Screens.width(context) * 0.01,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [secondary, primarycolor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // border: Border(
              //     bottom:
              //         BorderSide(color: Colors.white,)
              //         )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Doc No :',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        // width: Screens.width(context)*0.4,
                        // color: Colors.amber,
                        child: Text(
                          '24567854',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                Container(
                  // color: grey,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vendor :',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        // alignment: Alignment.center,
                        width: Screens.width(context) * 0.6,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            ),

                        child: Text(
                          'ANANDH ELECTRIC CORPORATION',
                          //  textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,

                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                Container(
                  // color: grey,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Screens.width(context) * 0.7,
                        // color: Colors.amber,
                        child: Text(
                          'Darling Accessories',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                Container(
                  // color: grey,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quantity :',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        // width: Screens.width(context)*0.3,
                        // color: Colors.amber,
                        child: Text(
                          '200/300',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primarycolor, secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Screens.padingHeight(context) * 0.03,
                  left: Screens.width(context) * 0.03,
                  right: Screens.width(context) * 0.03),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Managed By :",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color:
                                      const Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Container(
                                // alignment: Alignment.center,
                                width: Screens.width(context) * 0.2,
                                // color: Colors.amber,
                                child: Text(
                                  "Serial",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      // color: const Color.fromARGB(255, 120, 120, 120),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: Screens.width(context) * 0.3,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Text(
                              'Do Putaway',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  color:
                                      const Color.fromARGB(255, 120, 120, 120),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.02,
                  ),
                  //  Container(
                  //     height: Screens.padingHeight(context)*0.06,
                  //    decoration: BoxDecoration(
                  //        color: grey,
                  //     borderRadius: BorderRadius.circular(10)
                  //    ),

                  //     child: TextFormField(

                  //       decoration: InputDecoration(
                  //         hintText: "Bin Code Scanning",
                  //         hintStyle:TextStyle(
                  //           color: Colors.grey
                  //         ),
                  //         suffixIcon: Icon(Icons.qr_code_2,
                  //         color: primarycolor,
                  //         size: 30,

                  //         ),

                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide.none
                  //         ),
                  //           focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide.none
                  //         ),
                  //           enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide.none
                  //         ),
                  //           errorBorder: OutlineInputBorder(
                  //           borderSide: BorderSide.none
                  //         ),

                  //       ),
                  //     ),
                  //   ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.02,
                  ),
                  Container(
                    height: Screens.padingHeight(context) * 0.06,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: context
                          .read<DetailPurchaseInwardctrl>()
                          .scanserialctrl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: Screens.padingHeight(context) * 0,
                            horizontal: Screens.width(context) * 0.01),
                        hintText: "Scan Serial Number",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRscanner()));
                            });
                          },
                          child: Icon(
                            Icons.qr_code_2,
                            color: primarycolor,
                            size: 30,
                          ),
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
                    height: Screens.padingHeight(context) * 0.06,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller:
                          context.read<DetailPurchaseInwardctrl>().qtyctrl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: Screens.padingHeight(context) * 0,
                            horizontal: Screens.width(context) * 0.01),
                        hintText: "1",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        suffixIcon: Icon(
                          Icons.arrow_right_rounded,
                          color: primarycolor,
                          size: 40,
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
                  Expanded(
                    child: Container(
                      color: white,
                      height: Screens.padingHeight(context) * 0.5,
                      width: Screens.width(context),
                      child: ListView.builder(
                        itemCount: 16,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey[100],
                            elevation: 2,
                            //  padding: EdgeInsets.symmetric(
                            //         horizontal: Screens.width(context)*0.01,
                            //         vertical: Screens.padingHeight(context)*0.01

                            //       ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context) * 0.02,
                                  vertical:
                                      Screens.padingHeight(context) * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: grey,
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
                                    // color: Colors.amber,
                                    child: Text("6SQMNH-HJKS890"),
                                  ),
                                  Container(
                                      width: Screens.width(context) * 0.2,
                                      // color: Colors.blue,
                                      child: Text("6SQMNH")),
                                  Container(
                                    width: Screens.width(context) * 0.1,
                                    // color: Color.fromARGB(255, 7, 65, 255),

                                    child: Text("2"),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
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
              ),
            ),
          )),
          Container(
            height: Screens.padingHeight(context) * 0.06,
            width: Screens.width(context),
            decoration: BoxDecoration(
                // color: primarycolor
                //  gradient: LinearGradient(
                //         colors: [primarycolor,secondary ],
                //         begin: Alignment.topLeft,
                //         end: Alignment.topRight,
                //       ),

                // borderRadius: BorderRadius.circular(30)
                ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: thirdcolor,
                ),
                onPressed: () {},
                child: Text(
                  "Save And Back",
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    ));
  }
}
