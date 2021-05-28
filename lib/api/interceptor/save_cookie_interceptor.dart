import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../api.dart';
import '../base_provider.dart';

FutureOr<dynamic> saveCookieInterceptor(
    Request request, Response response) async {
  if ((request.url.toString().contains(Api.LOGIN) ||
          request.url.toString().contains(Api.REGISTER)) &&
      response.headers?[BaseProvider.SET_COOKIE_KEY] != null) {
    var cookies = response.headers![BaseProvider.SET_COOKIE_KEY];
  }
  return response;
}


