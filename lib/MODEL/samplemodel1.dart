import 'dart:ffi';



class samplemodelheader1{
  String? execption;
  int?rescode;
  model1?Model1;
  samplemodelheader1({
 required this.Model1,
 required this.execption,
 required this.rescode,
  });
  factory samplemodelheader1.fromJson(Map<String,dynamic>jsons,int stcode){
    if(jsons.isEmpty){
      return samplemodelheader1(
        Model1: model1.fromJson(jsons),
         execption: null, 
         rescode: stcode);

    }else{
       return samplemodelheader1(
        Model1: null,
         execption: "No Data..!", 
         rescode: stcode);
    }  
  }
  factory samplemodelheader1.execption(Map<String,dynamic>jsons,int stcode){
    return samplemodelheader1(
      Model1: null,
       execption: "Api Error..!",
        rescode: stcode);
  }
  factory samplemodelheader1.issues(String jsons,int stcode){
    return samplemodelheader1(
      Model1: null,
       execption: "Network Error..!",
        rescode: stcode);
  }
}



class model1 {
  int? DocEntry;
  int? DocNum;
  String? InwardType;
  String? PORef;
  String? DocDate;
  String? SupplierCode;
  String? SupplierName;
  String? SupplierMobile;
  String? AlternateMobileNo;
  String? ContactName;
  String? SupplierEmail;
  String? CompanyName;
  String? GSTNo;
  String? TransRef;
  String? InwardDocDate;
  String? Bil_Address1;
  String? Bil_Address2;
  String? Bil_Address3;
  String? Bil_Area;
  String? Bil_City;
  String? Bil_District;
  String? Bil_State;
  String? Bil_Country;
  String? Bil_Pincode;
  String? Del_Address1;
  String? Del_Address2;
  String? Del_Address3;
  String? Del_Area;
  String? Del_City;
  String? Del_District;
  String? Del_State;
  String? Del_Country;
  String? Del_Pincode;
  String? WhsCode;
  String? OrderStatus;
  double? GrossTotal;
  double? Discount;
  double? SubTotal;
  double? TaxAmount;
  double? RoundOff;
  double? DocTotal;
  String? AttachURL1;
  String? AttachURL2;
  String? AttachURL3;
  String? AttachURL4;
  String? AttachURL5;
  String? OrderNote;
  int? isCancelled;
  String? CancelledDate;
  String? CancelledReason;
  String? CancelledRemarks;
  String? BaseDocId;
  String? BaseDocRef;
  String? BaseDocDate;
  int? CreatedBy;
  String? CreatedDatetime;
  String? UpdatedBy;
  String? UpdatedDatetime;
  String? traceid;
  String? DiscPer;
  List<inwarditems>? INWARD_Items;
  List<inwarditemsbatch>? Inward_Items_Batch;
  List<inwarditemsputaway>? Inward_Items_Putaway;
  List<inwarditemsbatchbase>? InwardItemsBatchBase;
  model1(
      {required this.AlternateMobileNo,
      required this.AttachURL1,
      required this.AttachURL2,
      required this.AttachURL3,
      required this.AttachURL4,
      required this.AttachURL5,
      required this.BaseDocDate,
      required this.BaseDocId,
      required this.BaseDocRef,
      required this.Bil_Address1,
      required this.Bil_Address2,
      required this.Bil_Address3,
      required this.Bil_Area,
      required this.Bil_City,
      required this.Bil_Country,
      required this.Bil_District,
      required this.Bil_Pincode,
      required this.Bil_State,
      required this.CancelledDate,
      required this.CancelledReason,
      required this.CancelledRemarks,
      required this.CompanyName,
      required this.ContactName,
      required this.CreatedBy,
      required this.CreatedDatetime,
      required this.Del_Address1,
      required this.Del_Address2,
      required this.Del_Address3,
      required this.Del_Area,
      required this.Del_City,
      required this.Del_Country,
      required this.Del_District,
      required this.Del_Pincode,
      required this.Del_State,
      required this.DiscPer,
      required this.Discount,
      required this.DocDate,
      required this.DocEntry,
      required this.DocNum,
      required this.DocTotal,
      required this.GSTNo,
      required this.GrossTotal,
      required this.INWARD_Items,
      required this.InwardDocDate,
      required this.InwardItemsBatchBase,
      required this.InwardType,
      required this.Inward_Items_Batch,
      required this.Inward_Items_Putaway,
      required this.OrderNote,
      required this.OrderStatus,
      required this.PORef,
      required this.RoundOff,
      required this.SubTotal,
      required this.SupplierCode,
      required this.SupplierEmail,
      required this.SupplierMobile,
      required this.SupplierName,
      required this.TaxAmount,
      required this.TransRef,
      required this.UpdatedBy,
      required this.UpdatedDatetime,
      required this.WhsCode,
      required this.isCancelled,
      required this.traceid});
  factory model1.fromJson(Map<String, dynamic> jsons) {
    if (jsons != null) {
      var Listt = jsons['INWARD_Items'] as List;
      var Listt1 = jsons['Inward_Items_Batch'] as List;
      var Listt2 = jsons['Inward_Items_Putaway'] as List;
      var Listt3 = jsons['InwardItemsBatchBase'] as List;

      final List<inwarditems> INWARDItems =
          Listt.map((e) => inwarditems.fromJson(e)).toList();
      final List<inwarditemsbatch>? InwardItemsBatch =
          Listt1.map((e) => inwarditemsbatch.fromJson(e)).toList();
      final List<inwarditemsputaway>? InwardItemsPutaway =
          Listt2.map((e) => inwarditemsputaway.fromJson(e)).toList();
// final  List<inwarditemsbatchbase>? InwardItemBatchBase=Listt3.map((e) =>inwarditemsbatchbase.fromJson(e)).toList();

      return model1(
          AlternateMobileNo: jsons['AlternateMobileNo'] ?? "",
          AttachURL1: jsons['AttachURL1'] ?? "",
          AttachURL2: jsons['AttachURL2'] ?? "",
          AttachURL3: jsons['AttachURL3'] ?? "",
          AttachURL4: jsons['AttachURL4'] ?? "",
          AttachURL5: jsons['AttachURL5'] ?? "",
          BaseDocDate: jsons['BaseDocDate'] ?? "",
          BaseDocId: jsons['BaseDocId'] ?? "",
          BaseDocRef: jsons['BaseDocRef'] ?? "",
          Bil_Address1: jsons['Bil_Address1'] ?? "",
          Bil_Address2: jsons['Bil_Address2'] ?? "",
          Bil_Address3: jsons['Bil_Address3'] ?? "",
          Bil_Area: jsons['Bil_Area'] ?? "",
          Bil_City: jsons['Bil_City'] ?? "",
          Bil_Country: jsons['Bil_Country'] ?? "",
          Bil_District: jsons['Bil_District'] ?? "",
          Bil_Pincode: jsons['Bil_Pincode'] ?? "",
          Bil_State: jsons['Bil_State'] ?? "",
          CancelledDate: jsons['CancelledDate'] ?? "",
          CancelledReason: jsons['CancelledReason'] ?? "",
          CancelledRemarks: jsons['CancelledRemarks'] ?? "",
          CompanyName: jsons['CompanyName'] ?? "",
          ContactName: jsons['ContactName'] ?? "",
          CreatedBy: jsons['CreatedBy'] ?? "",
          CreatedDatetime: jsons['CreatedDatetime'] ?? "",
          Del_Address1: jsons['Del_Address1'] ?? "",
          Del_Address2: jsons['Del_Address2'] ?? "",
          Del_Address3: jsons['Del_Address3'] ?? "",
          Del_Area: jsons['Del_Area'] ?? "",
          Del_City: jsons['Del_City'] ?? "",
          Del_Country: jsons['Del_Country'] ?? "",
          Del_District: jsons['Del_District'] ?? "",
          Del_Pincode: jsons['Del_Pincode'] ?? "",
          Del_State: jsons['Del_State'] ?? "",
          DiscPer: jsons['DiscPer'] ?? "",
          Discount: jsons['Discount'] ?? 0.0,
          DocDate: jsons['DocDate'] ?? "",
          DocEntry: jsons['DocEntry'] ?? 0,
          DocNum: jsons['DocNum'] ?? 0,
          DocTotal: jsons['DocTotal'] ?? 0.0,
          GSTNo: jsons['GSTNo'] ?? 0,
          GrossTotal: jsons['GrossTotal'] ?? 0.0,
          INWARD_Items: INWARDItems,
          InwardDocDate: jsons['InwardDocDate'] ?? "",
          InwardItemsBatchBase: jsons['InwardItemsBatchBase'] ?? "",
          InwardType: jsons['InwardType'] ?? "",
          Inward_Items_Batch: InwardItemsBatch,
          Inward_Items_Putaway: InwardItemsPutaway,
          OrderNote: jsons['OrderNote'] ?? "",
          OrderStatus: jsons['OrderStatus'] ?? "",
          PORef: jsons['PORef'] ?? "",
          RoundOff: jsons['RoundOff'] ?? 0.0,
          SubTotal: jsons['SubTotal'] ?? 0.0,
          SupplierCode: jsons['SupplierCode'] ?? "",
          SupplierEmail: jsons['SupplierEmail'] ?? "",
          SupplierMobile: jsons['SupplierMobile'] ?? "",
          SupplierName: jsons['SupplierName'] ?? "",
          TaxAmount: jsons['TaxAmount'] ?? 0.0,
          TransRef: jsons['TransRef'] ?? "",
          UpdatedBy: jsons['UpdatedBy'] ?? "",
          UpdatedDatetime: jsons['UpdatedDatetime'] ?? "",
          WhsCode: jsons['WhsCode'] ?? "",
          isCancelled: jsons['isCancelled'] ?? 0,
          traceid: jsons['traceid'] ?? "");
    } else {
      return model1(
          AlternateMobileNo: null,
          AttachURL1: null,
          AttachURL2: null,
          AttachURL3: null,
          AttachURL4: null,
          AttachURL5: null,
          BaseDocDate: null,
          BaseDocId: null,
          BaseDocRef: null,
          Bil_Address1: null,
          Bil_Address2: null,
          Bil_Address3: null,
          Bil_Area: null,
          Bil_City: null,
          Bil_Country: null,
          Bil_District: null,
          Bil_Pincode: null,
          Bil_State: null,
          CancelledDate: null,
          CancelledReason: null,
          CancelledRemarks: null,
          CompanyName: null,
          ContactName: null,
          CreatedBy: null,
          CreatedDatetime: null,
          Del_Address1: null,
          Del_Address2: null,
          Del_Address3: null,
          Del_Area: null,
          Del_City: null,
          Del_Country: null,
          Del_District: null,
          Del_Pincode: null,
          Del_State: null,
          DiscPer: null,
          Discount: null,
          DocDate: null,
          DocEntry: null,
          DocNum: null,
          DocTotal: null,
          GSTNo: null,
          GrossTotal: null,
          INWARD_Items: null,
          InwardDocDate: null,
          InwardItemsBatchBase: null,
          InwardType: null,
          Inward_Items_Batch: null,
          Inward_Items_Putaway: null,
          OrderNote: null,
          OrderStatus: null,
          PORef: null,
          RoundOff: null,
          SubTotal: null,
          SupplierCode: null,
          SupplierEmail: null,
          SupplierMobile: null,
          SupplierName: null,
          TaxAmount: null,
          TransRef: null,
          UpdatedBy: null,
          UpdatedDatetime: null,
          WhsCode: null,
          isCancelled: null,
          traceid: null);
    }
  }
}

