import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';
import '../base_provider.dart';

FutureOr<dynamic> cookieInterceptor(Request request, Response response) async {
  if ((request.url.toString().contains(Api.LOGIN) ||
          request.url.toString().contains(Api.REGISTER)) &&
      response.headers?[BaseProvider.SET_COOKIE_KEY] != null) {
    String? cookies = response.headers![BaseProvider.SET_COOKIE_KEY];
    if (cookies?.isNotEmpty ?? false) {
      saveCookie(request.url.host, cookies!);
    }
  }
  return response;
}

saveCookie(String domain, String cookie) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.setString(domain, cookie);
}
