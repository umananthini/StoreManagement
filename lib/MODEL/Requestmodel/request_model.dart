class RequestModel {
  dynamic deviceCode;
  dynamic imeiNum;
  List<RequestList> requests;
  String resCode;
  int? stCode;
  String? exception;
  String response;

  RequestModel({
    required this.deviceCode,
    required this.imeiNum,
    required this.requests,
    required this.resCode,
    required this.exception,
    required this.stCode,
    required this.response,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json, int code) =>
      RequestModel(
        deviceCode: json["DeviceCode"],
        imeiNum: json["IMEINum"],
        requests: List<RequestList>.from(
            json["Requests"].map((x) => RequestList.fromJson(x))),
        resCode: json["ResCode"],
        exception: null,
        stCode: code,
        response: json["Response"],
      );

  factory RequestModel.issues(String json, int code) => RequestModel(
        deviceCode: null,
        imeiNum: null,
        requests: [],
        resCode: "",
        exception: json,
        stCode: code,
        response: '',
      );

  Map<String, dynamic> toJson() => {
        "DeviceCode": deviceCode,
        "IMEINum": imeiNum,
        "Requests": List<dynamic>.from(requests.map((x) => x.toJson())),
        "ResCode": resCode,
        "Response": response,
      };
}

class RequestList {
  String approvalSpName;
  String cDeviceCode;
  String companyName;
  String creditVal;
  String custCode;
  String dateTimeOfRequest;
  String deviceCode;
  String imeiNumber;
  String reqTypeCode;
  String requestMessage;
  String requestStatus;
  String requestCode;
  String requestName;
  String rejectSpName;

  RequestList({
    required this.approvalSpName,
    required this.cDeviceCode,
    required this.companyName,
    required this.creditVal,
    required this.custCode,
    required this.dateTimeOfRequest,
    required this.deviceCode,
    required this.imeiNumber,
    required this.reqTypeCode,
    required this.requestMessage,
    required this.requestStatus,
    required this.requestCode,
    required this.requestName,
    required this.rejectSpName,
  });

  factory RequestList.fromJson(Map<String, dynamic> json) => RequestList(
        approvalSpName: json["ApprovalSPName"],
        cDeviceCode: json["CDeviceCode"],
        companyName: json["Company_Name"],
        creditVal: json["CreditVal"],
        custCode: json["CustCode"],
        dateTimeOfRequest: json["DateTimeOfRequest"],
        deviceCode: json["DeviceCode"],
        imeiNumber: json["IMEI_Number"],
        reqTypeCode: json["ReqTypeCode"],
        requestMessage: json["RequestMessage"],
        requestStatus: json["RequestStatus"],
        requestCode: json["Request_Code"],
        requestName: json["Request_Name"],
        rejectSpName: json["_RejectSPName"],
      );

  Map<String, dynamic> toJson() => {
        "ApprovalSPName": approvalSpName,
        "CDeviceCode": cDeviceCode,
        "Company_Name": companyName,
        "CreditVal": creditVal,
        "CustCode": custCode,
        "DateTimeOfRequest": dateTimeOfRequest,
        "DeviceCode": deviceCode,
        "IMEI_Number": imeiNumber,
        "ReqTypeCode": reqTypeCode,
        "RequestMessage": requestMessage,
        "RequestStatus": requestStatus,
        "Request_Code": requestCode,
        "Request_Name": requestName,
        "_RejectSPName": rejectSpName,
      };
}
