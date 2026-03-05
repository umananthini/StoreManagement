// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// class PurchaseInwSecond extends StatefulWidget {
//   const PurchaseInwSecond({super.key});

//   @override
//   State<PurchaseInwSecond> createState() => _PurchaseInwSecondState();
// }
// class _PurchaseInwSecondState extends State<PurchaseInwSecond> {
//   @override
// Future<void> Selecteddate() async {
//   DateTime? picked = await showDatePicker(
//     context: context,
//     firstDate: DateTime(2000),
//     lastDate: DateTime.now(),
//     initialDate: DateTime.now(),
//     builder: (context, child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           colorScheme: ColorScheme.light(
//             primary: thirdcolor, // header background color + selected date
//             onPrimary: Colors.white, // text color on header
//             onSurface: Colors.black, // default text color
//           ),
//           dialogBackgroundColor: Colors.white, // background of dialog
//         ),
//         child: child!, // keep the actual date picker
//       );
//     },
//   );

//   if (picked != null) {
//     context.read<PurchaseInwardCtrl>().invoicedatecontroller.text =
//         "${picked.day}-${picked.month}-${picked.year}";
//   }
// }

//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    
//     });
//   }

//   DateTime? currentBackPressTime;

//   Future<bool> onbackpress() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
//       currentBackPressTime = now;
//       if (context.read<PurchaseInwardCtrl>().pageChanged == 1) {
     
//         context.read<PurchaseInwardCtrl>().showdialogback(context);
      
//         return Future.value(false); 
//       } else if (context.read<PurchaseInwardCtrl>().ischeckloading ==false&& context.read<PurchaseInwardCtrl>().pageChanged == 0) {
//         Get.offAllNamed(ConstantRoutes.purchaseinwnew);
//         return Future.value(true);
//       }
//     }
//     return Future.value(true);
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
//         resizeToAvoidBottomInset: false,
//         backgroundColor:grey,
//         body: SafeArea(
//           child: PageView(
//             physics: new NeverScrollableScrollPhysics(),
//             controller: context.read<PurchaseInwardCtrl>().pageController,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(
//                     vertical: Screens.padingHeight(context) * 0.01,
//                     horizontal: Screens.width(context) * 0.03),
//                     color: grey,
//                 child: Form(
//                   key: context.read<PurchaseInwardCtrl>().formkey2,
//                   child: Column(
//                     children: [
//             //            Container(
//             //   // height: Screens.padingHeight(context) * 0.06,
//             //   decoration: BoxDecoration(
//             //       color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//             //   child: TextFormField(
//             //           onChanged: (v) { 
//             //             context
//             //               .read<PurchaseInwardCtrl>().filtersecondvendoritem
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
//                       // Container(
//                       //   child: TextFormField(
//                       //     decoration: InputDecoration(
//                       //         border: InputBorder.none,
//                       //         enabledBorder: InputBorder.none,
//                       //         focusedBorder: InputBorder.none,
//                       //         isDense: true,
//                       //         contentPadding: const EdgeInsets.symmetric(
//                       //             horizontal: 15, vertical: 13),
//                       //         filled: true,
//                       //         fillColor: Colors.grey.shade100,
//                       //         prefixIconConstraints:
//                       //             const BoxConstraints(maxHeight: 30, minWidth: 20),
//                       //         prefixIcon: Icon(
//                       //           Icons.search,
//                       //           color: thirdcolor,
//                       //         ),
//                       //         hintText: "Search here"),
//                       //   ),
//                       // ),
//                       SizedBox(
//                         height: Screens.padingHeight(context) * 0.01,
//                       ),
//                       context.read<PurchaseInwardCtrl>().secondpagevendorlist !=
//                               null
//                           ? Container(
//                               child: Text(
//                                 "Vendor Code : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.VendorCode}",
//                                 style: theme.textTheme.bodyMedium!
//                                     .copyWith(fontWeight: FontWeight.bold),
//                               ),
//                             )
//                           : Container(),
//                       SizedBox(
//                         height: Screens.padingHeight(context) * 0.01,
//                       ),
//                       context.read<PurchaseInwardCtrl>().secondpagevendorlist !=
//                               null
//                           ? Container(
//                               child: Text(
//                                 "Vendor Name : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.Vendor}",
//                                 style: theme.textTheme.bodyMedium!
//                                     .copyWith(fontWeight: FontWeight.bold),
//                               ),
//                             )
//                           : Container(),
//                       SizedBox(
//                         height: Screens.padingHeight(context) * 0.01,
//                       ),
//                       Expanded(
//                           child:context
//                                   .watch<PurchaseInwardCtrl>()
//                                   .secondpageloading ==true?
//                                   Center(
//                                     child: Container(
//                                       child: CircularProgressIndicator(),
//                                     ),
//                                   ): context
//                                   .read<PurchaseInwardCtrl>()
//                                   .filtersecondvendoritemlist
//                                   .isEmpty
//                               ? Container(
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
//                               ))
//                               : ListView.builder(
//                                   itemCount: context
//                                       .read<PurchaseInwardCtrl>()
//                                       .filtersecondvendoritemlist
//                                       .length,
//                                   itemBuilder: (c, i) {
//                                     return Padding(
//                                       padding: EdgeInsets.only(
//                                           top: Screens.width(context) * 0.005,
//                                           ),
//                                       child: InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             context
//                                                 .read<PurchaseInwardCtrl>()
//                                                 .thirdindex = i;
                                                        
