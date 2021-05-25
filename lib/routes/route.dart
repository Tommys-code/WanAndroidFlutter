import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_binding.dart';
import 'package:wan_android_flutter/pages/web/web_binding.dart';
import 'package:wan_android_flutter/pages/web/web_page.dart';
import '../pages/main/main_page.dart';

class RouteConfig {
  ///主页面
  static final String main = "/";

  static final String web = "/web";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(
      name: main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: web,
      page: () => WebPage(),
      binding: WebBinding(),
    )
  ];
}
