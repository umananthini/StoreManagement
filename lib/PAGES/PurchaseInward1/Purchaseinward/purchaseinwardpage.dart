// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/DashBoardController/dashboardctrl.dart';
// import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// class PurchaseInwardScreen extends StatefulWidget {
//   const PurchaseInwardScreen({super.key});

//   @override
//   State<PurchaseInwardScreen> createState() => _PurchaseInwardScreenState();
// }

// class _PurchaseInwardScreenState extends State<PurchaseInwardScreen> {
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<PurchaseInwardCtrl>().init();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//         // appBar: AppBar(
//         //   centerTitle: true,
//         //   backgroundColor: primarycolor,
//         //   title: Text("Purchase Inward",
//         //   style: theme.textTheme.bodyMedium!.copyWith(
//         //     color: white,
//         //     fontWeight: FontWeight.w600,
//         //     fontSize: 22
//         //   ),
//         //   ),
//         // ),
//         body: Container(
//       height: Screens.fullHeight(context),
//       width: Screens.width(context),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//               top: Screens.padingHeight(context) * 0.04,
//               bottom: Screens.padingHeight(context) * 0.01,
//               left: Screens.width(context) * 0.03,
//               right: Screens.width(context) * 0.03,
//             ),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [secondary, primarycolor],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               // border: Border(
//               //     bottom:
//               //         BorderSide(color: Colors.white,)
//               //         )
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: Screens.padingHeight(context) * 0.01,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: Screens.width(context) * 0.13,
//                             // color: Colors.amber,
//                             child: Text("User",
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15)),
//                           ),
//                           Text(":",
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: Colors.white,
//                                 // fontWeight: FontWeight.w600
//                               )),
//                           Container(
//                             width: Screens.width(context) * 0.25,
//                             // color: Colors.amber,
//                             child: Text(" KPDH",
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text("Online",
//                             style: theme.textTheme.bodyMedium!
//                                 .copyWith(color: Colors.white, fontSize: 15)),
//                         SizedBox(
//                           width: Screens.width(context) * 0.02,
//                         ),
//                         Container(
//                           width: Screens.width(context) * 0.04,
//                           height: Screens.padingHeight(context) * 0.04,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: Colors.green),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 // SizedBox(
//                 //   height: Screens.padingHeight(context) * 0.01,
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: Screens.width(context) * 0.13,
//                             // color: Colors.amber,
//                             child: Text("Device",
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15)),
//                           ),
//                           Text(":",
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: Colors.white,
//                                 // fontWeight: FontWeight.w600
//                               )),
//                           Container(
//                             width: Screens.width(context) * 0.25,
//                             // color: Colors.amber,
//                             child: Text(" ",
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text("Scanner ",
//                             style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15)),
//                         SizedBox(
//                           width: Screens.width(context) * 0.02,
//                         ),
//                         Container(
//                           width: Screens.width(context) * 0.04,
//                           height: Screens.padingHeight(context) * 0.04,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: Colors.red),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Divider(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                 ),
//                 Container(
//                   width: Screens.width(context),
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Screens.width(context) * 0.01,
//                       vertical: Screens.width(context) * 0.01),
//                   decoration: BoxDecoration(
//                       // color: theme.primaryColor,
//                       // border: Border(
//                       //     bottom:
//                       //         BorderSide(color: Colors.grey, width: 2.0))
//                       ),
//                   child: Text("Inward",
//                       textAlign: TextAlign.center,
//                       style: theme.textTheme.bodyMedium!.copyWith(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//               child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [primarycolor, secondary],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Container(
//               padding: EdgeInsets.only(
//                   top: Screens.padingHeight(context) * 0.03,
//                   left: Screens.width(context) * 0.03,
//                   right: Screens.width(context) * 0.03),
//               decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30))),
//               child: Column(
//                 children: [
//                   Container(
//                     height: Screens.padingHeight(context) * 0.06,
//                     decoration: BoxDecoration(
//                         color: grey, borderRadius: BorderRadius.circular(10)),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Searc",
//                         hintStyle: TextStyle(color: Colors.grey),
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             setState(() {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => QRscanner()));
//                             });
//                           },
//                           child: Icon(
//                             Icons.qr_code_2,
//                             color: primarycolor,
//                             size: 30,
//                           ),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: primarycolor,
//                         ),
//                         border: OutlineInputBorder(borderSide: BorderSide.none),
//                         focusedBorder:
//                             OutlineInputBorder(borderSide: BorderSide.none),
//                         enabledBorder:
//                             OutlineInputBorder(borderSide: BorderSide.none),
//                         errorBorder:
//                             OutlineInputBorder(borderSide: BorderSide.none),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: white,
//                       height: Screens.padingHeight(context) * 0.4,
//                       width: Screens.width(context),
//                       child: ListView.builder(
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               Get.toNamed(ConstantRoutes.purchaseinwardlist);
//                             },
//                             child: Card(
//                               color: Colors.grey[100],
//                               elevation: 2,
//                               //  padding: EdgeInsets.symmetric(
//                               //         horizontal: Screens.width(context)*0.01,
//                               //         vertical: Screens.padingHeight(context)*0.01

//                               //       ),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: Screens.width(context) * 0.02,
//                                   vertical:
//                                       Screens.padingHeight(context) * 0.01,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   // color: grey,
//                                   //                  boxShadow: [
//                                   //   BoxShadow(
//                                   //     color:fourthcolor,
//                                   //     blurRadius: 4,
//                                   //     spreadRadius:0.5
//                                   //   )
//                                   // ]
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "DocNum",
//                                           style: theme.textTheme.bodyMedium!
//                                               .copyWith(
//                                                   color: Color.fromARGB(
//                                                       255, 154, 154, 154),
//                                                   fontWeight: FontWeight.w600),
//                                         ),
//                                         Container(
//                                           alignment: Alignment.topRight,
//                                           width: Screens.width(context) * 0.3,
//                                           // color: primarycolor,
//                                           child: Text(
//                                             "#24537969",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: secondary,
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 14),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           Screens.padingHeight(context) * 0.01,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Supplier Code",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: Color.fromARGB(
//                                                         255, 163, 163, 163),
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             width: Screens.width(context) * 0.3,
//                                             // color: primarycolor,
//                                             child: Text(
//                                               "V2356",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       color: Color.fromARGB(
//                                                           255, 0, 0, 0),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 14),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           Screens.padingHeight(context) * 0.01,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Supplier Name",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: Color.fromARGB(
//                                                         255, 163, 163, 163),
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             width: Screens.width(context) * 0.3,
//                                             // color: primarycolor,
//                                             child: Text(
//                                               "ANANDH ELECTRIC CORPORATION & CO",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       color: Color.fromARGB(
//                                                           255, 0, 0, 0),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 14),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           Screens.padingHeight(context) * 0.01,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Contact Name",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: Color.fromARGB(
//                                                         255, 163, 163, 163),
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             width: Screens.width(context) * 0.3,
//                                             // color: primarycolor,
//                                             child: Text(
//                                               "null",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       color: Color.fromARGB(
//                                                           255, 0, 0, 0),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 14),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           Screens.padingHeight(context) * 0.01,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Doc Date",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: Color.fromARGB(
//                                                         255, 163, 163, 163),
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             width: Screens.width(context) * 0.3,
//                                             // color: primarycolor,
//                                             child: Text(
//                                               "09-09-2025",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       color: Color.fromARGB(
//                                                           255, 0, 0, 0),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 14),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           Screens.padingHeight(context) * 0.01,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Created date",
//                                             style: theme.textTheme.bodyMedium!
//                                                 .copyWith(
//                                                     color: Color.fromARGB(
//                                                         255, 163, 163, 163),
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                           ),
//                                           Container(
//                                             alignment: Alignment.topRight,
//                                             width: Screens.width(context) * 0.3,
//                                             // color: primarycolor,
//                                             child: Text(
//                                               "09-09-2025",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       color: Color.fromARGB(
//                                                           255, 0, 0, 0),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 14),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )),
//         ],
//       ),
//     ));
//   }
// }
