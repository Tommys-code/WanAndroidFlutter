import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/pages/web/web_logic.dart';

class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebLogic>(() => WebLogic());
  }
}
