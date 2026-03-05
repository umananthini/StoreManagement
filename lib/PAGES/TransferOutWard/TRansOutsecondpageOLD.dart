// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/TransferOutwardController/getoutwardctrl.dart';
// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// import '../../CONSTANT/constantrouts.dart';

// class TransOutsecondpage extends StatefulWidget {
//   const TransOutsecondpage({super.key});

//   @override
//   State<TransOutsecondpage> createState() => _TransOutsecondpageState();
// }

// class _TransOutsecondpageState extends State<TransOutsecondpage> {
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<TransferOutwardctrl>().secondpageint();
//     });
//   }

//   DateTime? currentBackPressTime;

//   Future<bool> onbackpress() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
//       currentBackPressTime = now;
//       if (context.read<TransferOutwardctrl>().pageChanged == 1) {
//         // getQty.clear();
//         // getItemsQty();
//         // getAllQuantity();
//         // if(context.read<inwardcontroller>().isPressed==false){
//         context.read<TransferOutwardctrl>().showdialogback(context);
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
//         return Future.value(true);
//       } else if (context.read<TransferOutwardctrl>().pageChanged == 0){
//         Get.offAllNamed(ConstantRoutes.transferoutward);
//         return Future.value(true);
//       }
//     }
//     return Future.value(true);
//   }
// GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
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
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             child: PageView(
//           physics: const NeverScrollableScrollPhysics(),
//           controller: context.read<TransferOutwardctrl>().pageController,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Screens.width(context) * 0.03,
//                   vertical: Screens.padingHeight(context) * 0.02),
//               child: Form(
//                 key: formkey2,
//                 child: Column(
//                   children: [
//             //          Container(
//             //   // height: Screens.padingHeight(context) * 0.06,
//             //   decoration: BoxDecoration(
//             //       color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//             //   child: TextFormField(
//             //           onChanged: (v) { 
//             //           context
//             //               .read<TransferOutwardctrl>().secondOutwardfilterdetails
//             //               (v);
//             //         },
//             //         cursorColor: thirdcolor,
//             //     decoration: const InputDecoration(
//             //       contentPadding: EdgeInsets.all(0),
//             //       hintText: "Search",
//             //       hintStyle: TextStyle(color: Colors.grey),
//             //       prefixIcon: Icon(
//             //         Icons.search,
//             //         color: primarycolor,
//             //       ),
//             //       border: OutlineInputBorder(borderSide: BorderSide.none),
//             //       focusedBorder:
//             //           OutlineInputBorder(borderSide: BorderSide.none),
//             //       enabledBorder:
//             //           OutlineInputBorder(borderSide: BorderSide.none),
//             //       errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
//             //     ),
//             //   ),
//             // ),
                   
                   
                   
                   
                   
//                     // Container(
                   
//                     //   child: TextFormField(
//                     //       onChanged: (v) { 
//                     //   context
//                     //       .read<TransferOutwardctrl>().secondOutwardfilterdetails
//                     //       (v);
//                     // },
//                     //     cursorColor: primarycolor,
//                     //     decoration: InputDecoration(
//                     //         border: InputBorder.none,
//                     //         enabledBorder: InputBorder.none,
//                     //         focusedBorder: InputBorder.none,
//                     //         isDense: true,
//                     //         contentPadding: const EdgeInsets.symmetric(
//                     //             horizontal: 15, vertical: 17),
//                     //         filled: true,
//                     //         fillColor: Colors.grey.shade100,
//                     //         prefixIconConstraints: const BoxConstraints(
//                     //             maxHeight: 30, minWidth: 20),
                           
//                     //         hintText: "Search here"),
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: Screens.padingHeight(context) * 0.01,
//                     ),
//                     context.read<TransferOutwardctrl>().selectedtransno2 !=
//                                 null &&
//                             context
//                                 .read<TransferOutwardctrl>()
//                                 .selectedtransno2!
//                                 .isNotEmpty
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "TransNo :",
//                                     style: theme.textTheme.bodyMedium!
//                                         .copyWith(color: Colors.grey),
//                                   ),
//                                   Text(
//                                     context
//                                         .read<TransferOutwardctrl>()
//                                         .selectedtransno2
//                                         .toString(),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         : Container(),
//                     SizedBox(
//                       height: Screens.padingHeight(context) * 0.02,
//                     ),
//                     Expanded(
//                         child: context
//                                     .watch<TransferOutwardctrl>()
//                                     .itempageloading ==
//                                 true
//                             ? const Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : context
//                                     .read<TransferOutwardctrl>()
//                                     .itemdetailslist
//                                     .isEmpty
//                                 ? const Center(
//                                     child: Text("No data..!"),
//                                   )
//                                 :context
//                                     .read<TransferOutwardctrl>().searchfilterseconditemdetailslist.isEmpty? Container(
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
//                                     shrinkWrap: true,
//                                     itemCount: context
//                                         .read<TransferOutwardctrl>()
//                                         .searchfilterseconditemdetailslist
//                                         .length,
//                                     itemBuilder: (context, ind) {
//                                       return InkWell(
//                                         onTap: () async {
//                                           context
//                                               .read<TransferOutwardctrl>()
//                                               .thirdindex = null;
//                                           context
//                                               .read<TransferOutwardctrl>()
//                                               .thirdOutwarditems = null;
//                                           context 
//                                               .read<TransferOutwardctrl>()
//                                               .thirdindex = ind;
//                                           context
//                                                   .read<TransferOutwardctrl>()
//                                                   .thirdOutwarditems =
//                                               context
//                                                   .read<TransferOutwardctrl>()
//                                                   .searchfilterseconditemdetailslist[ind];

//                                           // await  context
//                                           //       .read<TransferOutwardctrl>()
//                                           //       .dataget(context);
//                                           context
//                                               .read<TransferOutwardctrl>()
//                                               .Thirdpageclicked(context);
//                                         },
//                                        child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: Screens.padingHeight(context)*0.005,
//                                       horizontal: Screens.width(context)*0.01

//                                     ),
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               Screens.width(context) * 0.02,
//                                           vertical:
//                                               Screens.padingHeight(context) *
//                                                   0.02),
//                                        decoration:BoxDecoration(
//                                       color: white,
//                                     borderRadius: BorderRadius.circular(10),

//                                          boxShadow: 
//                                     [BoxShadow(
//                                       color: Color.fromARGB(255, 239, 239, 239),
//                                       blurRadius: 5,
//                                       spreadRadius: 4
//                                     )]                     
//                                        ) ,
//                                       // height: Screens.padingHeight(context)*0.3,
//                                       width: Screens.width(context),
//                                       child: Column(
//                                         children: [
//                                               IntrinsicHeight(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .stretch,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: Screens.width(
//                                                               context) *
//                                                           0.7,
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             "${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ItemCode}",
//                                                             style: theme
//                                                                 .textTheme
//                                                                 .bodyMedium!
//                                                                 .copyWith(
//                                                               color: const Color
//                                                                   .fromARGB(
//                                                                   255,
//                                                                   154,
//                                                                   154,
//                                                                   154),
//                                                               // fontWeight: FontWeight.w600
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: Screens
//                                                                     .padingHeight(
//                                                                         context) *
//                                                                 0.005,
//                                                           ),
//                                                           Text(
//                                                             "${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ItemDetails}",
//                                                             style: theme
//                                                                 .textTheme
//                                                                 .bodyMedium!
//                                                                 .copyWith(
//                                                               color: const Color
//                                                                   .fromARGB(
//                                                                   255,
//                                                                   154,
//                                                                   154,
//                                                                   154),
//                                                               // fontWeight: FontWeight.w600
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: Screens
//                                                                     .padingHeight(
//                                                                         context) *
//                                                                 0.005,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               Text(
//                                                                 " Qty :",
//                                                                 style: theme
//                                                                     .textTheme
//                                                                     .bodyMedium!
//                                                                     .copyWith(
//                                                                   color: const Color
//                                                                       .fromARGB(
//                                                                       255,
//                                                                       154,
//                                                                       154,
//                                                                       154),
//                                                                   // fontWeight: FontWeight.w600
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 " ${context.read<TransferOutwardctrl>().getqty.length == 0 || context.read<TransferOutwardctrl>().getqty.isEmpty ? '0' : context.read<TransferOutwardctrl>().getqty[ind]}/${context.read<TransferOutwardctrl>().searchfilterseconditemdetailslist[ind].ReqQty}",
//                                                                 style: theme
//                                                                     .textTheme
//                                                                     .bodyMedium!
//                                                                     .copyWith(
//                                                                   fontSize:
//                                                                       13,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: Screens
//                                                                     .padingHeight(
//                                                                         context) *
//                                                                 0.005,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                         height:
//                                             Screens.padingHeight(context) *
//                                                 0.05,
//                                         width: Screens.width(context) * 0.13,
//                                         decoration: const BoxDecoration(
//                                             color: thirdcolor,
//                                             shape: BoxShape.circle),
//                                         child: Container(
//                                           child: const Icon(
//                                             Icons.keyboard_arrow_right,
//                                             color: white,
//                                             size: 30,
//                                           ),
//                                         ))
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ));
//                                     })),
//                     TextFormField(
//                       cursorColor: primarycolor,
//                       controller: context
//                           .read<TransferOutwardctrl>()
//                           .commentscontroller,
//                       validator: (v) {
//                         if (v!.isEmpty) {
//                           return "*Remarks Required";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         isDense: true,
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 12),
//                         labelText: "Remarks",
                      
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                         focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                         errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(7)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: Screens.padingHeight(context) * 0.01,
//                     ),
//                     SizedBox(
//                       width: Screens.width(context),
//                       height: Screens.padingHeight(context) * 0.06,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: thirdcolor),
//                           onPressed: context
//                                       .watch<TransferOutwardctrl>()
//                                       .saveenablebutton ==
//                                   false
//                               // context
//                               //             .watch<inwardcontroller>()
//                               //             .grpTotal !=
//                               //         context
//                               //             .read<inwardcontroller>()
//                               //             .getqty
//                               ? null
//                               : context
//                                           .watch<TransferOutwardctrl>()
//                                           .finallodaing ==
//                                       true
//                                   ? null
//                                   : () {
//                                       if (formkey2
//                                           .currentState!
//                                           .validate()) {
//                                         context
//                                             .read<TransferOutwardctrl>()
//                                             .savefinal(context);
//                                       }
//                                     },
//                           child: context
//                                       .watch<TransferOutwardctrl>()
//                                       .finallodaing ==
//                                   false
//                               ? const Text("Save")
//                               : SpinKitThreeBounce(
//                                   size: Screens.width(context) * 0.05,
//                                   color: Colors.white,
//                                 )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             context.read<TransferOutwardctrl>().thirdOutwarditems == null
//                 ? Container()
//                 : Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: Screens.width(context) * 0.03,
//                         vertical: Screens.padingHeight(context) * 0.02),
//                     child: Column(
//                       children: [
//                         Expanded(
//                             child: Column(
//                           children: [
//                             Text(
//                               "Trans No : ${context.read<TransferOutwardctrl>().thirdOutwarditems!.TransNo.toString()}",
//                               style: theme.textTheme.bodyLarge!
//                                   .copyWith(fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: Screens.padingHeight(context) * 0.01,
//                             ),
//                             Container(
//                               width: Screens.width(context) * 0.7,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Trans Item : ${context.read<TransferOutwardctrl>().thirdOutwarditems!.ItemDetails.toString()}",
//                                 textAlign: TextAlign.center,
//                                 style: theme.textTheme.bodyLarge!
//                                     .copyWith(fontSize: 15),
//                               ),
//                             ),
//                             SizedBox(
//                               height: Screens.padingHeight(context) * 0.01,
//                             ),
//                             Text(
//                               "Qty : ${context.read<TransferOutwardctrl>().scannedQty()}/${context.read<TransferOutwardctrl>().thirdOutwarditems!.ReqQty!.toStringAsFixed(0)}",
//                               style: theme.textTheme.bodyLarge!
//                                   .copyWith(fontSize: 15),
//                             ),
//                             SizedBox(
//                               height: Screens.padingHeight(context) * 0.01,
//                             ),
//                             Container(
//                               width: Screens.width(context),
//                               height: Screens.padingHeight(context) * 0.06,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(05),
//                                   border: Border.all(color: Colors.grey)),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     // color: Colors.deepOrange,
//                                     width: Screens.width(context) * 0.78,

