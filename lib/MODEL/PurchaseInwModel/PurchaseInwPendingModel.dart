import 'dart:convert';
import 'dart:developer';

class PurchaseInwPendingModel {
  PurchaseInwPendingDetailheader? inwardDetailheader;
  String? message;
  int? stcode;
  String? exception;
  PurchaseInwPendingModel(
      {required this.inwardDetailheader,
      required this.stcode,
      required this.message,
      required this.exception});

  factory PurchaseInwPendingModel.fromJson(
      Map<String, dynamic> jsons, int stcode) {
    if (jsons != null) {
      var list = json.decode(jsons['data'] as String) as Map<String, dynamic>;
      return PurchaseInwPendingModel(
          inwardDetailheader: PurchaseInwPendingDetailheader.fromJson(list),
          stcode: stcode,
          message: "success",
          exception: null);
    } else {
      return PurchaseInwPendingModel(
          inwardDetailheader: null,
          stcode: stcode,
          message: "fail",
          exception: null);
    }
  }

  factory PurchaseInwPendingModel.issues(
      Map<String, dynamic> jsons, int stcode) {
    return PurchaseInwPendingModel(
        inwardDetailheader: null,
        stcode: stcode,
        message: jsons["respCode"],
        exception: jsons["respDesc"]);
  }
  factory PurchaseInwPendingModel.error(String? exception, int stcode) {
    return PurchaseInwPendingModel(
        inwardDetailheader: null,
        stcode: stcode,
        message: "",
        exception: exception);
  }
}

class PurchaseInwPendingDetailheader {
  List<PendingVendorModel>? itemlist;
  List<PurchaseInwPendingDetailList>? itemlist22;
  PurchaseInwPendingDetailheader(
      {required this.itemlist, required this.itemlist22});
  factory PurchaseInwPendingDetailheader.fromJson(Map<String, dynamic> jsons) {
    if (jsons != null) {
      var list = jsons['Table1'] as List;
      var list2 = jsons['Table2'] as List;
      if (list.isNotEmpty && list2.isNotEmpty) {
        List<PendingVendorModel> datalist =
            list.map((data) => PendingVendorModel.fromJson(data)).toList();
        List<PurchaseInwPendingDetailList> datalist2 = list2
            .map((data) => PurchaseInwPendingDetailList.fromJson(data))
            .toList();
        return PurchaseInwPendingDetailheader(
            itemlist: datalist, itemlist22: datalist2);
      } else {
        return PurchaseInwPendingDetailheader(itemlist: null, itemlist22: null);
      }
    } else {
      return PurchaseInwPendingDetailheader(itemlist: null, itemlist22: null);
    }
  }
}

class PendingVendorModel {
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
  String? PORef;

  PendingVendorModel(
      {required this.Address,
      required this.Brand,
      required this.Code,
      required this.DocDate,
      required this.DocNum,
      required this.DocTotal,
      required this.GST,
      required this.Name,
      required this.Vendor,
      required this.VendorCode,
      required this.PORef});
  factory PendingVendorModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PendingVendorModel(
      Address: json['Address'] ?? '',
      Brand: json['Brand'] ?? '',
      Code: json['Code'] ?? 0,
      DocDate: json['DocDate'] ?? '',
      DocNum: json['DocNum'] ?? 0,
      DocTotal: json['DocTotal'] ?? '',
      GST: json['GST'] ?? '',
      Name: json['Name'] ?? '',
      Vendor: json['Vendor'] ?? '',
      VendorCode: json['VendorCode'] ?? '',
      PORef: json['PORef'] ?? '',
    );
  }
}

class PurchaseInwPendingDetailList {
  int? DocEntry;
  int? LineNum;
  String? itemcode;
  String? ItemName;
  String? u_category;
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
  String? manageBy;
  String? priceedit;
  // String? linetotal;

  PurchaseInwPendingDetailList(
      {required this.priceedit,
      required this.DiscP,
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
      required this.u_category,
      required this.manageBy,
      required this.itemcode});
  factory PurchaseInwPendingDetailList.fromJson(Map<String, dynamic> json) {
    // log("hgg::"+json["DocEntry"].toString());
    return PurchaseInwPendingDetailList(
        priceedit: null,
        DiscP: json['DiscP'] ?? '',
        u_category: json['Category'] ?? '',
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
        manageBy: json['ManageBy'] ?? "",
        itemcode: json['itemcode'] ?? '');
  }
}
