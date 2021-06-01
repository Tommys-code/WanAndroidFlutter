import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/collect/my_collect_logic.dart';

class MyCollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCollectLogic());
  }
}
