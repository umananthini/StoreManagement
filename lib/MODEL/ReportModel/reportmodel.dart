
import 'dart:convert';
import 'dart:developer';

class ReportmodelPendingDetailheader {
  Reportmodel? inwardDetailheader;
  String? message;
  int? stcode;
  String? exception;
  ReportmodelPendingDetailheader(
      {required this.inwardDetailheader,
      required this.stcode,
      required this.message,
      required this.exception});

  factory ReportmodelPendingDetailheader.fromJson(
      Map<String, dynamic> jsons, int stcode) {
    if (jsons != null) {
      var list = json.decode(jsons['data'] as String) as Map<String, dynamic>;
      return ReportmodelPendingDetailheader(
          inwardDetailheader: Reportmodel.fromJson(list),
          stcode: stcode,
          message: "success",
          exception: null);
    } else {
      return ReportmodelPendingDetailheader(
          inwardDetailheader: null,
          stcode: stcode,
          message: "fail",
          exception: null);
    }
  }

  factory ReportmodelPendingDetailheader.issues(
      Map<String, dynamic> jsons, int stcode) {
    return ReportmodelPendingDetailheader(
        inwardDetailheader: null,
        stcode: stcode,
        message: jsons["respCode"],
        exception: jsons["respDesc"]);
  }
  factory ReportmodelPendingDetailheader.error(String? exception, int stcode) {
    return ReportmodelPendingDetailheader(
        inwardDetailheader: null,
        stcode: stcode,
        message: "",
        exception: exception);
  }
}

class Reportmodel {
  List<Reportmodeltable1>? itemlist;
  List<Reportmodeltable2>? itemlist22;
  Reportmodel(
      {required this.itemlist, required this.itemlist22});
  factory Reportmodel.fromJson(Map<String, dynamic> jsons) {
    if (jsons != null) {
      var list = jsons['Table1'] as List;
      var list2 = jsons['Table2'] as List;
      if (list.isNotEmpty && list2.isNotEmpty) {
        List<Reportmodeltable1> datalist =
            list.map((data) => Reportmodeltable1.fromJson(data)).toList();
        List<Reportmodeltable2> datalist2 = list2
            .map((data) => Reportmodeltable2.fromJson(data))
            .toList();
        return Reportmodel(
            itemlist: datalist, itemlist22: datalist2);
      } else {
        return Reportmodel(itemlist: null, itemlist22: null);
      }
    } else {
      return Reportmodel(itemlist: null, itemlist22: null);
    }
  }
}

class Reportmodeltable1 {
  int? Code;
  String? VendorCode;
  String? Vendor;
  int? DocNum;
  String? DocDate;
  String? Name;
  String? DocTotal;
  String? Address;
  String? GST;
  String? Brand;
  Reportmodeltable1(
      {required this.Address,
      required this.Brand,
      required this.Code,
      required this.DocDate,
      required this.DocNum,
      required this.DocTotal,
      required this.GST,
      required this.Name,
      required this.Vendor,
      required this.VendorCode});
  factory Reportmodeltable1.fromJson(Map<String, dynamic> json) {
    return Reportmodeltable1(
        Address: json['Address'] ?? '',
        Brand: json['Brand'] ?? '',
        Code: json['Code'] ?? 0,
        DocDate: json['DocDate'] ?? '',
        DocNum: json['DocNum'] ?? 0,
        DocTotal: json['DocTotal'] ?? '',
        GST: json['GST'] ??'',
        Name: json['Name'] ??'',
        Vendor: json['Vendor'] ??'',
        VendorCode: json['VendorCode'] ??'');
  }
}

class Reportmodeltable2 {
  int? DocEntry;
  int? LineNum;
  String? itemcode;
  String? ItemName;
  String? Qty;
  String? Price;
  String? TaxCode;
  String? TaxRate;
  String? PriceAfVAT;
  String? DiscP;
  String? WhsCode;
  String? SellPrice;
  String? MRP;
  String? Segment;

  Reportmodeltable2(
      {required this.DiscP,
      required this.DocEntry,
      required this.ItemName,
      required this.LineNum,
      required this.MRP,
      required this.Price,
      required this.PriceAfVAT,
      required this.Qty,
      required this.Segment,
      required this.SellPrice,
      required this.TaxCode,
      required this.TaxRate,
      required this.WhsCode,
      required this.itemcode});
  factory Reportmodeltable2.fromJson(Map<String, dynamic> json) {
    // log("hgg::"+json["DocEntry"].toString());
    return Reportmodeltable2(
        DiscP: json['DiscP'] ?? '',
        DocEntry: json['DocEntry'] ?? 0,
        ItemName: json['ItemName'] ?? '',
        LineNum: json['LineNum'] ?? 0,
        MRP: json['MRP'] ?? '',
        Price: json['Price'] ?? '',
        PriceAfVAT: json['PriceAfVAT'] ?? '',
        Qty: json['Qty'] ?? '',
        Segment: json['Segment'] ?? '',
        SellPrice: json['SellPrice'] ?? '',
        TaxCode: json['TaxCode'] ?? '',
        TaxRate: json['TaxRate'] ?? '',
        WhsCode: json['WhsCode'] ?? '',
        itemcode: json['itemcode'] ?? '');
  }
}
