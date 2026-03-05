
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:warehousemanagement/MODEL/ReportModel/reportmodel.dart';
// import 'package:warehousemanagement/SERVICES/Report/reportservice.dart';

// class Reportctrl extends ChangeNotifier{

// init(){
//   log('report ctrl created');
//   getreportsapi();
//   notifyListeners();
// }

// bool isreportloading = false;
// String? exception;
// List<Reportmodeltable1> reporttable1=[];
// List<Reportmodeltable2> reporttable2=[];


//   getreportsapi() async {
   
//     isreportloading = true;
//     exception = '';
//     notifyListeners();

//     await reportservice.getdata().then((value){
//       if (value.stcode! >= 200 && value.stcode! <= 210){
//         if (value.inwardDetailheader!.itemlist != null &&
//             value.inwardDetailheader!.itemlist!.isNotEmpty){
//           reporttable1 = value.inwardDetailheader!.itemlist!;
//           reporttable2 = value.inwardDetailheader!.itemlist22!;
//       searchfilterthirdpagereportlist=thirdpagereportlist;

//           isreportloading = false;
//           exception = '';
//           log("pendinglist::" + reporttable1.length.toString());
//           notifyListeners();
//         } else if (value.inwardDetailheader!.itemlist == null ||
//             value.inwardDetailheader!.itemlist!.isEmpty) {
//           isreportloading = false;
//           // lottie = 'Asset/no-data.png';
//           exception = "No data Found..!!";
//           notifyListeners();
//         }
//       } else if (value.stcode! >= 400 && value.stcode! <= 410) {
//         isreportloading = false;
//         // lottie = '';
//         exception = "${value.message}..${value.exception}..!!";
//         notifyListeners();
//       } else {
//         if (value.exception!.contains("Network is unreachable")) {
//           // lottie = 'Asset/network-signal.png';
//           isreportloading = false;
//           exception =
//               "'${value.stcode!}..!!Network Issue..\nTry again Later..!!";
//           notifyListeners();
//         } else {
//           // lottie = 'Asset/warning.png';
//           isreportloading = false;
//           exception = "${value.stcode}..${value.exception}..!!";
//           notifyListeners();
//         }
//       }
//     });
//   }
//   bool   isscheckloading=false;
//   bool   report2pageloading=false;
//   List<Reportmodeltable2>thirdpagereportlist=[];
//   List<Reportmodeltable2>searchfilterthirdpagereportlist=[];

//   Reportmodeltable1? secondpagereportlist;
//   int? docentryfirst;
//    SearchFiltereport(String v) {
//     print('saearch :' + v!);
//     if (v.isNotEmpty) {
//       // isloading=true;

//       searchfilterthirdpagereportlist=thirdpagereportlist.where(
//         (e) => (e).Segment.toString().toLowerCase().contains(v.toLowerCase(),) ||
//               //  (e).DocEntry.toString().toLowerCase().contains(v.toLowerCase(),)||
//                 (e).itemcode.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                  (e).ItemName.toString().toLowerCase().contains(v.toLowerCase(),) ||

//                    (e).Qty.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                     (e).Price.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                      (e).TaxCode.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                       (e).TaxRate.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                       (e).SellPrice.toString().toLowerCase().contains(v.toLowerCase(),) ||
//                       (e).MRP.toString().toLowerCase().contains(v.toLowerCase(),) ,

            
                
        
      
//       ).toList();
      

//       notifyListeners();
//     } else if (v.isEmpty) {
//       searchfilterthirdpagereportlist=thirdpagereportlist;
//       notifyListeners();
//     }
//   }



  
//    secondpageinit() async{
//     isscheckloading=false;
//     report2pageloading =true;
//     notifyListeners();
    

   
                                               

   
//     for (int i = 0; i < reporttable2.length; i++) {
//       log("secondpagevendorlist!.Code:" +
//           secondpagereportlist!.Code.toString());
//       log("vendoritemlist[i].DocEntry::" +
//           reporttable2[i].DocEntry.toString());
//       if (reporttable2[i].DocEntry == secondpagereportlist!.Code) {
//         thirdpagereportlist.add(Reportmodeltable2(
//             DiscP: reporttable2[i].DiscP,
//             DocEntry: reporttable2[i].DocEntry,
//             ItemName: reporttable2[i].ItemName,
//             LineNum: reporttable2[i].LineNum,
//             MRP: reporttable2[i].MRP,
//             Price: reporttable2[i].Price,
//             PriceAfVAT: reporttable2[i].PriceAfVAT,
//             Qty: reporttable2[i].Qty,
//             Segment: reporttable2[i].Segment,
//             SellPrice: reporttable2[i].SellPrice,
//             TaxCode: reporttable2[i].TaxCode,
//             TaxRate: reporttable2[i].TaxRate,
//             WhsCode: reporttable2[i].WhsCode,
//             itemcode: reporttable2[i].itemcode));
//             // filtersecondvendoritemlist =secondvendoritemlist;
//       }
//       notifyListeners();
//     }}
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/MODEL/ReportModel/reportmodel.dart';
import 'package:warehousemanagement/SERVICES/Report/reportservice.dart';

class Reportctrl extends ChangeNotifier {
  bool isreportloading = false;
  String? exception;

  List<Reportmodeltable1> reporttable1 = [];
  List<Reportmodeltable1> originalReportList = []; // 🔹 backup list for filtering
  List<Reportmodeltable2> reporttable2 = [];

  bool isscheckloading = false;
  bool report2pageloading = false;

