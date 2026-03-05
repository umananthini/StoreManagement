// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
// import 'package:warehousemanagement/CONSTANT/helperfunction.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/DashBoardController/dashboardctrl.dart';
// import 'package:warehousemanagement/CONTROLLER/LoginController/loginctrl.dart';
// // import 'package:warehousemanagement/PAGES/PurchaseInward/Purchaseinward/purchaseinwardpage.dart';

// import 'package:warehousemanagement/PAGES/TransferInward/transferinwardpageOLDD.dart';
// import 'package:warehousemanagement/PAGES/TransferOutWard/transferoutwardpage.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // Define a custom path to create a stylish clipped shape
//     var path = Path();
//     path.moveTo(0, size.height * 0.5);
//     path.lineTo(size.width * 0.2, 0);
//     // path.lineTo(size.width * 0.8, 0);
//     // path.lineTo(size.width, size.height * 0.5);
//     // path.lineTo(size.width * 0.8, size.height);
//     // path.lineTo(size.width * 0.2, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<Dashboardctrl>().init();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//      DateTime now = DateTime.now();

//     String greeting = "";
//     int hours = now.hour;

//     if (hours >= 1 && hours < 12) {
//       greeting = "Good Morning";
//     } else if (hours >= 12 && hours < 16) {
//       greeting = "Good Afternoon";
//     } else if (hours >= 16 && hours < 21) {
//       greeting = "Good Evening";
//     } else {
//       greeting = "Good Night";
//     }
 
   
    

//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: ListView(
//           children:  [
//             DrawerHeader(
//               decoration:
//                   BoxDecoration(color: secondary),
//               child: Center(
//                   child: Text(
//                                    "${ConstantValues.username}",
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600))),
//             ),
//             InkWell(
//               onTap: (){
//                 Get.toNamed(ConstantRoutes.report);
//               },
//               child: ListTile(
//                 leading: Icon(Icons.report),
//                 title: Text('Report'),
//               ),
//             ),
//              InkWell(
//            onTap: (){
//              showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (_) {
//           final theme = Theme.of(context);
//           return StatefulBuilder(builder: (context, setst) {
//             return WillPopScope(
//               onWillPop: () async => false,
//               child: AlertDialog(
//                 contentPadding: EdgeInsets.all(0),
//                 content: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5),
//                     topRight: Radius.circular(5),
//                   )),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: thirdcolor,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(5),
//                               topRight: Radius.circular(5),
//                             )),
//                         width: Screens.width(context),
//                         height: Screens.padingHeight(context) * 0.05,
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Alert",
//                           style: theme.textTheme.bodyMedium!
//                               .copyWith(color: Colors.white),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text("Want To Logout!!"),
                         
