import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:wan_android_flutter/api/constants.dart';
import 'package:wan_android_flutter/models/base_response.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    // httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
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

FutureOr<Request> authInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';
  return request;
}

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';
  return request;
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
