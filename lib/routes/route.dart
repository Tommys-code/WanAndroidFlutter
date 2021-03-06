import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/coin/my_coin_binding.dart';
import 'package:wan_android_flutter/pages/coin/my_coin_page.dart';
import 'package:wan_android_flutter/pages/collect/my_collect_binding.dart';
import 'package:wan_android_flutter/pages/collect/my_collect_page.dart';
import 'package:wan_android_flutter/pages/login/login_register_binding.dart';
import 'package:wan_android_flutter/pages/login/login_register_page.dart';
import 'package:wan_android_flutter/pages/main/main_binding.dart';
import 'package:wan_android_flutter/pages/main/setting_page.dart';
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

  ///积分
  static final String myCoin = "/my/coin";
  static final String myCollect = "/my/collect";
  static final String mySetting = "/my/setting";

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
    ),
    GetPage(
      name: myCoin,
      page: () => MyCoinPage(),
      binding: MyCoinBinding(),
    ),
    GetPage(
      name: myCollect,
      page: () => MyCollectPage(),
      binding: MyCollectBinding(),
    ),
    GetPage(
      name: mySetting,
      page: () => SettingPage(),
    ),
  ];
}
