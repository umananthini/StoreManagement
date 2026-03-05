// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/TransferInwardController/transferinwardctrl.dart';

// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// class LoadTransferInwardpage extends StatefulWidget {
//   const LoadTransferInwardpage({super.key});

//   @override
//   State<LoadTransferInwardpage> createState() => _LoadTransferInwardpageState();
// }

// class _LoadTransferInwardpageState extends State<LoadTransferInwardpage> {
//   DateTime? currentBackPressTime;

//   Future<bool> onbackpress() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
//       currentBackPressTime = now;
//       if (context.read<TransferInwardctrl>().pageChanged == 1) {
//         // getQty.clear();
//         // getItemsQty();
//         // getAllQuantity();
//         // if(context.read<inwardcontroller>().isPressed==false){
//         context.read<TransferInwardctrl>().showdialogback(context);
//         // return Future.value(false);
//         //       }

//         // context.read<inwardcontroller>().pageController.animateToPage(
//         //     --context.read<inwardcontroller>().pageChanged,
//         //     duration: Duration(milliseconds: 250),
//         //     curve: Curves.bounceIn);
//         // data.clear();
//         // mycontroller[0].text = '';
//         // mycontroller[1].clear();
//         // serialScannedData = '';
//         return Future.value(false);
//       } else if (context.read<TransferInwardctrl>().pageChanged == 0) {
//         Get.offAllNamed(ConstantRoutes.transferinward);
//         return Future.value(true);
//       }
//     }
//     return Future.value(true);
//   }