//                                     child: TextFormField(
//                                       controller: context
//                                           .read<TransferOutwardctrl>()
//                                           .scancontroller,
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "Required *";
//                                         }

//                                         return null;
//                                       },
//                                       decoration: InputDecoration(
//                                           hintText: 'Scan Serial Number',
//                                           contentPadding: EdgeInsets.symmetric(
//                                               vertical: Screens.padingHeight(
//                                                       context) *
//                                                   0.01,
//                                               horizontal:
//                                                   Screens.width(context) *
//                                                       0.01),
//                                           border: InputBorder.none),
//                                       onEditingComplete: () {
//                                         context
//                                                 .read<TransferOutwardctrl>()
//                                                 .scanedvalueee =
//                                             context
//                                                 .read<TransferOutwardctrl>()
//                                                 .scancontroller
//                                                 .text;
//                                         context
//                                             .read<TransferOutwardctrl>()
//                                             .afterserialScanned(
//                                                 context
//                                                     .read<TransferOutwardctrl>()
//                                                     .scanedvalueee
//                                                     .toString(),
//                                                 context);
//                                       },
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         context
//                                             .read<TransferOutwardctrl>()
//                                             .scanedvalueee = null;
//                                         QRscannerState.detailsoutwardscan =
//                                             true;
//                                       });