//                                             context
//                                                 .read<
//                                                     PurchaseInwardCtrl>()
//                                                 .dataget(
//                                                     context);
                                                        
//                                             context
//                                                 .read<PurchaseInwardCtrl>()
//                                                 .thirdvendoritemlist = null;
//                                             context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .thirdvendoritemlist =
//                                                 context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .filtersecondvendoritemlist[i];
//                                           });
                                                        
//                                           context
//                                               .read<PurchaseInwardCtrl>()
//                                               .pageController
//                                               .animateToPage(
//                                                   ++context
//                                                       .read<PurchaseInwardCtrl>()
//                                                       .pageChanged,
//                                                   duration: const Duration(
//                                                       milliseconds: 250),
//                                                   curve: Curves.bounceIn);
//                                         },
//                                         child:  Container(
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: Screens.padingHeight(context)*0.005,
//                                       horizontal: Screens.width(context)*0.005,

                                    
//                                     ),
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               Screens.width(context) * 0.02,
//                                           vertical:
//                                               Screens.padingHeight(context) *
//                                                   0.02),
//                                        decoration: BoxDecoration(
//                                       color: white,
//        borderRadius: BorderRadius.circular(10),
//                                           boxShadow: 
//                                     [BoxShadow(
//                                       color: Color.fromARGB(255, 239, 239, 239),
//                                       blurRadius: 5,
//                                       spreadRadius: 4
//                                     )]           
//                                        ),
//                                       // height: Screens.padingHeight(context)*0.3,
//                                       width: Screens.width(context),
                                     
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.6,
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                         width: Screens.width(
//                                                                 context) *
//                                                             0.6,
//                                                         //    color: Colors.red,
//                                                         child: Text(
//                                                           "${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].itemcode}",
//                                                           // "${grpDetailsFilter[i].ItemCode}",
//                                                           style: theme.textTheme
//                                                               .bodyMedium!
//                                                               .copyWith(),
//                                                         )),
//                                                     SizedBox(
//                                                       height:
//                                                           Screens.padingHeight(
//                                                                   context) *
//                                                               0.005,
//                                                     ),
//                                                     Container(
//                                                         width: Screens.width(
//                                                                 context) *
//                                                             0.6,
//                                                         //    color: Colors.red,
//                                                         child: Text(
//                                                           "${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].ItemName}",
//                                                           // "${grpDetailsFilter[i].Dscription}",
//                                                           style: theme.textTheme
//                                                               .bodyMedium!
//                                                               .copyWith(),
//                                                         )),
//                                                     SizedBox(
//                                                       height:
//                                                           Screens.padingHeight(
//                                                                   context) *
//                                                               0.005,
//                                                     ),
//                                                     Container(
//                                                         width: Screens.width(
//                                                                 context) *
//                                                             0.6,
//                                                         //  color: Colors.red,
//                                                         child: Text(
//                                                           "Quantity: ${context.read<PurchaseInwardCtrl>().getqty.length == 0 || context.read<PurchaseInwardCtrl>().getqty.isEmpty ? '0' : context.read<PurchaseInwardCtrl>().getqty[i]}/${context.read<PurchaseInwardCtrl>().filtersecondvendoritemlist[i].Qty}",
//                                                           // ${context.read<PurchaseInwardCtrl>().inwItemList[i].Unit_Quantity!.toStringAsFixed(0)}
//                                                           // /${context.read<PurchaseInwardCtrl>().getqty.length == 0 || context.read<PurchaseInwardCtrl>().getqty.isEmpty ? '0' : context.read<PurchaseInwardCtrl>().getqty[i]
//                                                           // }",
//                                                           style: theme.textTheme
//                                                               .bodyMedium!
//                                                               .copyWith(),
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Container(
//                                                 alignment: Alignment.center,
//                                                 width:
//                                                     Screens.width(context) * 0.2,
//                                                 //  color: Colors.red,
//                                                 child: CircleAvatar(
//                                                   radius: Screens.width(context) *
//                                                       0.055,
//                                                   backgroundColor: thirdcolor,
//                                                   child: const Icon(
//                                                     Icons.keyboard_arrow_right_rounded,
//                                                     color: Colors.white,
//                                                     size: 30,
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                      ) );
//                                   })),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         width: Screens.width(context)*0.45,
      
