import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/allrouts.dart';
import 'package:warehousemanagement/CONTROLLER/AUDITCONTROLLER/auditctrl.dart';
import 'package:warehousemanagement/CONTROLLER/ApprovalController/Approvalcontroller.dart';
import 'package:warehousemanagement/CONTROLLER/DashBoardController/dashboardctrl.dart';
// import 'package:warehousemanagement/CONTROLLER/DisplaytoSellableController/DisptoSellableController.dart';
import 'package:warehousemanagement/CONTROLLER/Displaytosellable/displaytosellable.dart';
// import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/detailpurchaseinwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/LoginController/loginctrl.dart';
import 'package:warehousemanagement/CONTROLLER/PurchaseInwardController/purchaseinwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/Reportcontroller/reportctrl.dart';
import 'package:warehousemanagement/CONTROLLER/RequestController/request_controller.dart';
import 'package:warehousemanagement/CONTROLLER/SalereturnInwCOntroller/salesreturninwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/SellabletoDisplayController/SellabletoDisController.dart';
import 'package:warehousemanagement/CONTROLLER/SplashController/splashctrl.dart';
import 'package:warehousemanagement/CONTROLLER/TransferInwardController/transferinwardctrl.dart';
import 'package:warehousemanagement/CONTROLLER/TransferOutwardController/getoutwardctrl.dart';
import 'package:warehousemanagement/DBHELPER/dbhelper.dart';
import 'package:warehousemanagement/PAGES/Dashboard/dashboardpage.dart';
import 'package:warehousemanagement/PAGES/Login/loginpage.dart';
import 'package:warehousemanagement/PAGES/Sellable%20to%20Display/sellable2displayOLD.dart';
import 'package:warehousemanagement/PAGES/Splash%20Screen/splachscreen.dart';
import 'package:warehousemanagement/PAGES/TransferOutWard/transferoutwardpage.dart';
import 'package:warehousemanagement/PAGES/navbar.dart/navbarscreen.dart';
import 'package:warehousemanagement/PAGES/SalesReturnInward/salesreturninward.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Createdb();
  runApp(const MyApp());
}

Future Createdb() async {
  await DBHelper.getinstance().then((value) {
    log("DB created");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PurchaseInwardCtrl()),
        ChangeNotifierProvider(create: (_) => TransferInwardctrl()),
        ChangeNotifierProvider(create: (_) => TransferOutwardctrl()),
        ChangeNotifierProvider(create: (_) => Dashboardctrl()),
        // ChangeNotifierProvider(create: (_) => DetailPurchaseInwardctrl()),
        // ChangeNotifierProvider(create: (_) => PurchaseInwardListCtrl()),
        ChangeNotifierProvider(create: (_) => LoginCtrl()),
        ChangeNotifierProvider(create: (_) => Salesreturninwardctrl()),
        ChangeNotifierProvider(create: (_) => Splachctrl()),
        ChangeNotifierProvider(create: (_) => SellableoDispController()),
        ChangeNotifierProvider(create: (_) => DisplayToSellablectrl()),
        ChangeNotifierProvider(create: (_) => ApprovalController()),
        ChangeNotifierProvider(create: (_) => Reportctrl()),
        ChangeNotifierProvider(create: (_) => RequestController()),

        ChangeNotifierProvider(create: (_) => gggggg()),
      ],
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!);
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: false),
        home: Splash2Screen(),
        getPages: Routes.allRoutes,
      ),
    );
  }
}
