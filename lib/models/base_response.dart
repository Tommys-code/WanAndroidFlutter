class BaseResponse {
  late dynamic data;
  late int errorCode;
  late String errorMsg;

  bool isSuccess() {
    return errorCode == 0;
  }

  BaseResponse({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    data['data'] = this.data;
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