//                                         child:   TextFormField(
//                                           readOnly: true,
//                                           onTap: (){
//                                             setState(() {
//                                               Selecteddate();
//                                             });
//                                           },
//                                                               controller: context
//                                                                   .read<PurchaseInwardCtrl>()
//                                                                   .invoicedatecontroller,
//                                                               validator: (v) {
//                                                                 if (v!.isEmpty) {
//                                                                   return "*Invoice Date Required";
//                                                                 }
//                                                                 return null;
//                                                               },
//                                                               decoration: InputDecoration(
                                                                
//                                                                 isDense: true,
//                                                                 contentPadding: const EdgeInsets.symmetric(
//                                                                     horizontal: 10, vertical: 12),
//                                                                 labelText: "Invoice Date",
//                                                                 border: OutlineInputBorder(
//                                                                     borderRadius: BorderRadius.circular(7)),
//                                                                 enabledBorder: OutlineInputBorder(
//                                                                     borderRadius: BorderRadius.circular(7)),
//                                                                 focusedBorder: OutlineInputBorder(
//                                                                     borderRadius: BorderRadius.circular(7)),
//                                                                 focusedErrorBorder: OutlineInputBorder(
//                                                                     borderRadius: BorderRadius.circular(7)),
//                                                                 errorBorder: OutlineInputBorder(
//                                                                     borderRadius: BorderRadius.circular(7)),
//                                                               ),
//                                                             ),
                                                           
//                                       ),
//                                        Container(
//                                         width: Screens.width(context)*0.45,
//                                     child:   TextFormField(
//                           controller: context
//                               .read<PurchaseInwardCtrl>()
//                               .invoicenumcontroller,
//                           validator: (v) {
//                             if (v!.isEmpty) {
//                               return "*Invoice Num Required";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             isDense: true,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 12),
//                                 // hintText: "hhh",
//                             labelText: "Invoice Num",
//                             // labelStyle: theme.textTheme.bodyMedium!.copyWith(
//                             //   color: thirdcolor
//                             // ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                           ),
//                         ),
                       