//                             SizedBox(
//                               height: Screens.padingHeight(context) * 0.01,
//                             ),
                        
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 ElevatedButton(
//                                    style: ElevatedButton.styleFrom(
//                                         backgroundColor:thirdcolor 
//                                       ),
//                                     onPressed: () {
//                                       setst(() {
//                                         helperfunction.clearLoginBranch();
//                                         helperfunction.clearloginpassword();
//                                         // helperfunction.clearusername();
//                                         helperfunction.clearLoginBranch();
//                                         helperfunction.clearLoginBranch();

//                                        Get.toNamed(ConstantRoutes.login);
                                
                                       
//                                       });
//                                     },
//                                     child: Text("Yes")),
//                                      ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor:thirdcolor 
//                                       ),
//                                     onPressed: () {
//                                       setst(() {
//                                         // isfinalloop = false;
                                
//                                         Navigator.pop(context);
//                                       });
//                                     },
//                                     child: Text("no")),
//                               ],
//                             )
//                             //   ],
//                             // )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           });
//         });
//            },
//                child: ListTile(
//                 leading: Icon(Icons.logout_outlined,
//                 color: Colors.red
//                 ),
//                 title: Text('Logout',
//                 style: TextStyle(
//                   color: Colors.red
//                 ),
//                 ),
//                            ),
//              ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           // color: Colors.amber,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                     top: Screens.padingHeight(context) * 0.065,
//                     left: Screens.width(context) * 0.02,
//                     right: Screens.width(context) * 0.06),
//                 height: Screens.padingHeight(context) * 0.2,
//                 width: Screens.width(context),
//                 decoration: BoxDecoration(
//                   borderRadius:
//                       BorderRadius.only(bottomRight: Radius.circular(30)),
//                   gradient: LinearGradient(
//                     colors: [ primarycolor,secondary],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   // color: secondary   
//                 ),
//                 child: IntrinsicHeight(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         // width: Screens.width(context)*0.5,
//                         // color: Colors.amber,
//                         alignment: Alignment.topCenter,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: Screens.width(context) * 0.01,
//                             ),
//                             Container(
//                               // color: Colors.red,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         _scaffoldKey.currentState?.openDrawer();
//                                       });
//                                     },
//                                     child: Icon(
//                                       Icons.menu,
//                                       color: white,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: Screens.width(context) * 0.05,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Hi",
//                                       style: theme.textTheme.bodyMedium!.copyWith(
//                                           color: white,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 22),
//                                     ),
//                                     SizedBox(width: Screens.width(context)*0.01,),
//                                      Text(
//                                      "${  ConstantValues.username}..!",
//                                       style: theme.textTheme.bodyMedium!.copyWith(
//                                           color: white,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 22),
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                  "$greeting", 
//                                   style: theme.textTheme.bodyMedium!.copyWith(
//                                       color: white,
//                                       // fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [ 
                         
                         
//                               // Container(
//                               //   padding: EdgeInsets.all(7),
//                               //   decoration: BoxDecoration(
//                               //       color: Colors.white.withOpacity(0.2),
//                               //       shape: BoxShape.circle),
//                               //   child: Icon(
//                               //     Icons.notification_important,
//                               //     color: white,
//                               //     size: 25,
//                               //   ),
//                               // ),
//                               // SizedBox(
//                               //   width: Screens.width(context) * 0.03,
//                               // ),
//                               // Container(
//                               //   height: Screens.padingHeight(context) * 0.05,
//                               //   width: Screens.width(context) * 0.1,
                                          
//                               //   //  padding: EdgeInsets.all(7),
//                               //   decoration: BoxDecoration(
//                               //       shape: BoxShape.circle,
//                               //       // color: white,
//                               //       image: DecorationImage(
//                               //           image: AssetImage(
//                               //             "Assets/profileimage.jpeg",
//                               //           ),
//                               //           fit: BoxFit.fill)),
//                               // ),
                         
                          
//                                         ConstantValues.isapprover!.toLowerCase() =='y'?        InkWell(
//                             onTap: (){
//                               Get.toNamed(ConstantRoutes.approval);
//                             },
//                             child: Container(
                              
//                               padding: EdgeInsets.symmetric(vertical: Screens.padingHeight(context)*0.01,
//                               horizontal: Screens.width(context)*0.03
//                               ),
//                               decoration: BoxDecoration(
//                               color:secondary,
//                             border: Border.all(color: thirdcolor),
//                                 borderRadius: BorderRadius.all(Radius.circular(10))
//                               ),
//                               child: Text('Approve',
//                               style: theme.textTheme.bodyMedium!.copyWith(
//                                 color: white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               ),
//                             ),
//                           ):Container(),
//                            Container(
//                             padding: EdgeInsets.symmetric(
//                               vertical: Screens.padingHeight(context)*0.005,
//                               horizontal: Screens.width(context)*0.01,

//                             ),
//                              child: Container(
//                                child: Row(
//                                                    children: [
//                                                      Text("Version :",
                                                     
//                                                      style: theme.textTheme.bodyMedium!.copyWith(
//                                                        color: white,
                                                          
//                                                      ),
//                                                      ),
//                                                       Text("${ConstantValues.versionNum}",
//                                                        style: theme.textTheme.bodyMedium!.copyWith(
//                                                        color: white,

//                                                      ),)
//                                                    ],
//                                                  ),
//                              ),
//                            )
//                         ],
//                       )
                   
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: Screens.width(context) * 0.002),
//                 // height: Screens.padingHeight(context)*0.81,
//                 width: Screens.width(context),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(),
//                   gradient: LinearGradient(
//                     colors: [ secondary,primarycolor,],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   // color: secondary
//                 ),
//                 child: Container(
//                   width: Screens.width(context),
//                   decoration: BoxDecoration(
//                       color: grey,
//                       borderRadius:BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                       )),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                      SizedBox(
//                       height: Screens.padingHeight(context)*0.04,
//                      ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                       Get.toNamed(ConstantRoutes.purchaseinwnew);
//                                     },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context) * 0.02),
//                               height: Screens.padingHeight(context) * 0.2,
//                               width: Screens.width(context) * 0.4,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: Screens.padingHeight(context) * 0.1,
//                                     width: Screens.width(context) * 0.1,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: AssetImage(
//                                         "Assets/Purchase order.png",
//                                       ),
//                                       fit: BoxFit.contain,
//                                     )),
//                                   ),
//                                   Text(
//                                     "Purchase Inward",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                         color: Colors.grey,
//                                         fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                               onTap: () {
//                                       Get.toNamed(ConstantRoutes.transferinward);
//                                     },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context) * 0.02),
//                               height: Screens.padingHeight(context) * 0.2,
//                               width: Screens.width(context) * 0.4,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: Screens.padingHeight(context) * 0.1,
//                                     width: Screens.width(context) * 0.1,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: AssetImage(
//                                         "Assets/transfer inward.png",
//                                       ),
//                                       fit: BoxFit.contain,
//                                     )),
//                                   ),
//                                   Text(
//                                     "Transfer Inward",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                         color: Colors.grey,
//                                         fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
                     
