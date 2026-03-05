


// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/Displaytosellable/displaytosellable.dart';
// import 'package:warehousemanagement/PAGES/DisplaytoSellable/displaytosllable2.dart';
// import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

// class DisplaytoSellable extends StatefulWidget {
//   const DisplaytoSellable({super.key});

//   @override
//   State<DisplaytoSellable> createState() => _DisplaytoSellableState();
// }

// class _DisplaytoSellableState extends State<DisplaytoSellable> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<DisplayToSellablectrl>().init();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final theme= Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: secondary,
//         title: Text(
//           "Display To Sellable",
//           style: theme.textTheme.bodyMedium!.copyWith(
//               color: white, fontWeight: FontWeight.w600, fontSize: 22),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(
//         horizontal: Screens.padingHeight(context)*0.02,
//         vertical: Screens.width(context)*0.02
//         ),
//         height: Screens.bodyheight(context),
//         width: Screens.width(context),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: (){
//                 setState(() {
//                     context.read<DisplayToSellablectrl>().diplayScanvalue1 =
//                                 null;
                                
//                             QRscannerState.displayBoxdetailsscan = true;
//                               });
//                     Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>  QRscanner()))
//                               .then((value) {
                                
                               
//                             context
//                                     .read<DisplayToSellablectrl>()
//                                     .displayproductserial
//                                     .text =
//                                 context
//                                     .read<DisplayToSellablectrl>()
//                                     .diplayScanvalue1
//                                     .toString();
//                                      log(  "context"+  context
//                                     .read<DisplayToSellablectrl>()
//                                     .diplayScanvalue1.toString());
//                             context
//                                 .read<DisplayToSellablectrl>()
//                                 .afterserialScanned(
//                                     context
//                                         .read<DisplayToSellablectrl>()
//                                         .diplayScanvalue1
//                                         .toString(),context);
//                           });
                
              
//               },
//               child: Container(
//                 height: Screens.padingHeight(context)*0.6,
//                 width: Screens.width(context)*0.9,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color:secondary,
              
//                 ),
//                 child: Center(
//                   child: Icon(Icons.qr_code,
//                   color: Colors.white,
//                   size: Screens.padingHeight(context)*0.3,
//                   ),
//                 ),
//               ),
//             ),
//                SizedBox(height: Screens.padingHeight(context)*0.04),
//             Text("SCAN ITEMS",
//             style:theme.textTheme.bodyMedium!.copyWith(
//               fontWeight: FontWeight.w500,
//               color: const Color.fromARGB(255, 196, 196, 196)
//             ),
//             ),
//             SizedBox(height: Screens.padingHeight(context)*0.07),
//             //   Expanded(
//             //     child: Column(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //      Container(
//             //             width: Screens.width(context),
//             //             height: Screens.padingHeight(context) * 0.06,
//             //             decoration: BoxDecoration(
//             //                 borderRadius: BorderRadius.circular(05),
//             //                 border: Border.all(color: Colors.grey)),
//             //             child: Row(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               children: [
//             //                 Container(
//             //                   alignment: Alignment.center,
//             //                   // color: Colors.deepOrange,
//             //                   width: Screens.width(context) * 0.78,

//             //                   child: TextFormField(
//             //                     controller: context
//             //                          .read<DisplayToSellablectrl>().scanctrl1,
//             //                     validator: (value) {
//             //                       if (value!.isEmpty) {
//             //                         return "Product Seial Required *";
//             //                       }

//             //                       return null;
//             //                     },
//             //                     decoration: InputDecoration(
//             //                         hintText: 'Product Seial Number',
//             //                         contentPadding: EdgeInsets.symmetric(
//             //                             vertical:
//             //                                 Screens.padingHeight(context) *
//             //                                     0.01,
//             //                             horizontal:
//             //                                 Screens.width(context) * 0.01),
//             //                         border: InputBorder.none),
//             //                     onEditingComplete: () {
                                  
