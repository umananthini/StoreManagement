// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';

// class PurchaseInwardListScreen extends StatefulWidget {
//   const PurchaseInwardListScreen({super.key});

//   @override
//   State<PurchaseInwardListScreen> createState() =>
//       _PurchaseInwardListScreenState();
// }

// class _PurchaseInwardListScreenState extends State<PurchaseInwardListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         padding: EdgeInsets.only(
//           top: Screens.padingHeight(context) * 0.05,
//           left: Screens.width(context) * 0.03,
//           right: Screens.width(context) * 0.03,
//         ),
//         height: Screens.fullHeight(context),
//         width: Screens.width(context),
//         color: white,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: Screens.padingHeight(context) * 0.06,
//                 decoration: BoxDecoration(
//                     color: grey, borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Search",
//                     hintStyle: TextStyle(color: Colors.grey),
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: primarycolor,
//                     ),
//                     border: OutlineInputBorder(borderSide: BorderSide.none),
//                     focusedBorder:
//                         OutlineInputBorder(borderSide: BorderSide.none),
//                     enabledBorder:
//                         OutlineInputBorder(borderSide: BorderSide.none),
//                     errorBorder:
//                         OutlineInputBorder(borderSide: BorderSide.none),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: Screens.padingHeight(context) * 0.02,
//               ),
//               Container(
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Doc No :',
//                       style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Color.fromARGB(255, 93, 93, 93),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Container(
//                       // width: Screens.width(context)*0.4,
//                       // color: Colors.amber,
//                       child: Text(
//                         '24567854',
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Color.fromARGB(255, 29, 29, 29),

//                           fontSize: 14,
//                           // fontWeight: FontWeight.w500
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: Screens.padingHeight(context) * 0.01,
//               ),
//               Container(
//                 // color: grey,
//                 // alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Vendor :',
//                       style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Color.fromARGB(255, 93, 93, 93),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Container(
//                       // alignment: Alignment.center,
//                       width: Screens.width(context) * 0.6,
//                       decoration: BoxDecoration(
//                           // color: Colors.amber,
//                           ),

//                       child: Text(
//                         'ANANDH ELECTRIC CORPORATION',
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: Color.fromARGB(255, 34, 34, 34),
//                           fontSize: 14,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               // SizedBox(
//               //   height: Screens.padingHeight(context) * 0.02,
//               // ),

