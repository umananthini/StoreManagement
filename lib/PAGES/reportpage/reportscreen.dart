
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/color.dart';
// import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
// import 'package:warehousemanagement/CONSTANT/screens.dart';
// import 'package:warehousemanagement/CONTROLLER/Reportcontroller/reportctrl.dart';

// class ReportScreen extends StatefulWidget {
//   const ReportScreen({super.key});

//   @override
//   State<ReportScreen> createState() => _ReportScreenState();
// }

// class _ReportScreenState extends State<ReportScreen> {

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       context.read<Reportctrl>().init();
//     });
//   }

//    DateTime? currentBackPressTime;

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
//     final theme=Theme.of(context);
//     return  PopScope(
//        canPop: false,
//       onPopInvoked: (bool didPop) {
//         log("didPop::$didPop");
//         if (didPop) return;
//         onbackpress();
//       },
//       child: Scaffold(
//          appBar: AppBar(
//               centerTitle: true,
//               backgroundColor: secondary,
//               title: Text(
//                 "Reports",
//                 style: theme.textTheme.bodyMedium!.copyWith(
//                     color: white, fontWeight: FontWeight.w600, fontSize: 22),
//               ),
//             ),
      
//                body: Container(
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
                     
//                     },
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(0),
//                       hintText: "Search",
//                       hintStyle: TextStyle(color: Colors.grey),
                    
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: secondary,
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
//                 context.watch<Reportctrl>().isreportloading == true
//                     ? Container(
//                         height: Screens.padingHeight(context) * 0.7,
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             color: secondary,
//                           ),
//                         ),
//                       )
//                     : context.watch<Reportctrl>().reporttable1.isEmpty
//                         ? Center(
//                             child: Container(
//                               child: Text(
//                                 "No Data..",
//                                 style: theme.textTheme.bodyMedium!
//                                     .copyWith(color: Colors.black),
//                               ),
//                             ),
//                           )
//                         :context.watch<Reportctrl>().reporttable1.isEmpty
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
//                                   .read<Reportctrl>()
//                                   .reporttable1
//                                   .length,
//                               itemBuilder: ((context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                      setState(() {
//                                       context
//                                           .read<Reportctrl>()
//                                           .docentryfirst = index;
//                                       context
//                                               .read<Reportctrl>()
//                                               .secondpagereportlist =
//                                           context
//                                               .read<Reportctrl>()
//                                               .reporttable1[index];
                                              
//                                       Get.toNamed(
//                                           ConstantRoutes.secondreport);
//                                             context.read<Reportctrl>().secondpageinit();
//                                     });
//                                   },
//                                   child: Card(
//                                     child: Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               Screens.width(context) * 0.02,
//                                           vertical:
//                                               Screens.padingHeight(context) *
//                                                   0.02),
//                                       //  decoration: ,
//                                       color: white,
//                                       // height: Screens.padingHeight(context)*0.3,
//                                       width: Screens.width(context),
//                                       child: Column(
//                                         children: [
//                                            Container(
//                                             padding: EdgeInsets.symmetric(
//                                               vertical: Screens.padingHeight(context)*0.005,
//                                               horizontal: Screens.width(context)*0.005,

//                                             ),
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(10),
//                                                 color:grey,

//                                             ),
//                                                 alignment:Alignment.topCenter,
      
//                                                 width:
//                                                     Screens.width(context) * 0.6,
//                                                  child: Text(
//                                               context
//                                                   .read<Reportctrl>()
//                                                   .reporttable1[index]
//                                                   .Vendor
//                                                   .toString(),
//                                               style: theme.textTheme.bodyMedium!
//                                                   .copyWith(
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.w600,
//                                                     color:Colors.black,
//                                                       ),
//                                             ),
//                                               ),
//                                               SizedBox(height: Screens.padingHeight(context)*0.01,),
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
//                                                 alignment: Alignment.topCenter,
      
//                                                 width:
//                                                     Screens.width(context) * 0.3,
//                                                 padding: EdgeInsets.symmetric(
//                                                   vertical: Screens.padingHeight(context)*0.005,
//                                                   horizontal: Screens.width(context)*0.005
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(5),
//                                                 color:fourth,

