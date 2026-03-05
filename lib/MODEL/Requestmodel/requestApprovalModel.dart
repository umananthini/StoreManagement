
class RequestApprovalModel {
    String? cardCode;
    String? creditVal;
    String? deviceCode;
    String? imei;
    String? isApproval;
    dynamic reqMsg;
    dynamic reqTypeCode;
    String? requestId;
    String? resCode;
    String? response;
    String? spName;
    int? stcode;

    RequestApprovalModel({
          this.cardCode,
            this.creditVal,
          this.deviceCode,
          this.imei,
          this.isApproval,
          this.reqMsg,
          this.reqTypeCode,
          this.requestId,
          this.resCode,
          this.response,
          this.spName,
          this.stcode
    });

    factory RequestApprovalModel.fromJson(Map<String, dynamic> json,int code) => RequestApprovalModel(
        cardCode: json["CardCode"],
        creditVal: json["CreditVal"],
        deviceCode: json["DeviceCode"],
        imei: json["IMEI"],
        isApproval: json["IsApproval"],
        reqMsg: json["ReqMsg"],
        reqTypeCode: json["ReqTypeCode"],
        requestId: json["RequestID"],
        resCode: json["ResCode"],
        response: json["Response"],
        spName: json["SP_Name"],
        stcode: code
    );

    Map<String, dynamic> toJson() => {
        "CardCode": cardCode,
        "CreditVal": creditVal,
        "DeviceCode": deviceCode,
        "IMEI": imei,
        "IsApproval": isApproval,
        "ReqMsg": reqMsg,
        "ReqTypeCode": reqTypeCode,
        "RequestID": requestId,
        "ResCode": resCode,
        "Response": response,
        "SP_Name": spName,
    };
}
