import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../repository.dart';

FutureOr<Request> authInterceptor(Request request) async {
  String? cookie = await Get.find<Repository>().getCookie(request.url.host);
  if (cookie?.isNotEmpty ?? false) {
    request.headers['Cookie'] = cookie!;
  }
  return request;
}