//                                   ),
//                                     ],
//                                   ),
//                                   //  SizedBox(height: Screens.padingHeight(context)*0.01,),
      
                                  
//                                   SizedBox(height: Screens.padingHeight(context)*0.01,),
//                                   Container(
//                                     child:   TextFormField(
//                           controller: context
//                               .read<PurchaseInwardCtrl>()
//                               .commentcontroller,
//                           validator: (v) {
//                             if (v!.isEmpty) {
//                               return "*Comments Required";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             isDense: true,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 12),
//                             labelText: "Comments",
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                             errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7)),
//                           ),
//                         ),
                       
//                                   ),
//                                    SizedBox(
//                           height: Screens.padingHeight(context) * 0.01,
//                         ),
//                       Container(
//                         width: Screens.width(context),
//                         height: Screens.padingHeight(context) * 0.06,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: thirdcolor
//                           ),
//                             onPressed: context
//                                           .watch<PurchaseInwardCtrl>()
//                                           .saveenablebutton ==
//                                       false
//                                   // context
//                                   //             .watch<inwardcontroller>()
//                                   //             .grpTotal !=
//                                   //         context
//                                   //             .read<inwardcontroller>()
//                                   //             .getqty
//                                   ? null
//                                   : context
//                                               .watch<PurchaseInwardCtrl>()
//                                               .finallodaing ==
//                                           true
//                                       ? null
//                                       : () {
//                                           if (context
//                                               .read<PurchaseInwardCtrl>()
//                                               .formkey2
//                                               .currentState!
//                                               .validate()) {
//                                             context
//                                                 .read<PurchaseInwardCtrl>()
//                                                 .savefinal(context);
//                                           }
//                                         }, child:  context
//                                           .watch<PurchaseInwardCtrl>()
//                                           .finallodaing ==
//                                       false
//                                   ? const Text("Save")
//                                   : SpinKitThreeBounce(
//                                       size: Screens.width(context) * 0.05,
//                                       color: Colors.white,
//                                     )),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               context.read<PurchaseInwardCtrl>().thirdvendoritemlist == null
//                   ? Container()
//                   : Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Screens.width(context) * 0.03,
//                           vertical: Screens.padingHeight(context) * 0.02),
//                       child: Column(
//                         children: [
//                           context
//                                       .read<PurchaseInwardCtrl>()
//                                       .secondpagevendorlist !=
//                                   null
//                               ? Container(
//                                   child: Text(
//                                     "Vendor Code : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.VendorCode}",
//                                     style: theme.textTheme.bodyMedium!
//                                         .copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               : Container(),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           context
//                                       .read<PurchaseInwardCtrl>()
//                                       .secondpagevendorlist !=
//                                   null
//                               ? Container(
//                                   child: Text(
//                                     "Vendor name : ${context.read<PurchaseInwardCtrl>().secondpagevendorlist!.Vendor}",
//                                     style: theme.textTheme.bodyMedium!
//                                         .copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               : Container(),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           context
//                                       .read<PurchaseInwardCtrl>()
//                                       .thirdvendoritemlist !=
//                                   null
//                               ? Container(
//                                   child: Text(
//                                     "Item Code : ${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.itemcode}",
//                                     style: theme.textTheme.bodyMedium!
//                                         .copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               : Container(),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           context
//                                       .watch<PurchaseInwardCtrl>()
//                                       .thirdvendoritemlist !=
//                                   null
//                               ? Container(
//                                   width: Screens.width(context),
//                                   //  height: Screens.heigt(context)*0.07,
//                                   //  color: Colors.green,
//                                   // ${context.read<thirdvendoritemlist>().ScannedQty()}
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Quantity:  ${context.read<PurchaseInwardCtrl>().thirdvendoritemlist!.Qty!}/ ${context.read<PurchaseInwardCtrl>().ScannedQty()}",
//                                     // ${grpDetails[ind].Quantity.toStringAsFixed(0)}/${data.length}",
//                                     style: theme.textTheme.bodyMedium!
//                                         .copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               : Container(),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           Container(
//                             width: Screens.width(context),
//                             height: Screens.padingHeight(context) * 0.06,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(05),
//                                 border: Border.all(color: Colors.grey)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.center,
//                                   // color: Colors.deepOrange,
//                                   width: Screens.width(context) * 0.78,
      
