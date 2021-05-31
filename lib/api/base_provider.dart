import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/api/constants.dart';
import 'package:wan_android_flutter/models/base_response.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

import 'interceptor/auth_interceptor.dart';
import 'interceptor/save_cookie_interceptor.dart';

class BaseProvider extends GetConnect {
  static const String SET_COOKIE_KEY = "set-cookie";

  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.addRequestModifier(authInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.addResponseModifier(cookieInterceptor);
  }

  Future<BaseResponse> mGet(String url,
      {Map<String, dynamic>? query, bool showError = true}) async {
    BaseResponse response =
        BaseResponse.fromJson((await get(url, query: query)).body);
    if (!response.isSuccess() && showError) {
      CommonWidget.showToast(response.errorMsg);
    }
    return response;
  }

  Future<BaseResponse> mPost(String url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? query,
      bool showError = true}) async {
    BaseResponse response =
        BaseResponse.fromJson((await post(url, body, query: query)).body);
    if (!response.isSuccess() && showError) {
      CommonWidget.showToast(response.errorMsg);
    }
    return response;
  }
}

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  print(response.statusCode);
  if (response.statusCode != 200) {
    CommonWidget.showToast(
        'net_error'.trArgs([response.statusCode.toString()]));
    return;
  }
  return response;
}