//                                       Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       const QRscanner()))
//                                           .then((value) {
//                                         context
//                                                 .read<TransferOutwardctrl>()
//                                                 .scancontroller
//                                                 .text =
//                                             context
//                                                 .read<TransferOutwardctrl>()
//                                                 .scanedvalueee
//                                                 .toString();
//                                         context
//                                             .read<TransferOutwardctrl>()
//                                             .afterserialScanned(
//                                                 context
//                                                     .read<TransferOutwardctrl>()
//                                                     .scanedvalueee
//                                                     .toString(),
//                                                 context);
//                                       });
//                                     },
//                                     child: Container(
//                                         padding: EdgeInsets.only(
//                                             right:
//                                                 Screens.width(context) * 0.02),
//                                          child: const Icon(
//                                           Icons.qr_code,
//                                           color: thirdcolor,
//                                           size: 30,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: Screens.padingHeight(context) * 0.02,
//                             ),
//                           context.read<TransferOutwardctrl>().showlist ==null || context.read<TransferOutwardctrl>().showlist.isEmpty?Container():  Expanded(
//                                 child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: context
//                                   .read<TransferOutwardctrl>()
//                                   .showlist
//                                   .length,
//                               itemBuilder: (con, ind) {
//                          return Container(
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
//                                           ),                                    child: Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               "${context.read<TransferOutwardctrl>().showlist
//                                               [ind].serialnum.toString()}",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(),
//                                             ),
//                                             Text(
//                                               "${context.read<TransferOutwardctrl>().showlist[ind].scannedqty}",
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(),
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 setState(() {
//                                                   context
//                                                       .read<
//                                                           TransferOutwardctrl>()
//                                                       .deleterequest(ind);
//                                                 });
//                                               },
//                                               child: const Icon(
//                                                 Icons.delete,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ))
//                           ],
//                         )),
//                         SizedBox(
//                           height: Screens.padingHeight(context) * 0.01,
//                         ),
//                         SizedBox(
//                           width: Screens.width(context),
//                           height: Screens.padingHeight(context) * 0.06,
//                           // color: primarycolor,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: thirdcolor),
//                               onPressed: () {
//                                 FocusScope.of(context).unfocus();
//                                 context.read<TransferOutwardctrl>().savedbinw();
//                               },
//                               child: const Text(
//                                 "Save And Back",
//                                 style: TextStyle(color: Colors.white),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//           ],
//         )),
//       ),
//     );
//   }
// }
