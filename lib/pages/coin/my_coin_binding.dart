import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/coin/my_coin_logic.dart';

class MyCoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCoinLogic());
  }
}
