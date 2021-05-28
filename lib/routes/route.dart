import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/login/login_register_binding.dart';
import 'package:wan_android_flutter/pages/login/login_register_page.dart';
import 'package:wan_android_flutter/pages/main/main_binding.dart';
import 'package:wan_android_flutter/pages/search/search_binding.dart';
import 'package:wan_android_flutter/pages/search/search_page.dart';
import 'package:wan_android_flutter/pages/search/search_result_page.dart';
import 'package:wan_android_flutter/pages/web/web_binding.dart';
import 'package:wan_android_flutter/pages/web/web_page.dart';
import '../pages/main/main_page.dart';

class RouteConfig {
  ///主页面
  static final String main = "/";

  ///网页
  static final String web = "/web";

  ///搜索
  static final String search = "/search";
  static final String searchResult = "/result";

  ///登录
  static final String login = "/login";

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
    ),
    GetPage(
        name: search,
        page: () => SearchPage(),
        binding: SearchBinding(),
        children: [
          GetPage(
            name: searchResult,
            page: () => SearchResultPage(),
          )
        ]),
    GetPage(
      name: login,
      page: () => LoginRegisterPage(),
      binding: LoginRegisterBinding(),
    )
  ];
}
