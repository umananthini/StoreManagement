// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// class PurchaseInwNewFirst extends StatefulWidget {
//   const PurchaseInwNewFirst({super.key});

//   @override
//   State<PurchaseInwNewFirst> createState() => _PurchaseInwNewFirstState();
// }

// class _PurchaseInwNewFirstState extends State<PurchaseInwNewFirst> {
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<PurchaseInwardCtrl>().init();
//     });
//   }
//     DateTime? currentBackPressTime;

//   Future<bool> onbackpress() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
//       currentBackPressTime = now;
//       Get.offAllNamed(ConstantRoutes.dashboard);
      
//     }
//     return Future.value(true);
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return PopScope(
//        canPop: false,
//       onPopInvoked: (bool didPop) {
//         log("didPop::$didPop");
//         if (didPop) return;
//         onbackpress();
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: secondary,
//             title: Text(
//               "Purchase Inward",
//               style: theme.textTheme.bodyMedium!.copyWith(
//                   color: white, fontWeight: FontWeight.w600, fontSize: 22),
//             ),
//           ),
//           body: Container(
//             padding: EdgeInsets.symmetric(
//                 horizontal: Screens.width(context) * 0.02,
//                 vertical: Screens.padingHeight(context) * 0.01),
//             width: Screens.width(context),
//             child: Column(
//               children: [
//                 Container(
//                   height: Screens.padingHeight(context) * 0.05,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10)),
//                   child: TextFormField(
//                     cursorColor: thirdcolor,
//                     onChanged: (v) {
//                       context
//                           .read<PurchaseInwardCtrl>()
//                           .SearchFilterpurchaseinvdetails(v);
//                     },
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(0),
//                       hintText: "Search",
//                       hintStyle: TextStyle(color: Colors.grey),
//                       // suffixIcon: InkWell(
//                         // onTap: () {
//                         //   setState(() {
//                         //     Navigator.push(
//                         //         context,
//                         //         MaterialPageRoute(
//                         //             builder: (context) => QRscanner()));
//                         //   });
//                         // },
//                       //   child: Icon(
//                       //     Icons.qr_code_2,
//                       //     color: primarycolor,
//                       //     size: 30,
//                       //   ),
//                       // ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: primarycolor,
//                       ),
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       focusedBorder:
//                           OutlineInputBorder(borderSide: BorderSide.none),
//                       enabledBorder:
//                           OutlineInputBorder(borderSide: BorderSide.none),
//                       errorBorder:
//                           OutlineInputBorder(borderSide: BorderSide.none),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: Screens.padingHeight(context) * 0.01,
//                 ),
//                 context.watch<PurchaseInwardCtrl>().isloading == true
//                     ? Container(
//                         height: Screens.padingHeight(context) * 0.7,
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             color: primarycolor,
//                           ),
//                         ),
//                       )
//                     : context.watch<PurchaseInwardCtrl>().filtervendorlist.isEmpty
//                         ? Center(
//                             child: Container(
//                               child: Text(
//                                 "No Data..",
//                                 style: theme.textTheme.bodyMedium!
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                           )
//                         :context.watch<PurchaseInwardCtrl>().searchfiltervendorlist.isEmpty
//                         ? Container(
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
//                               )): Expanded(
//                             child: ListView.builder(
//                               itemCount: context
//                                   .read<PurchaseInwardCtrl>()
//                                   .searchfiltervendorlist
//                                   .length,
//                               itemBuilder: ((context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       context
//                                           .read<PurchaseInwardCtrl>()
//                                           .docentryfirst = index;
//                                       context
//                                               .read<PurchaseInwardCtrl>()
//                                               .secondpagevendorlist =
//                                           context
//                                               .read<PurchaseInwardCtrl>()
//                                               .searchfiltervendorlist[index];
                                              
//                                       Get.toNamed(
//                                           ConstantRoutes.purchaseinwnewsec);
//                                             context.read<PurchaseInwardCtrl>().secondpageinit();
//                                     });
//                                   },
//                                   child: Container(
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
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.2,
//                                                 // color: Colors.amber,
//                                                 child: Text(
//                                                   "Doc No",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Container(
//                                                 alignment: Alignment.centerRight,
                                          
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 // color: Colors.amber,
//                                                 child: Text(context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .searchfiltervendorlist[index]
//                                                     .DocNum
//                                                     .toString()),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.005,
//                                           ),
//                                            Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.2,
//                                                 // color: Colors.amber,
//                                                 child: Text(
//                                                  "Vendor Code",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Container(
//                                                 alignment: Alignment.centerRight,
                                          
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 // color: Colors.amber,
//                                                  child: Text(context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .searchfiltervendorlist[index]
//                                                     .VendorCode
//                                                     .toString()),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.005,
//                                           ),
//                                            Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.2,
//                                                 // color: Colors.amber,
//                                                 child: Text(
//                                                  "Doc Date",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Container(
//                                                 alignment: Alignment.centerRight,
                                          
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 // color: Colors.amber,
//                                                   child: Text(context
//                                                     .read<PurchaseInwardCtrl>()
//                                                     .searchfiltervendorlist[index]
//                                                     .DocDate
//                                                     .toString()),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.005,
//                                           ),
                                            
//                                           Row(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 // color: Colors.amber,
//                                                 child: Text(
//                                                  "Vendor Name",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                             Container(
//                                                 alignment: Alignment.topRight,
                                          
//                                                 width:
//                                                     Screens.width(context) * 0.5,
//                                                 // color: const Color.fromARGB(255, 75, 57, 4),
//                                                  child: Text(
//                                               context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .searchfiltervendorlist[index]
//                                                   .Vendor
//                                                   .toString(),
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       // color: Colors.red
//                                                       ),
//                                             ),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 Screens.padingHeight(context) *
//                                                     0.005,
//                                           ),
//                                            Row(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Container(
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 // color: Colors.amber,
//                                                 child: Text(
//                                                  "Brand",
//                                                   style: theme
//                                                       .textTheme.bodyMedium!
//                                                       .copyWith(
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                               ),
//                                             context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .searchfiltervendorlist[index]
//                                                   .Brand
//                                                   .toString().isEmpty?Text("No Data",
//                                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                                     color: Colors.red
//                                                   ),
//                                                   ):     Container(
//                                                 alignment: Alignment.topRight,
                                          
//                                                 width:
//                                                     Screens.width(context) * 0.5,
//                                                 // color: const Color.fromARGB(255, 75, 57, 4),
//                                                  child: Text(
//                                               context
//                                                   .read<PurchaseInwardCtrl>()
//                                                   .searchfiltervendorlist[index]
//                                                   .Brand
//                                                   .toString(),
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                       // color: Colors.red
//                                                       ),
//                                             ),
//                                               ),
//                                             ],
//                                           ),
                                         
                                         
                                         
                                         
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }),
//                             ),
//                           )
//               ],
//             ),
//           )),
    
//     );
//   }
// }