//             //                       // context
//             //                       //         .read<SellableoDispController>()
//             //                       //         .scanedvalueee =
//             //                       //     context
//             //                       //         .read<SellableoDispController>()
//             //                       //         .scancontroller
//             //                       //         .text;
//             //                       // context
//             //                       //     .read<SellableoDispController>()
//             //                       //     .afterserialScanned(
//             //                       //         context
//             //                       //             .read<SellableoDispController>()
//             //                       //             .scanedvalueee
//             //                       //             .toString(),
//             //                       //         context);
//             //                     },
//             //                   ),
//             //                 ),
//             //                 InkWell(
//             //                   onTap: () {
//             //                     // setState(() {
//             //                     //   context
//             //                     //       .read<SellableoDispController>()
//             //                     //       .scanedvalueee = null;
//             //                     //   QRscannerState.detailsoutwardscan =
//             //                     //       true;
//             //                     // });

//             //                     // Navigator.push(
//             //                     //         context,
//             //                     //         MaterialPageRoute(
//             //                     //             builder: (context) =>
//             //                     //                 const QRscanner()))
//             //                     //     .then((value) {
//             //                     //   context
//             //                     //           .read<SellableoDispController>()
//             //                     //           .scancontroller
//             //                     //           .text =
//             //                     //       context
//             //                     //           .read<SellableoDispController>()
//             //                     //           .scanedvalueee
//             //                     //           .toString();
//             //                     //   context
//             //                     //       .read<SellableoDispController>()
//             //                     //       .afterserialScanned(
//             //                     //           context
//             //                     //               .read<SellableoDispController>()
//             //                     //               .scanedvalueee
//             //                     //               .toString(),
//             //                     //           context);
//             //                     // });
//             //                   },
//             //                   child: Container(
//             //                       padding: EdgeInsets.only(
//             //                           right: Screens.width(context) * 0.02),
//             //                       child: const Icon(
//             //                         Icons.qr_code,
//             //                         color: thirdcolor,
//             //                         size: 30,
//             //                       )),
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //             SizedBox(
//             //       height: Screens.padingHeight(context) * 0.04,
//             //     ),
//             //     Container(
//             //       width: Screens.width(context),
//             //       height: Screens.padingHeight(context) * 0.06,
//             //       decoration: BoxDecoration(
//             //           borderRadius: BorderRadius.circular(05),
//             //           border: Border.all(color: Colors.grey)),
//             //       child: Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         children: [
//             //           Container(
//             //             alignment: Alignment.center,
//             //             // color: Colors.deepOrange,
//             //             width: Screens.width(context) * 0.78,

//             //             child: TextFormField(
//             //               controller: context
//             //                   .read<DisplayToSellablectrl>().scanctrl,
                             
//             //               validator: (value) {
//             //                 if (value!.isEmpty) {
//             //                   return "Box Seial Required *";
//             //                 }

//             //                 return null;
//             //               },
//             //               decoration: InputDecoration(
//             //                   hintText: 'Box Serial Number',
//             //                   contentPadding: EdgeInsets.symmetric(
//             //                       vertical:
//             //                           Screens.padingHeight(context) * 0.01,
//             //                       horizontal: Screens.width(context) * 0.01),
//             //                   border: InputBorder.none),
//             //               onEditingComplete: () {
                           
//             //                 // context
//             //                 //     .read<SellableoDispController>()
//             //                 //     .afterserialScanned(
//             //                 //         context
//             //                 //             .read<SellableoDispController>()
//             //                 //             .scanedvalueee
//             //                 //             .toString(),
//             //                 //         context);
//             //               },
//             //             ),
//             //           ),
//             //           Container(
//             //               padding: EdgeInsets.only(
//             //                   right: Screens.width(context) * 0.02),
//             //               child: const Icon(
//             //                 Icons.qr_code,
//             //                 color: thirdcolor,
//             //                 size: 30,
//             //               )),
//             //         ],
//             //       ),
//             //     ),
//             //     SizedBox(
//             //       height: Screens.padingHeight(context) * 0.02,
//             //     ),
             
              
                
         
                   
              
//             //     // if (context
//             //     //                 .watch<SellableoDispController>().
//             //     //                generatednum ),
//             //                   //  context
//             //                   //   .watch<SellableoDispController>().
//             //                   //  generatednum ==true?
               
//             //   ],
//             // )),
            
//           ],
//         ),
//       ),
//     );
//   }
// }