//                                                 ),
//                                                 child: Text(context
//                                                     .read<Reportctrl>()
//                                                     .reporttable1[index]
//                                                     .DocNum
//                                                     .toString(),
//                                                     style: theme.textTheme.bodyMedium!.copyWith(
//                                                       fontWeight: FontWeight.bold
//                                                     ),
//                                                     ),
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
//                                                     .read<Reportctrl>()
//                                                     .reporttable1[index]
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
//                                                     .read<Reportctrl>()
//                                                     .reporttable1[index]
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


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/Reportcontroller/reportctrl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Reportctrl>().init();
    });
  }

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Get.offAllNamed(ConstantRoutes.dashboard);
     context.read<Reportctrl>(). reporttable1.clear();
   context.read<Reportctrl>(). datecontrol.clear();

  
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

                            
                          });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Reports",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: white, fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
          ),
        body: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(
            horizontal: Screens.width(context) * 0.02,
            vertical: Screens.padingHeight(context) * 0.01,
          ),
          width: Screens.width(context),
          child: Column(
            children: [
             

              SizedBox(height: Screens.padingHeight(context) * 0.01),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: ()  {
                        setState(() {
                           context.read<Reportctrl>(). getdate(context,theme);
                        });
                      
                   
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Screens.width(context) * 0.02,
                          vertical: Screens.padingHeight(context) * 0.015,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:white,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.date_range, color: secondary),
                            SizedBox(width: Screens.width(context)*0.03,),
                          context.read<Reportctrl>(). datecontrol.text.isNotEmpty?   Text(
                              "${context.read<Reportctrl>(). datecontrol.text}",
                              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey,
                              fontSize: 15
                              ),
                            ):
                            Text(
                              "Select Date Range",
                              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey,
                              fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<Reportctrl>().getreportsapi();
                      context.read<Reportctrl>(). reporttable1.clear();

                    },
                    style: ElevatedButton.styleFrom(backgroundColor: secondary),
                    child: const Text("Search", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: Screens.padingHeight(context) * 0.01),

             context.read<Reportctrl>(). datecontrol.text.isEmpty?Container():  Container(
                height: Screens.padingHeight(context) * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  cursorColor: thirdcolor,
                  onChanged: (v) {
                    context.read<Reportctrl>().searchReports(v);
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: secondary),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),

              SizedBox(height: Screens.padingHeight(context) * 0.01),

             
              Expanded(
                child: context.watch<Reportctrl>().isreportloading
                    ? Center(
                        child: CircularProgressIndicator(color: secondary),
                      )
                    : context.watch<Reportctrl>().reporttable1.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "Assets/error-file.png",
                                height: Screens.padingHeight(context) * 0.08,
                                width: Screens.width(context) * 0.4,
                              ),
                              SizedBox(height: Screens.padingHeight(context) * 0.02),
                              const Text("No Data..!"),
                            ],
                          )
                        : ListView.builder(
                            itemCount: context.read<Reportctrl>().reporttable1.length,
                            itemBuilder: ((context, index) {
                              final report = context.read<Reportctrl>().reporttable1[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screens.width(context)*0.01,
                                  vertical: Screens.width(context)*0.01

                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      context.read<Reportctrl>().docentryfirst = index;
                                      context.read<Reportctrl>().secondpagereportlist = report;
                                      Get.toNamed(ConstantRoutes.secondreport);
                                      context.read<Reportctrl>().secondpageinit();
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Screens.width(context) * 0.02,
                                      vertical: Screens.padingHeight(context) * 0.02,
                                    ),
                                    decoration: BoxDecoration(
                                    color: white,

                                      borderRadius: BorderRadius.circular(15),
                                        boxShadow: 
                                    [BoxShadow(
                                      color: Color.fromARGB(255, 239, 239, 239),
                                      blurRadius: 5,
                                      spreadRadius: 4
                                    )]           
                                    ),
                                    width: Screens.width(context),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: Screens.padingHeight(context) * 0.005,
                                            horizontal: Screens.width(context) * 0.005,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: grey,
                                          ),
                                          alignment: Alignment.topCenter,
                                          width: Screens.width(context) * 0.6,
                                          child: Text(
                                            report.Vendor.toString(),
                                            style: theme.textTheme.bodyMedium!.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Screens.padingHeight(context) * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Doc No",
                                                style: theme.textTheme.bodyMedium!.copyWith(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500)),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: Screens.padingHeight(context) * 0.005,
                                                horizontal: Screens.width(context) * 0.005,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: fourth,
                                              ),
                                              child: Text(
                                                report.DocNum.toString(),
                                                style: theme.textTheme.bodyMedium!
                                                    .copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Screens.padingHeight(context) * 0.005),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Vendor Code",
                                                style: theme.textTheme.bodyMedium!.copyWith(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500)),
                                            Text(report.VendorCode.toString()),
                                          ],
                                        ),
                                        SizedBox(height: Screens.padingHeight(context) * 0.005),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Doc Date",
                                                style: theme.textTheme.bodyMedium!.copyWith(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500)),
                                            Text(report.DocDate.toString()),
                                          ],
                                        ),
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
        ),
      ),
    );
  }
}