class inwarditems {
  int? DocEntry;
  double? LineNum;
  String? ItemCode;
  String? ItemName;
  double? Unit_Quantity;
  double? Pack_Quantity;
  double? Price;
  double? BasePrice;
  double? TaxRate;
  double? GrossLineTotal;
  double? LineVat;
  double? NetLineTotal;
  int? BaseEntry;
  int? BaseLine;
  String? BaseDocId;
  int? BaseDocLine;
  int? CreatedBy;
  String? CreatedDateTime;
  String? UpdatedBy;
  String? UpdatedDateTime;
  String? TraceId;
  String? DiscPer;
  String? DiscVal;
  String? Taxable;
  String? ManageBy;
  String? hasExpiryDate;
  String? ScannedQty;
  String? ItemType;
  inwarditems(
      {required this.BaseDocId,
      required this.BaseDocLine,
      required this.BaseEntry,
      required this.BaseLine,
      required this.BasePrice,
      required this.CreatedBy,
      required this.CreatedDateTime,
      required this.DiscPer,
      required this.DiscVal,
      required this.DocEntry,
      required this.GrossLineTotal,
      required this.ItemCode,
      required this.ItemName,
      required this.ItemType,
      required this.LineNum,
      required this.LineVat,
      required this.ManageBy,
      required this.NetLineTotal,
      required this.Pack_Quantity,
      required this.Price,
      required this.ScannedQty,
      required this.TaxRate,
      required this.Taxable,
      required this.TraceId,
      required this.Unit_Quantity,
      required this.UpdatedBy,
      required this.UpdatedDateTime,
      required this.hasExpiryDate});
  factory inwarditems.fromJson(Map<String, dynamic> jsons) {
    return inwarditems(
        BaseDocId: jsons["BaseDocId"] ?? "",
        BaseDocLine: jsons["BaseDocLine"] ?? 0,
        BaseEntry: jsons["BaseEntry"] ?? 0,
        BaseLine: jsons["BaseLine"] ?? 0,
        BasePrice: jsons["BasePrice"] ?? 0.0,
        CreatedBy: jsons["CreatedBy"] ?? 0,
        CreatedDateTime: jsons["CreatedDateTime"] ?? "",
        DiscPer: jsons["DiscPer"] ?? "",
        DiscVal: jsons["DiscVal"] ?? "",
        DocEntry: jsons["DocEntry"] ?? 0,
        GrossLineTotal: jsons["GrossLineTotal"] ?? 0.0,
        ItemCode: jsons["ItemCode"] ?? "",
        ItemName: jsons["ItemName"] ?? "",
        ItemType: jsons["ItemType"] ?? "",
        LineNum: jsons["LineNum"] ?? 0.0,
        LineVat: jsons["LineVat"] ?? 0.0,
        ManageBy: jsons["ManageBy"] ?? "",
        NetLineTotal: jsons["NetLineTotal"] ?? 0.0,
        Pack_Quantity: jsons["Pack_Quantity"] ?? 0.0,
        Price: jsons["Price"] ?? 0.0,
        ScannedQty: jsons["ScannedQty"] ?? "",
        TaxRate: jsons["TaxRate"] ?? 0.0,
        Taxable: jsons["Taxable"] ?? "",
        TraceId: jsons["TraceId"] ?? "",
        Unit_Quantity: jsons["Unit_Quantity"] ?? 0.0,
        UpdatedBy: jsons["UpdatedBy"] ?? "",
        UpdatedDateTime: jsons["UpdatedDateTime"] ?? "",
        hasExpiryDate: jsons["hasExpiryDate "] ?? "");
  }
}