//               // Container(
//               //   child: Row(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       Container(
//               //         child: Column(
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Text(
//               //               'Vendor Invoice No.',
//               //               style: theme.textTheme.bodyMedium!.copyWith(
//               //                   color: thirdcolor, fontWeight: FontWeight.w400),
//               //             ),
//               //             SizedBox(
//               //                 height: Screens.padingHeight(context) * 0.005),
//               //             Container(
//               //               height: Screens.padingHeight(context) * 0.05,
//               //               width: Screens.width(context) * 0.4,
//               //               decoration: BoxDecoration(
//               //                   color: grey,
//               //                   borderRadius: BorderRadius.circular(10)),
//               //               child: TextFormField(
                              
//               //                 decoration: InputDecoration(
//               //                   // hintText: "Created By",
//               //                   hintStyle: TextStyle(color: Colors.grey),
//               //                   // suffixIcon: Icon(Icons.camera_alt,
//               //                   // color: primarycolor,
//               //                   // size: 30,

//               //                   // ),

//               //                   border: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   focusedBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   enabledBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   errorBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //       Container(
//               //         child: Column(
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Text(
//               //               'Invoice Date',
//               //               style: theme.textTheme.bodyMedium!.copyWith(
//               //                   color: thirdcolor, fontWeight: FontWeight.w400),
//               //             ),
//               //             SizedBox(
//               //                 height: Screens.padingHeight(context) * 0.005),
//               //             Container(
//               //               height: Screens.padingHeight(context) * 0.05,
//               //               width: Screens.width(context) * 0.4,
//               //               decoration: BoxDecoration(
//               //                   color: grey,
//               //                   borderRadius: BorderRadius.circular(10)),
//               //               child: TextFormField(
//               //                 decoration: InputDecoration(
//               //                   // hintText: "Created By",
//               //                   hintStyle: TextStyle(color: Colors.grey),
//               //                   // suffixIcon: Icon(Icons.camera_alt,
//               //                   // color: primarycolor,
//               //                   // size: 30,

//               //                   // ),

//               //                   border: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   focusedBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   enabledBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                   errorBorder: OutlineInputBorder(
//               //                       borderSide: BorderSide.none),
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),

//               SizedBox(
//                 height: Screens.padingHeight(context) * 0.01,
//               ),

//               Container(
//                 // color: Colors.amber,
//                 height: Screens.padingHeight(context) * 0.52,
//                 width: Screens.width(context),
//                 child: ListView.builder(
//                   padding: EdgeInsets.all(0),
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       color: Colors.grey[100],
//                       elevation: 2,
//                       //  padding: EdgeInsets.symmetric(
//                       //         horizontal: Screens.width(context)*0.01,
//                       //         vertical: Screens.padingHeight(context)*0.01

//                       //       ),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: Screens.width(context) * 0.02,
//                             vertical: Screens.padingHeight(context) * 0.01),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           // color: grey,
//                           //                  boxShadow: [
//                           //   BoxShadow(
//                           //     color:fourthcolor,
//                           //     blurRadius: 4,
//                           //     spreadRadius:0.5
//                           //   )
//                           // ]
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: Screens.width(context) * 0.6,
//                                   // color: Colors.amber,
//                                   child: Text(
//                                     "6SQ MM GH YY",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                       color: Color.fromARGB(255, 154, 154, 154),
//                                       // fontWeight: FontWeight.w600
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: Screens.padingHeight(context) * 0.01,
//                                 ),
//                                 Container(
//                                   width: Screens.width(context) * 0.6,
//                                   // color: Colors.amber,
//                                   child: Text(
//                                     "Darling Accessories 6SQ MM GH YY ",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                       color: Color.fromARGB(255, 154, 154, 154),
//                                       // fontWeight: FontWeight.w600
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: Screens.padingHeight(context) * 0.01,
//                                 ),
//                                 Container(
//                                   width: Screens.width(context) * 0.6,
//                                   // color: Colors.amber,
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         "Quantity :",
//                                         style: theme.textTheme.bodyMedium!
//                                             .copyWith(
//                                                 color: Color.fromARGB(
//                                                     255, 154, 154, 154),
//                                                 fontWeight: FontWeight.w600),
//                                       ),
//                                       Container(
//                                         width: Screens.width(context) * 0.3,
//                                         // color: Colors.amber,
//                                         child: Text(
//                                           "200/300",
//                                           style: theme.textTheme.bodyMedium!
//                                               .copyWith(
//                                             color: Color.fromARGB(255, 1, 1, 1),
//                                             // fontWeight: FontWeight.w600
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                                 height: Screens.padingHeight(context) * 0.05,
//                                 width: Screens.width(context) * 0.13,
//                                 decoration: BoxDecoration(
//                                     color: thirdcolor, shape: BoxShape.circle),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Get.toNamed(
//                                         ConstantRoutes.detailpurchaseinward);
//                                   },
//                                   child: Container(
//                                     child: Icon(
//                                       Icons.keyboard_arrow_right,
//                                       color: white,
//                                       size: 30,
//                                     ),
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     //  SizedBox(height: Screens.padingHeight(context)*0.02),

//                     SizedBox(
//                       height: Screens.padingHeight(context) * 0.02,
//                     ),

//                     Container(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Attachment 1',
//                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                       color: thirdcolor,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         Screens.padingHeight(context) * 0.005),
//                                 Container(
//                                   height: Screens.padingHeight(context) * 0.05,
//                                   width: Screens.width(context) * 0.4,
//                                   decoration: BoxDecoration(
//                                       color: grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: TextFormField(
//                                     readOnly: true,
//                                     decoration: InputDecoration(
//                                       // hintText: "Created By",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       suffixIcon: Icon(
//                                         Icons.camera_alt,
//                                         color: primarycolor,
//                                         size: 20,
//                                       ),

//                                       border: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Attachment 2',
//                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                       color: thirdcolor,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 SizedBox(
//                                     height:
//                                         Screens.padingHeight(context) * 0.005),
//                                 Container(
//                                   height: Screens.padingHeight(context) * 0.05,
//                                   width: Screens.width(context) * 0.4,
//                                   decoration: BoxDecoration(
//                                       color: grey,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: TextFormField(
//                                     readOnly: true,
//                                     decoration: InputDecoration(
//                                       // hintText: "Created By",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       suffixIcon: Icon(
//                                         Icons.camera_alt,
//                                         color: primarycolor,
//                                         size: 20,
//                                       ),

//                                       border: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                       errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide.none),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: Screens.padingHeight(context) * 0.03,
//                     ),
//                     Container(
//                       height: Screens.padingHeight(context) * 0.05,
//                       width: Screens.width(context) * 0.6,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: secondary),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: thirdcolor),
//                           onPressed: () {},
//                           child: Text(
//                             "Save",
//                             style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: white,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//               //          Padding(
//               // padding: EdgeInsets.only(
//               //     bottom: MediaQuery.of(context).viewInsets.bottom))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
