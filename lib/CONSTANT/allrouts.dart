import 'package:get/get.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/PAGES/Dashboard/dashboardpage.dart';
import 'package:warehousemanagement/PAGES/DisplaytoSellable/Displaytosellablepage.dart';
import 'package:warehousemanagement/PAGES/DisplaytoSellable/DisplaytoselleblePageOLD.dart';
import 'package:warehousemanagement/PAGES/DisplaytoSellable/displaytosllable2.dart';
import 'package:warehousemanagement/PAGES/PurchaseInward1/PurchaseInwardSecondPage.dart';
import 'package:warehousemanagement/PAGES/PurchaseInward1/Purchaseinwardnewfirst.dart';
// import 'package:warehousemanagement/PAGES/PurchaseInwardold/DetailPurchaseinward/detailpurchaseinward.dart';
import 'package:warehousemanagement/PAGES/Login/loginpage.dart';
// import 'package:warehousemanagement/PAGES/PurchaseInward/PurchaseInwardSecondPage.dart';
// import 'package:warehousemanagement/PAGES/PurchaseInward/Purchaseinwardnewfirst.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';
import 'package:warehousemanagement/PAGES/Sellable%20to%20Display/sellable2display.dart';
import 'package:warehousemanagement/PAGES/Sellable%20to%20Display/sellable2displayOLD.dart';
import 'package:warehousemanagement/PAGES/Splash%20Screen/restrictionPage.dart';
import 'package:warehousemanagement/PAGES/TransferInward/loadtransferinwardscreen.dart';
import 'package:warehousemanagement/PAGES/TransferInward/transferinwardpage.dart';
import 'package:warehousemanagement/PAGES/TransferOutWard/TransOutsecondPage.dart';
import 'package:warehousemanagement/PAGES/approvalpage/approvalscreen.dart';
// import 'package:warehousemanagement/PAGES/navbar.dart/navbarscreen.dart';
// import 'package:warehousemanagement/PAGES/PurchaseInward/PurchaseInwardList/purchaseinwardlist.dart';
// import 'package:warehousemanagement/PAGES/PurchaseInward/Purchaseinward/purchaseinwardpage.dart';
import 'package:warehousemanagement/PAGES/SalesReturnInward/salesreturninward.dart';
import 'package:warehousemanagement/PAGES/TransferInward/transferinwardpageOLDD.dart';
import 'package:warehousemanagement/PAGES/TransferOutWard/transferoutwardpage.dart';
import 'package:warehousemanagement/PAGES/reportpage/reportscreen.dart';
import 'package:warehousemanagement/PAGES/reportpage/reportsecondscreen.dart';
import 'package:warehousemanagement/PAGES/request/request_Screen.dart';

class Routes {
  static List<GetPage> allRoutes = [
    GetPage<dynamic>(
        // name: "/dashboard",
        name: ConstantRoutes.dashboard,
        page: () => const DashboardScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    // GetPage<dynamic>(
    //     name: ConstantRoutes.navbarscreeen,
    //     page: () => const NavBarScreen(),
    //     transition: Transition.fade,
    //     transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.transferinward,
        page: () => const TransferInwardScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    // GetPage<dynamic>(
    //     name: ConstantRoutes.purchaseinward,
    //     page: () => const PurchaseInwardScreen(),
    //     transition: Transition.fade,
    //     transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.transferoutward,
        page: () => const TransferOutwardScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.dashboard,
        page: () => const DashboardScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    // GetPage<dynamic>(
    //     name: ConstantRoutes.detailpurchaseinward,
    //     page: () => const DetailPurchaseInwardScreen(),
    //     transition: Transition.fade,
    //     transitionDuration: const Duration(seconds: 1)),
    // GetPage<dynamic>(
    //     name: ConstantRoutes.purchaseinwardlist,
    //     page: () => const PurchaseInwardListScreen(),
    //     transition: Transition.fade,
    //     transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.login,
        page: () => const LoginScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.salesreturninward,
        page: () => const SalesreturninwardScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.loadtransferinward,
        page: () => const LoadTransferInwardpage(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.approval,
        page: () => const ApprovalScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.transOutsecondpage,
        page: () => const TransOutsecondpage(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.purchaseinwnew,
        page: () => PurchaseInwNewFirst(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.purchaseinwnewsec,
        page: () => PurchaseInwSecond(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.sellabletodisplayScreen,
        page: () => const SellabletodisplayScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.displaytosellable,
        page: () => const DisplaytoSellable(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.displaytosellable2,
        page: () => const DisplaytoSellable2screen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.qrpage,
        page: () => const QRscanner(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.report,
        page: () => const ReportScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.secondreport,
        page: () => const reportSecondscreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.requestScreen,
        page: () => const RequestScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage<dynamic>(
        name: ConstantRoutes.restrictionpage,
        page: () => const Restrictionpage(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