//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<TransferInwardctrl>().pageChanged = 0;
//     });
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return PopScope(
//       canPop: false,
//       onPopInvoked: (bool didPop) {
//         log("didPop::$didPop");
//         if (didPop) return;
//         onbackpress();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: PageView(
//           physics: const NeverScrollableScrollPhysics(),
//           controller: context.read<TransferInwardctrl>().pageController,
//           onPageChanged: (value) {
//             log("value${value.toString()}");
//             context.read<TransferInwardctrl>().pageChanged = value;
//           },
//           children: [
//             Firstpage(context, theme),
//             SafeArea(
//               child: Container(
//                 // color: Colors.red,
//                 height: Screens.fullHeight(context),
//                 width: Screens.width(context),
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Doc No :',
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Container(
//                                 // width: Screens.width(context)*0.4,
//                                 // color: Colors.amber,
//                                 child: Text(
//                                   context
//                                       .read<TransferInwardctrl>()
//                                       .tn
//                                       .toString(),
//                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontSize: 15,
//                                     // fontWeight: FontWeight.w500
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Screens.padingHeight(context) * 0.01,
//                         ),
                    
//                         //  SizedBox(height: Screens.padingHeight(context)*0.01,),
                    
//                         Container(
//                           // color: grey,
//                           alignment: Alignment.center,
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
                           
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Screens.padingHeight(context) * 0.01,
//                         ),
                    
//                         Container(
//                           // color: grey,
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Item Code :',
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               context
//                                           .read<TransferInwardctrl>()
//                                           .TransferLoad1 !=
//                                       null
//                                   ? Container(
//                                       // width: Screens.width(context)*0.3,
//                                       // color: Colors.amber,
//                                       child: Text(
//                                         context
//                                             .read<TransferInwardctrl>()
//                                             .TransferLoad1!
//                                             .ItemCode
//                                             .toString(),
//                                         style: theme.textTheme.bodyMedium!
//                                             .copyWith(
//                                           color: Color.fromARGB(255, 0, 0, 0),
//                                           fontSize: 14,
//                                           // fontWeight: FontWeight.w500
//                                         ),
//                                       ),
//                                     )
//                                   : Container()
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Screens.padingHeight(context) * 0.01,
//                         ),
                    
//                         Container(
//                           // color: grey,
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Quantity :',
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               context
//                                           .read<TransferInwardctrl>()
//                                           .TransferLoad1 !=
//                                       null
//                                   ? Container(
//                                       // width: Screens.width(context)*0.3,
//                                       // color: Colors.amber,
//                                       child: Text(
//                                         " ${context.read<TransferInwardctrl>().ScannedQty()}/${context.read<TransferInwardctrl>().TransferLoad1!.Quantity.toString()}",
//                                         style: theme.textTheme.bodyMedium!
//                                             .copyWith(
//                                           color: Color.fromARGB(255, 0, 0, 0),
//                                           fontSize: 14,
//                                           // fontWeight: FontWeight.w500
//                                         ),
//                                       ),
//                                     )
//                                   : Container()
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: Screens.padingHeight(context) * 0.03,
//                               left: Screens.width(context) * 0.03,
//                               right: Screens.width(context) * 0.03),
//                           decoration: const BoxDecoration(
//                               color: grey,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   topRight: Radius.circular(30))),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           "Managed By :",
//                                           style: theme.textTheme.bodyMedium!
//                                               .copyWith(
//                                                   color: const Color.fromARGB(
//                                                       255, 120, 120, 120),
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 14),
//                                         ),
//                                         Container(
//                                             // alignment: Alignment.center,
//                                             width: Screens.width(context) * 0.2,
//                                             // color: Colors.amber,
//                                             child: Text(
//                                               "S", 
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       // color: const Color.fromARGB(255, 120, 120, 120),
//                                                       fontWeight: FontWeight.w500,
//                                                       fontSize: 14),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
                              
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: Screens.padingHeight(context) * 0.02,
//                               ),
                            
//                               SizedBox(
//                                 height: Screens.padingHeight(context) * 0.02,
//                               ),
//                               Container(
//                                 height: Screens.padingHeight(context) * 0.06,
//                                 decoration: BoxDecoration(
//                                     color: white,
//                                     border: Border.all(color: Color.fromARGB(27, 0, 0, 0)
//                                     ),
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: TextFormField(
//                                   cursorColor: primarycolor,
//                                   controller: context
//                                       .read<TransferInwardctrl>()
//                                       .scanserialctrl1,
//                                   onEditingComplete: () {
//                                     setState(() {
//                                       context
//                                               .read<TransferInwardctrl>()
//                                               .scanedvalueee =
//                                           context
//                                               .read<TransferInwardctrl>()
//                                               .scanserialctrl1
//                                               .text;
//                                       context
//                                           .read<TransferInwardctrl>()
//                                           .afterserialscanned(
//                                               context
//                                                   .read<TransferInwardctrl>()
//                                                   .scanedvalueee
//                                                   .toString(),
//                                               context);
//                                     });
//                                   },
//                                   decoration: InputDecoration(
                                    
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: Screens.padingHeight(context) * 0,
//                                         horizontal: Screens.width(context) * 0.01),
//                                     hintText: "Scan Serial Number",
//                                     hintStyle: const TextStyle(
//                                         color: Colors.grey, fontSize: 14),
//                                     suffixIcon: InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           QRscannerState.detailsoutwardscan=false;
//                                           QRscannerState.transferinw =true;
//                                           Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           const QRscanner()))
//                                               .then((value) {
//                                                 QRscannerState.transferinw =false;
//                                             context
//                                                     .read<TransferInwardctrl>()
//                                                     .scanserialctrl1
//                                                     .text =
//                                                 context
//                                                     .read<TransferInwardctrl>()
//                                                     .scanedvalueee
//                                                     .toString();
//                                             context
//                                                 .read<TransferInwardctrl>()
//                                                 .afterserialscanned(
//                                                     context
//                                                     .read<TransferInwardctrl>()
//                                                     .scanserialctrl1
//                                                     .text,
//                                                     context);
//                                           });
//                                         });
//                                       },
//                                       child: const Icon(
//                                         Icons.qr_code_2,
//                                         color: primarycolor,
//                                         size: 30,
//                                       ),
//                                     ),
//                                     border: const OutlineInputBorder(
//                                         borderSide: BorderSide.none),
//                                     focusedBorder: const OutlineInputBorder(
//                                         borderSide: BorderSide.none),
//                                     enabledBorder: const OutlineInputBorder(
//                                         borderSide: BorderSide.none),
//                                     errorBorder: const OutlineInputBorder(
//                                         borderSide: BorderSide.none),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: Screens.padingHeight(context)*0.01,),
//                             // Container(
//                             //   padding: EdgeInsets.symmetric(
//                             //     horizontal: Screens.width(context)*0.03
//                             //   ),
//                             //  child: Row(
//                             //   children: [
//                             //     Container(
//                             //         width: Screens.width(context)*0.58,
//                             //         child: Text("Serial Num",
//                             //         style: theme.textTheme.bodyMedium!.copyWith(
//                             //           fontWeight: FontWeight.bold
//                             //         ),
//                             //         ),
//                             //     ),
//                             //       Container(
//                             //         // width: Screens.width(context)*0.55,
//                             //         child: Text("Quantity",
//                             //           style: theme.textTheme.bodyMedium!.copyWith(
//                             //           fontWeight: FontWeight.bold
//                             //         ),
//                             //         ),
//                             //     )
//                             //   ],
//                             //  ),
//                             // ),
//                               Expanded(
//                                 child: Container(
//                                   color: grey,
//                                   height: Screens.padingHeight(context) * 0.5,
//                                   width: Screens.width(context),
//                                   child: ListView.builder(
//                                     itemCount: context
//                                         .watch<TransferInwardctrl>()
//                                         .DBdata
//                                         .length,
//                                     itemBuilder: (context, index) {
//                                       return Container(
//                                         padding: EdgeInsets.symmetric(
//                                           vertical:Screens.padingHeight(context)*0.005,
//                                           horizontal:Screens.width(context)*0.005,

//                                         ),
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal:
//                                                   Screens.width(context) * 0.02,
//                                               vertical:
//                                                   Screens.padingHeight(context) *
//                                                       0.01),
//                                           decoration: BoxDecoration(
//                                                  boxShadow: 
//                                     [BoxShadow(
//                                       color: Color.fromARGB(255, 239, 239, 239),
//                                       blurRadius: 5,
//                                       spreadRadius: 4
//                                     )],
//                                             borderRadius: BorderRadius.circular(10),
//                                             color: white,
//                                             //                  boxShadow: [
//                                             //   BoxShadow(
//                                             //     color:fourthcolor,
//                                             //     blurRadius: 4,
//                                             //     spreadRadius:0.5
//                                             //   )
//                                             // ]
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                     vertical: Screens.padingHeight(
//                                                             context) *
//                                                         0.01,
//                                                           horizontal: Screens.width(context) * 0.01,
//                                                         ),
                                              
//                                                 width: Screens.width(context)*0.55,
                                                
//                                                 // color: Colors.amber,
                                                                              
//                                                 // decoration: BoxDecoration(),
//                                                 child: Text(
//                                                   context
//                                                       .read<TransferInwardctrl>()
//                                                       .DBdata[index]
//                                                       .serialnum
//                                                       .toString(),
//                                                   // textAlign: TextAlign.center,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 width: Screens.width(context) * 0.1,
//                                                 // color: Color.fromARGB(255, 7, 65, 255),
                                                                              
//                                                 child: Text(context
//                                                     .read<TransferInwardctrl>()
//                                                     .DBdata[index] 
//                                                     .scannedqty
//                                                     .toString()),
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     context
//                                                         .read<TransferInwardctrl>()
//                                                         .deletedata(index);
//                                                   });
//                                                 },
//                                                 child: const Icon(
//                                                   Icons.delete,
//                                                   color: Colors.red,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )),
//                     Container(
//                       height: Screens.padingHeight(context) * 0.065,
//                       width: Screens.width(context)*0.85,
//                       decoration: const BoxDecoration(
                        
//                           ),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: thirdcolor,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               FocusScope.of(context).unfocus();
//                               context.read<TransferInwardctrl>().savedbinw();
//                             });
//                           },
//                           child: Text(
//                             "Save And Back",
//                             style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: white,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Container second(BuildContext context) {
//     return Container(
//       height: Screens.bodyheight(context),
//       width: 200,
//       color: Colors.pink,
//     );
//   }

//   Container Firstpage(BuildContext context, ThemeData theme) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: Screens.padingHeight(context) * 0.05,
//         left: Screens.width(context) * 0.03,
//         right: Screens.width(context) * 0.03,
//       ),
//       height: Screens.fullHeight(context),
//       width: Screens.width(context),
//       color: grey,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               // height: Screens.padingHeight(context) * 0.06,
//               decoration: BoxDecoration(
//                   color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//               child: TextFormField(
//                   onChanged: (v) { 
//                       context
//                           .read<TransferInwardctrl>()
//                           .SearchFiltertrans(v);
//                     },
//                 cursorColor: thirdcolor,
//                 decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.all(0),
//                   hintText: "Search",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: primarycolor,
//                   ),
//                   border: OutlineInputBorder(borderSide: BorderSide.none),
//                   focusedBorder:
//                       OutlineInputBorder(borderSide: BorderSide.none),
//                   enabledBorder:
//                       OutlineInputBorder(borderSide: BorderSide.none),
//                   errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Screens.padingHeight(context) * 0.02,
//             ),
//             Container(
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Trans No :',
//                     style: theme.textTheme.bodyMedium!.copyWith(
//                         color: const Color.fromARGB(255, 93, 93, 93),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Container(
//                     // width: Screens.width(context)*0.4,
//                     // color: Colors.seriamber,
//                     child: Text(
//                       context.read<TransferInwardctrl>().tn.toString(),
//                       style: theme.textTheme.bodyMedium!.copyWith(
//                         color: const Color.fromARGB(255, 29, 29, 29),

//                         fontSize: 14,
//                         // fontWeight: FontWeight.w500
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
          
            
//             SizedBox(
//               height: Screens.padingHeight(context) * 0.02,
//             ),

//             // Container(
//             //   child: Row(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Container(
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Text(
//             //               'Vendor Invoice No.',
//             //               style: theme.textTheme.bodyMedium!.copyWith(
//             //                   color: thirdcolor, fontWeight: FontWeight.w400),
//             //             ),
//             //             SizedBox(height: Screens.padingHeight(context) * 0.005),
//             //             Container(
//             //               height: Screens.padingHeight(context) * 0.05,
//             //               width: Screens.width(context) * 0.4,
//             //               decoration: BoxDecoration(
//             //                   color: grey,
//             //                   borderRadius: BorderRadius.circular(10)),
//             //               child: TextFormField(
//             //                 decoration: const InputDecoration(
//             //                   // hintText: "Created By",
//             //                   hintStyle: TextStyle(color: Colors.grey),
//             //                   // suffixIcon: Icon(Icons.camera_alt,
//             //                   // color: primarycolor,
//             //                   // size: 30,

//             //                   // ),

//             //                   border: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   focusedBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   enabledBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   errorBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       Container(
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Text(
//             //               'Invoice Date',
//             //               style: theme.textTheme.bodyMedium!.copyWith(
//             //                   color: thirdcolor, fontWeight: FontWeight.w400),
//             //             ),
//             //             SizedBox(height: Screens.padingHeight(context) * 0.005),
//             //             Container(
//             //               height: Screens.padingHeight(context) * 0.05,
//             //               width: Screens.width(context) * 0.4,
//             //               decoration: BoxDecoration(
//             //                   color: grey,
//             //                   borderRadius: BorderRadius.circular(10)),
//             //               child: TextFormField(
//             //                 decoration: const InputDecoration(
//             //                   // hintText: "Created By",
//             //                   hintStyle: TextStyle(color: Colors.grey),
//             //                   // suffixIcon: Icon(Icons.camera_alt,
//             //                   // color: primarycolor,
//             //                   // size: 30,

//             //                   // ),

//             //                   border: const OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   focusedBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   enabledBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   errorBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),

//             SizedBox(
//               height: Screens.padingHeight(context) * 0.01,
//             ),

//             Container(
//               // color: Colors.amber,
//               height: Screens.bodyheight(context) * 0.76,
//               width: Screens.width(context),
//               child: context.read<TransferInwardctrl>().TransferInward.isEmpty
//                   ? Center(
//                       child: Container(
//                         child: const Text("No Data"),
//                       ),
//                     )
//                   : context.read<TransferInwardctrl>().loadtransinwloading ==
//                           true
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: primarycolor,
//                           ),
//                         )
//                       : context
//                               .read<TransferInwardctrl>()
//                               .TransferInward.isEmpty? Container(
//                               // height: Screens.padingHeight(context),
//                               // width: Screens.,
//                               child: Column(
//                                 children: [
//                                    SizedBox(height: Screens.padingHeight(context)*0.1),
//                                   Image.asset("Assets/error-file.png",
//                                   height: Screens.padingHeight(context)*0.08,
//                                   width: Screens.width(context)*0.4,
//                                   ),
//                                    SizedBox(height: Screens.padingHeight(context)*0.02),

//                                   Text("No Data..!"),
//                                 ],
//                               )): ListView.builder(
//                           padding: const EdgeInsets.all(0),
//                           shrinkWrap: true,
//                           itemCount: context
//                               .read<TransferInwardctrl>()
//                               .TransferInward
//                               .length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   context
//                                       .read<TransferInwardctrl>()
//                                       .scanserialctrl1
//                                       .clear();
//                                   context.read<TransferInwardctrl>().indexx =
//                                       index;

//                                   context
//                                       .read<TransferInwardctrl>()
//                                       .dataget(context);
//                                   context
//                                           .read<TransferInwardctrl>()
//                                           .TransferLoad1 =
//                                       context
//                                           .read<TransferInwardctrl>()
//                                           .TransferInward[index];
//                                 });

//                                 context
//                                     .read<TransferInwardctrl>()
//                                     .SingleItemAdded(context
//                                         .read<TransferInwardctrl>()
//                                         .TransferInward[index]);

//                                 context
//                                     .read<TransferInwardctrl>()
//                                     .firstbuttonclicked();
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context)*0.005
//                                 ),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: Screens.width(context) * 0.02,
//                                       vertical:
//                                           Screens.padingHeight(context) * 0.01),
//                                   decoration: BoxDecoration(
//                                     color: white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: 
//                                     [BoxShadow(
//                                       color: Color.fromARGB(255, 239, 239, 239),
//                                       blurRadius: 5,
//                                       spreadRadius: 4
//                                     )]                               //                  boxShadow: [
//                                     //   BoxShadow(
//                                     //     color:fourthcolor,
//                                     //     blurRadius: 4,
//                                     //     spreadRadius:0.5
//                                     //   )
//                                     // ]
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             width: Screens.width(context) * 0.6,
//                                             // color: Colors.amber,
//                                             child: Text(
//                                               context
//                                                   .read<TransferInwardctrl>()
//                                                   .TransferInward[index]
//                                                   .ItemCode
//                                                   .toString(),
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                 color: const Color.fromARGB(
//                                                     255, 154, 154, 154),
//                                                 // fontWeight: FontWeight.w600
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.01,
//                                           ),
//                                           Container(
//                                             width: Screens.width(context) * 0.6,
//                                             // color: Colors.amber,
//                                             child: Text(
//                                               context
//                                                   .read<TransferInwardctrl>()
//                                                   .TransferInward[index]
//                                                   .ItemName
//                                                   .toString(),
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                 color: const Color.fromARGB(
//                                                     255, 154, 154, 154),
//                                                 // fontWeight: FontWeight.w600
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.01,
//                                           ),
//                                           Container(
//                                             width: Screens.width(context) * 0.6,
//                                             // color: Colors.amber,
//                                             child: Row(
//                                               children: [
//                                                 Text(
//                                                   "Quantity :",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                           color: const Color
//                                                               .fromARGB(255,
//                                                               154, 154, 154),
//                                                           fontWeight:
//                                                               FontWeight.w600),
//                                                 ),
//                                                 Container(
//                                                   width:
//                                                       Screens.width(context) *
//                                                           0.3,
//                                                   // color: Colors.amber,
//                                                   child: Text(
//                                                     " ${context.read<TransferInwardctrl>().filtergetqty.length == 0 || context.read<TransferInwardctrl>().filtergetqty.isEmpty ? '0' : context.read<TransferInwardctrl>().filtergetqty[index]}/${context.read<TransferInwardctrl>().TransferInward[index].Quantity.toString()}",
//                                                     style: theme
//                                                         .textTheme.bodyMedium!
//                                                         .copyWith(
//                                                       color:
//                                                           const Color.fromARGB(
//                                                               255, 1, 1, 1),
//                                                       // fontWeight: FontWeight.w600
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Container( 
//                                           height:
//                                               Screens.padingHeight(context) *
//                                                   0.05,
//                                           width: Screens.width(context) * 0.13,
//                                           decoration: const BoxDecoration(
//                                               color: thirdcolor,
//                                               shape: BoxShape.circle),
//                                           child: Container(
//                                             child: const Icon(
//                                               Icons.keyboard_arrow_right,
//                                               color: white,
//                                               size: 30,
//                                             ),
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//             ),
//             SizedBox(
//               height: Screens.padingHeight(context) * 0.025,
//             ),
                        
//             // Container(
//             //   child: Row(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Container(
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Text(
//             //               'Attachment 1',
//             //               style: theme.textTheme.bodyMedium!.copyWith(
//             //                   color: thirdcolor,
//             //                   fontWeight: FontWeight.w400),
//             //             ),
//             //             SizedBox(
//             //                 height:
//             //                     Screens.padingHeight(context) * 0.005),
//             //             Container(
//             //               height: Screens.padingHeight(context) * 0.05,
//             //               width: Screens.width(context) * 0.4,
//             //               decoration: BoxDecoration(
//             //                   color: grey,
//             //                   borderRadius: BorderRadius.circular(10)),
//             //               child: TextFormField(
//             //                 readOnly: true,
//             //                 decoration: const InputDecoration(
//             //                   // hintText: "Created By",
//             //                   hintStyle: TextStyle(color: Colors.grey),
//             //                   suffixIcon: Icon(
//             //                     Icons.camera_alt,
//             //                     color: primarycolor,
//             //                     size: 20,
//             //                   ),
                        
//             //                   border: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   focusedBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   enabledBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   errorBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       Container(
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Text(
//             //               'Attachment 2',
//             //               style: theme.textTheme.bodyMedium!.copyWith(
//             //                   color: thirdcolor,
//             //                   fontWeight: FontWeight.w400),
//             //             ),
//             //             SizedBox(
//             //                 height:
//             //                     Screens.padingHeight(context) * 0.005),
//             //             Container(
//             //               height: Screens.padingHeight(context) * 0.05,
//             //               width: Screens.width(context) * 0.4,
//             //               decoration: BoxDecoration(
//             //                   color: grey,
//             //                   borderRadius: BorderRadius.circular(10)),
//             //               child: TextFormField(
//             //                 readOnly: true,
//             //                 decoration: const InputDecoration(
//             //                   // hintText: "Created By",
//             //                   hintStyle: TextStyle(color: Colors.grey),
//             //                   suffixIcon: Icon(
//             //                     Icons.camera_alt,
//             //                     color: primarycolor,
//             //                     size: 20,
//             //                   ),
                        
//             //                   border: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   focusedBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   enabledBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                   errorBorder: OutlineInputBorder(
//             //                       borderSide: BorderSide.none),
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: Screens.padingHeight(context) * 0.03,
//             // ),
//             // Expanded(child: Container()),
//             Container(
//               height: Screens.padingHeight(context) * 0.06,
//               width: Screens.width(context) ,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: thirdcolor,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//                 // onPressed: () {},
//                 onPressed: context
//                             .watch<TransferInwardctrl>()
//                             .saveenablebutton ==
//                         false
//                     // context
//                     //             .watch<inwardcontroller>()
//                     //             .grpTotal !=
//                     //         context
//                     //             .read<inwardcontroller>()
//                     //             .getqty
//                     ? null
//                     : context.watch<TransferInwardctrl>().finallodaing ==
//                             true
//                         ? null
//                         : () {
//                             context
//                                 .read<TransferInwardctrl>()
//                                 .savefinal(context);
//                           },
//                 child: context.watch<TransferInwardctrl>().finallodaing ==
//                         false
//                     ? Text('Save',
//                         style: theme.textTheme.bodyMedium!.copyWith(
//                           color: grey,
//                         ))
//                     : SpinKitThreeBounce(
//                         size: Screens.width(context) * 0.05,
//                         color: Colors.white,
//                       ),
//               ),
//             ),
//             //          Padding(
//             // padding: EdgeInsets.only(
//             //     bottom: MediaQuery.of(context).viewInsets.bottom))
//           ],
//         ),
//       ),
//     );
//   }
// }