//                                   child: TextFormField(
//                                     controller: context
//                                         .read<PurchaseInwardCtrl>()
//                                         .scancontroller,
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Required *";
//                                       }
      
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                         hintText: 'Scan Serial Number',
//                                         contentPadding: EdgeInsets.symmetric(
//                                             vertical:
//                                                 Screens.padingHeight(context) *
//                                                     0.01,
//                                             horizontal:
//                                                 Screens.width(context) * 0.01),
//                                         border: InputBorder.none),
//                                     onEditingComplete: () {
//                                       context
//                                               .read<PurchaseInwardCtrl>()
//                                               .scanedvalueee =
//                                           context
//                                               .read<PurchaseInwardCtrl>()
//                                               .scancontroller
//                                               .text;
//                                       context
//                                           .read<PurchaseInwardCtrl>()
//                                           .afterserialscanned(
//                                               context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .scanedvalueee
//                                                   .toString(),
//                                               context);
//                                     },
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       context
//                                           .read<PurchaseInwardCtrl>()
//                                           .scanedvalueee = null;
//                                       QRscannerState.purchasedetailsscan = true;
//                                     });
      
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const QRscanner())).then((value) {
//                                       context
//                                               .read<PurchaseInwardCtrl>()
//                                               .scancontroller
//                                               .text =
//                                           context
//                                               .read<PurchaseInwardCtrl>()
//                                               .scanedvalueee
//                                               .toString();
//                                       context
//                                           .read<PurchaseInwardCtrl>()
//                                           .afterserialscanned(
//                                               context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .scanedvalueee
//                                                   .toString(),
//                                               context);
//                                     });
//                                   },
//                                   child: Container(
//                                       padding: EdgeInsets.only(
//                                           right: Screens.width(context) * 0.02),
//                                       child: Icon(
//                                         Icons.qr_code,
//                                         color: thirdcolor,
//                                         size: 30,
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           Expanded(
//                             child: Container(
//                               color: grey,
//                               height: Screens.padingHeight(context) * 0.5,
//                               width: Screens.width(context),
//                               child: ListView.builder(
//                                 itemCount: context
//                                     .watch<PurchaseInwardCtrl>()
//                                     .DBdata
//                                     .length,
//                                 itemBuilder: (context, index) {
//                                   return Container(
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
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             // padding: EdgeInsets.only(
//                                             //     top: Screens.padingHeight(
//                                             //             context) *
//                                             //         0.014),
//                                             width: Screens.width(context) * 0.4,
//                                             // height: Screens.padingHeight(context)*0.01,
//                                             // color: Colors.amber,
      
//                                             // decoration: BoxDecoration(),
//                                             child: Text(
//                                               context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .DBdata[index]
//                                                   .batchNumber
//                                                   .toString(),
//                                               // textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                           Container(
//                                             width: Screens.width(context) * 0.1,
//                                             // color: Color.fromARGB(255, 7, 65, 255),
      
//                                             child: Text(context
//                                                 .read<PurchaseInwardCtrl>()
//                                                 .DBdata[index]
//                                                 .scannedqty
//                                                 .toString()),
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .deletedata(index);
//                                               });
//                                             },
//                                             child: const Icon(
//                                               Icons.delete,
//                                               color: Colors.red,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: Screens.padingHeight(context) * 0.01,
//                           ),
//                           Container(
//                             width: Screens.width(context),
//                             height: Screens.padingHeight(context) * 0.06,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: thirdcolor
//                               ),
//                                 onPressed: () {
//                                    FocusScope.of(context).unfocus();
//                                   context.read<PurchaseInwardCtrl>().savedbinw();
//                                 },
//                                 child: const Text("Save And Back")),
//                           )
//                         ],
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
    
//     );
//   }
// }