//                      SizedBox(
//                       height: Screens.padingHeight(context)*0.04,
//                      ),
//                        Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                            InkWell(
//                                     onTap: () {
//                                       Get.toNamed(ConstantRoutes.transferoutward);
//                                     },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context) * 0.02),
//                               height: Screens.padingHeight(context) * 0.2,
//                               width: Screens.width(context) * 0.4,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: Screens.padingHeight(context) * 0.1,
//                                     width: Screens.width(context) * 0.1,
//                                     // color: Colors.amber,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: AssetImage(
//                                         "Assets/Store order.png",
//                                       ),
//                                       fit: BoxFit.contain,
//                                     )),
//                                   ),
//                                   Text(
//                                     "Transfer Outward",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                         color: Colors.grey,
//                                         // fontWeight: FontWeight.w600,
//                                         fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           //   Container(
//                           //   padding: EdgeInsets.symmetric(
//                           //       vertical: Screens.padingHeight(context) * 0.02),
//                           //   height: Screens.padingHeight(context) * 0.2,
//                           //   width: Screens.width(context) * 0.4,
//                           //   decoration: BoxDecoration(
//                           //       borderRadius: BorderRadius.circular(10),
//                           //       color: Colors.white),
//                           //   child: Column(
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
                                    
//                           //         },
//                           //         child: Container(
//                           //           height: Screens.padingHeight(context) * 0.1,
//                           //           width: Screens.width(context) * 0.1,
//                           //           // color: Colors.amber,
//                           //           decoration: BoxDecoration(
//                           //               image: DecorationImage(
//                           //             image: AssetImage(
//                           //               "Assets/request.png",
//                           //             ),
//                           //             fit: BoxFit.contain,
//                           //           )),
//                           //         ),
//                           //       ),
//                           //       Text(
//                           //         "Request",
//                           //         style: theme.textTheme.bodyMedium!.copyWith(
//                           //             color: Colors.grey,
//                           //             // fontWeight: FontWeight.w600,
//                           //             fontSize: 14),
//                           //       )
//                           //     ],
//                           //   ),
//                           // ),
                          
                        
//                         ],
//                       ),
//                        SizedBox(
//                       height: Screens.padingHeight(context)*0.04,
//                      ),
//                          Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           InkWell(
//                              onTap: () {
//                                       Get.toNamed(ConstantRoutes.sellabletodisplayScreen);
//                                     },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context) * 0.02),
//                               height: Screens.padingHeight(context) * 0.2,
//                               width: Screens.width(context) * 0.4,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: Screens.padingHeight(context) * 0.1,
//                                     width: Screens.width(context) * 0.1,
//                                     // color: Colors.amber,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: AssetImage(
//                                         "Assets/Sellable to Display.png",
//                                       ),
//                                       fit: BoxFit.contain,
//                                     )),
//                                   ),
//                                   Text(
//                                     "Sellable to display",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                         color: Colors.grey,                                    
//                                         fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                              onTap: () {
//                                       Get.toNamed(
//                                           ConstantRoutes.displaytosellable);
//                                     },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: Screens.padingHeight(context) * 0.02),
//                               height: Screens.padingHeight(context) * 0.2,
//                               width: Screens.width(context) * 0.4,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.white),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: Screens.padingHeight(context) * 0.1,
//                                     width: Screens.width(context) * 0.1,
//                                     // color: Colors.amber,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: AssetImage(
//                                         "Assets/Display to seller.png",
//                                       ),
//                                       fit: BoxFit.contain,
//                                     )),
//                                   ),
//                                   Text(
//                                     "Display to sellable",
//                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                         color: Colors.grey,
//                                         // fontWeight: FontWeight.w600,
//                                         fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
                     
                   
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