  List<Reportmodeltable2> thirdpagereportlist = [];
  List<Reportmodeltable2> searchfilterthirdpagereportlist = [];

  Reportmodeltable1? secondpagereportlist;
  int? docentryfirst;
  TextEditingController datecontrol=TextEditingController();
String? fromdate;
String? todate;
  init() {
    log('report ctrl created');
    // // getreportsapi();
    fromdate ='';
    todate="";

    // datecontrol.clear();
    notifyListeners();
    searchfilterthirdpagereportlist.clear();
  }
  getdate(BuildContext context,ThemeData t)async{
      DateTimeRange? picked = await showDateRangePicker(
  context: context,
  firstDate: DateTime(2000),
  lastDate: DateTime.now(),
  initialDateRange: DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  ),
  barrierColor: primarycolor.withOpacity(0.2), 
  builder: (context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: primarycolor,
          onPrimary: Colors.white, 
          onSurface: Colors.black, 
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primarycolor,           ),
        ),
      ),
      child: child!,
    );
  },
);

                        if (picked != null) {
                          fromdate ="${picked.start.year}-${picked.start.month}-${picked.start.day}";
                         todate ="${picked.end.year}-${picked.end.month}-${picked.end.day}";
                          datecontrol.text="${picked.start.day}-${picked.start.month}-${picked.start.year}/${picked.end.day}-${picked.end.month}-${picked.end.year}";
                          notifyListeners();
                          // context.read<Reportctrl>().filterByDate(picked.start, picked.end);
                        }
  }

  getreportsapi() async {
    isreportloading = true;
    exception = '';
    notifyListeners();

    await reportservice.getdata(fromdate,todate).then((value) {
      if (value.stcode! >= 200 && value.stcode! <= 210) {
        if (value.inwardDetailheader!.itemlist != null &&
            value.inwardDetailheader!.itemlist!.isNotEmpty) {
          reporttable1 = value.inwardDetailheader!.itemlist!;
          originalReportList = List.from(reporttable1);
          reporttable2 = value.inwardDetailheader!.itemlist22!;
          searchfilterthirdpagereportlist = thirdpagereportlist;

          isreportloading = false;
          exception = '';
          log("pendinglist::" + reporttable1.length.toString());
          notifyListeners();
        } else {
          isreportloading = false;
          exception = "No data Found..!!";
          notifyListeners();
        }
      } else if (value.stcode! >= 400 && value.stcode! <= 410) {
        isreportloading = false;
        exception = "${value.message}..${value.exception}..!!";
        notifyListeners();
      } else {
        if (value.exception!.contains("Network is unreachable")) {
          isreportloading = false;
          exception =
              "'${value.stcode!}..!!Network Issue..\nTry again Later..!!";
          notifyListeners();
        } else {
          isreportloading = false;
          exception = "${value.stcode}..${value.exception}..!!";
          notifyListeners();
        }
      }
    });
  }

  void searchReports(String v) {
    if (v.isNotEmpty) {
      reporttable1 = originalReportList.where((e) {
        return e.Vendor.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.DocNum.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.VendorCode.toString().toLowerCase().contains(v.toLowerCase())||
            e.DocDate.toString().toLowerCase().contains(v.toLowerCase()) ;

      }).toList();
    } else {
      reporttable1 = List.from(originalReportList);
    }
    notifyListeners();
  }

  void filterByDate(DateTime start, DateTime end) {
    reporttable1 = originalReportList.where((e) {
      try {
        DateTime docDate = DateTime.parse(e.DocDate.toString());
        return docDate.isAfter(start.subtract(const Duration(days: 1))) &&
            docDate.isBefore(end.add(const Duration(days: 1)));
      } catch (err) {
        return false;
      }
    }).toList();
    notifyListeners();
  }



  //  RESET FILTER
  void resetFilter() {
    reporttable1 = List.from(originalReportList);
    notifyListeners();
  }



  //  SEARCH in third page (already had)
  SearchFiltereport(String v) {
    if (v.isNotEmpty) {
      searchfilterthirdpagereportlist = thirdpagereportlist.where(
        (e) =>
            e.Segment.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.itemcode.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.ItemName.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.Qty.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.Price.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.TaxCode.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.TaxRate.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.SellPrice.toString().toLowerCase().contains(v.toLowerCase()) ||
            e.MRP.toString().toLowerCase().contains(v.toLowerCase()),
      ).toList();
    } else {
      searchfilterthirdpagereportlist = thirdpagereportlist;
    }
    notifyListeners();
  }


  //  SECOND PAGE INIT
  secondpageinit() async {
    isscheckloading = false;
    report2pageloading = true;
    notifyListeners();

    for (int i = 0; i < reporttable2.length; i++) {
      if (reporttable2[i].DocEntry == secondpagereportlist!.Code) {
        thirdpagereportlist.add(Reportmodeltable2(
          DiscP: reporttable2[i].DiscP,
          DocEntry: reporttable2[i].DocEntry,
          ItemName: reporttable2[i].ItemName,
          LineNum: reporttable2[i].LineNum,
          MRP: reporttable2[i].MRP,
          Price: reporttable2[i].Price,
          PriceAfVAT: reporttable2[i].PriceAfVAT,
          Qty: reporttable2[i].Qty,
          Segment: reporttable2[i].Segment,
          SellPrice: reporttable2[i].SellPrice,
          TaxCode: reporttable2[i].TaxCode,
          TaxRate: reporttable2[i].TaxRate,
          WhsCode: reporttable2[i].WhsCode,
          itemcode: reporttable2[i].itemcode,
        ));
      }
    }
    notifyListeners();
  }
}