class inwarditemsbatch {
  int? AutoID;
  int? DocEntry;
  double? LineNum;
  String? WhsCode;
  String? ItemCode;
  String? ItemName;
  String? ManageBy;
  double? Unit_Quantity;
  double? Pack_Quantity;
  String? SerialBatchCode;
  double? SerialBatchQty;
  String? TagText;
  String? MfgDate;
  String? ExpiryDate;
  int? CreatedBy;
  String? CreatedDateTime;
  String? UpdatedBy;
  String? UpdatedDateTime;
  String? TraceId;
  String? SerialBatch2;
  inwarditemsbatch({
    required this.AutoID,
    required this.CreatedBy,
    required this.CreatedDateTime,
    required this.DocEntry,
    required this.ExpiryDate,
    required this.ItemCode,
    required this.ItemName,
    required this.LineNum,
    required this.ManageBy,
    required this.MfgDate,
    required this.Pack_Quantity,
    required this.SerialBatch2,
    required this.SerialBatchCode,
    required this.SerialBatchQty,
    required this.TagText,
    required this.TraceId,
    required this.Unit_Quantity,
    required this.UpdatedBy,
    required this.UpdatedDateTime,
    required this.WhsCode,
  });
  factory inwarditemsbatch.fromJson(Map<String, dynamic> jsons) {
    return inwarditemsbatch(
        AutoID: jsons["AutoID"] ?? 0,
        CreatedBy: jsons[""] ?? "",
        CreatedDateTime: jsons["CreatedBy"] ?? 0,
        DocEntry: jsons["DocEntry"] ?? 0,
        ExpiryDate: jsons["ExpiryDate"] ?? "",
        ItemCode: jsons["ItemCode"] ?? "",
        ItemName: jsons["ItemName"] ?? "",
        LineNum: jsons["LineNum"] ?? 0.0,
        ManageBy: jsons["ManageBy"] ?? "",
        MfgDate: jsons["MfgDate"] ?? "",
        Pack_Quantity: jsons["Pack_Quantity"] ?? 0.0,
        SerialBatch2: jsons["SerialBatch2"] ?? 0.0,
        SerialBatchCode: jsons["SerialBatchCode"] ?? "",
        SerialBatchQty: jsons["SerialBatchQty"] ?? 0.0,
        TagText: jsons["TagText"] ?? "",
        TraceId: jsons["TraceId"] ?? "",
        Unit_Quantity: jsons["Unit_Quantity"] ?? "",
        UpdatedBy: jsons["UpdatedBy"] ?? "",
        UpdatedDateTime: jsons["UpdatedDateTime"] ?? "",
        WhsCode: jsons["WhsCode"] ?? "");
  }
}

