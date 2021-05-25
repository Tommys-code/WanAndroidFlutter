import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());
  }
}
