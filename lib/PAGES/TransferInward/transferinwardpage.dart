// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:path/path.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/Config.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/DashBoardController/dashboardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/TransferInwardController/transferinwardctrl.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class TransferInwardScreen extends StatefulWidget {
  const TransferInwardScreen({super.key});

  @override
  State<TransferInwardScreen> createState() => _TransferInwardScreenState();
}

class _TransferInwardScreenState extends State<TransferInwardScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransferInwardctrl>().init();
    });
  }
  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
      
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log("didPop::$didPop");
        if (didPop) return;
        onbackpress();
      },
      child: Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: secondary,
            // leading: Icon(Icons.abc),
            title: Container(
              padding: EdgeInsets.symmetric(
                vertical: Screens.padingHeight(context)*0.01
              ),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            Get.offAllNamed(ConstantRoutes.dashboard);
                             context
                          .read<TransferInwardctrl>().searchfilter1.clear();
                          });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Transfer Inward",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: white, fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                       
                       context
                          .read<TransferInwardctrl>().issearchpressed1 =! context
                          .read<TransferInwardctrl>().issearchpressed1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Screens.padingHeight(context)*0.005,
                        horizontal: Screens.width(context)*0.01
                    
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(31, 255, 255, 255)
                      ),
                      child: Icon(Icons.search,
                      color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Screens.width(context) * 0.02,
                vertical: Screens.padingHeight(context) * 0.01),
            width: Screens.width(context),
            color: Colors.grey[200],
            child: Column(
              children: [
               context
                          .watch<TransferInwardctrl>().issearchpressed1==false?Container():  Container(
                  height: Screens.padingHeight(context) * 0.05,
                  decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: context
                          .read<TransferInwardctrl>(). searchfilter1,
                    cursorColor: thirdcolor,
                    onChanged: (v) { 
                      context
                          .read<TransferInwardctrl>()
                          .SearchFilterEmployeedetails(v);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      // suffixIcon: InkWell(
                        // onTap: () {
                        //   setState(() {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => QRscanner()));
                        //   });
                        // },
                        // child: Icon(
                        //   Icons.qr_code_2,
                        //   color: primarycolor,
                        //   size: 30,
                        // ),
                      // ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primarycolor,
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
                  height: Screens.padingHeight(context) * 0.01,
                ),
                context.watch<TransferInwardctrl>().gettransinwloading == true
                    ? Container(
                        height: Screens.padingHeight(context) * 0.7,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: primarycolor,
                          ),
                        ),
                      )
                    : context
                            .watch<TransferInwardctrl>()
                            .filterTransinwdata
                            .isEmpty
                        ?  Container(
                              // height: Screens.padingHeight(context),
                              // width: Screens.,
                              child: Column(
                                children: [
                                   SizedBox(height: Screens.padingHeight(context)*0.1),
                                  Image.asset("Assets/error-file.png",
                                  height: Screens.padingHeight(context)*0.08,
                                  width: Screens.width(context)*0.4,
                                  ),
                                   SizedBox(height: Screens.padingHeight(context)*0.02),

                                  Text("No Data..!"),
                                ],
                              ))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: context
                                  .read<TransferInwardctrl>()
                                  .filterTransinwdata
                                  .length,
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onDoubleTap: (){},
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<TransferInwardctrl>()
                                          .gettraninwload(context
                                              .read<TransferInwardctrl>()
                                              .filterTransinwdata[index]
                                              .TransNo
                                              .toString());
                                              context
                                          .read<TransferInwardctrl>()
                                          .quantityEnable=false;


                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Screens.padingHeight(context)*0.005,
                                      horizontal: Screens.width(context)*0.01

                                    ),
                                    // color: Colors.red,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Screens.width(context) * 0.02,
                                          vertical:
                                              Screens.padingHeight(context) *
                                                  0.02),
                                       decoration:BoxDecoration(
                                      color:white,
                                    borderRadius: BorderRadius.circular(10),

                                         boxShadow: 
                                    [BoxShadow(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      blurRadius: 5,
                                      spreadRadius: 4
                                    )]                     
                                       ) ,
                                      // height: Screens.padingHeight(context)*0.3,
                                      width: Screens.width(context),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            // color: Colors.amber,
                                      
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Container(
                                            
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[50],
                                      
                                            ),
                                            child: Icon(Icons.person,
                                            size: Screens.padingHeight(context)*0.05,),
                                          ),
                                          SizedBox(height: Screens.padingHeight(context)*0.02,),
                                            Container(
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.2,
                                                    // color: Colors.red,
                                                    child: Text(context
                                                        .read<TransferInwardctrl>()
                                                        .filterTransinwdata[index]
                                                        .TransNo
                                                        .toString()),
                                                  ),
                                            ],
                                          )
                                          ),
                                      
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              // color: Colors.amber,
                                              child:Column(
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.25,
                                                    // color: Colors.red,
                                                    child: Text(context
                                                        .read<TransferInwardctrl>()
                                                        .filterTransinwdata[index]
                                                        .FromBranch
                                                        .toString()),
                                                  ),
                                                  Text("From Branch",
                                                     style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: Colors.grey[500],
                                                fontSize: 14,
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.w400
                                                  ),
                                                  )
                                                ],
                                              ),
                                              
                                            ),
                                             Container(
                                                            
                                                            // color: Colors.amber,
                                                            height: Screens.padingHeight(context)*0.05,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                     Container(
                                                    height: Screens.padingHeight(context)*0.004,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                    Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                   Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                      Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                      Container(
                                                    height: Screens.padingHeight(context)*0.005,
                                                    width: Screens.width(context)*0.002,
                                                    color: const Color.fromARGB(255, 183, 183, 183),
                                        
                                                  ),
                                                  
                                                   
                                                              ],
                                                            ),
                                                           ),
                                                            Container(
                                              // color: Colors.amber,
                                              child:Column(
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                              
                                                    width:
                                                        Screens.width(context) * 0.25,
                                                    // color: Colors.red,
                                                    child:Text( context
                                                        .read<TransferInwardctrl>().config.alignDate1( context
                                                        .read<TransferInwardctrl>()
                                                        .filterTransinwdata[index]
                                                        .TransDate
                                                        .toString())),
                                                  ),
                                                  Text("Doc Date",
                                                     style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: Colors.grey[500],
                                                fontSize: 14,
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.w400
                                                  ),
                                                  ),
                                                  
                                                ],
                                              ),
                                              
                                            ),
                                             Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            Screens.padingHeight(
                                                                    context) *
                                                                0.003,
                                                                   horizontal:
                                                            Screens.padingHeight(
                                                                    context) *
                                                                0.01),
                                                                
                                                                
                                                    // alignment: Alignment.center,
                                                    
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(15),
                                                        color: Color.fromARGB(
                                                            255, 252, 230, 228)),
                                                    child: Text(
                                                      context
                                                          .read<TransferInwardctrl>()
                                                          .filterTransinwdata[index]
                                                          .Status
                                                          .toString(),
                                                      style: theme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              color: Colors.red),
                                                    ),
                                                  ),
                                            
                                          ],
                                        )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
              ],
            ),
          )),
    );
  }
}