class inwarditemsputaway {
  int? AutoID;
  int? DocEntry;
  double? LineNum;
  int? SerialBatch_LineNum;
  String? WhsCode;
  String? ItemCode;
  String? ItemName;
  String? ManageBy;
  double? Unit_Quantity;
  double? Pack_Quantity;
  String? SerialBatchCode;
  double? SerialBatchQty;
  String? TagText;
  String? BinCode;
  double? BinQty;
  int? CreatedBy;
  String? CreatedDateTime;
  String? UpdatedBy;
  String? UpdatedDateTime;
  String? TraceId;
  inwarditemsputaway(
      {required this.AutoID,
      required this.BinCode,
      required this.BinQty,
      required this.CreatedBy,
      required this.CreatedDateTime,
      required this.DocEntry,
      required this.ItemCode,
      required this.ItemName,
      required this.LineNum,
      required this.ManageBy,
      required this.Pack_Quantity,
      required this.SerialBatchCode,
      required this.SerialBatchQty,
      required this.SerialBatch_LineNum,
      required this.TagText,
      required this.TraceId,
      required this.Unit_Quantity,
      required this.UpdatedBy,
      required this.UpdatedDateTime,
      required this.WhsCode});
  factory inwarditemsputaway.fromJson(Map<String, dynamic> jsons) {
    return inwarditemsputaway(
        AutoID: jsons["AutoID"] ?? "",
        BinCode: jsons["BinCode"] ?? "",
        BinQty: jsons["BinQty"] ?? 0.0,
        CreatedBy: jsons["CreatedBy"] ?? 0,
        CreatedDateTime: jsons["CreatedDateTime"] ?? "",
        DocEntry: jsons["DocEntry"] ?? 0,
        ItemCode: jsons["ItemCode"] ?? "",
        ItemName: jsons["ItemName"] ?? "",
        LineNum: jsons["LineNum"] ?? 0.0,
        ManageBy: jsons["ManageBy"] ?? "",
        Pack_Quantity: jsons["Pack_Quantity"] ?? 0.0,
        SerialBatchCode: jsons["SerialBatchCode"] ?? "",
        SerialBatchQty: jsons["SerialBatchQty"] ?? 0.0,
        SerialBatch_LineNum: jsons["SerialBatch_LineNum"] ?? 0,
        TagText: jsons["TagText"] ?? "",
        TraceId: jsons["TraceId"] ?? "",
        Unit_Quantity: jsons["Unit_Quantity"] ?? 0.0,
        UpdatedBy: jsons["UpdatedBy"] ?? "",
        UpdatedDateTime: jsons["UpdatedDateTime"] ?? "",
        WhsCode: jsons["WhsCode"] ?? "");
  }
}

class inwarditemsbatchbase {
  String? name;
  inwarditemsbatchbase({required this.name});
}
