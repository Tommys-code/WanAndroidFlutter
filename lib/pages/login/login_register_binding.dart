import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/login/login_register_logic.dart';

class LoginRegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginRegisterLogic>(() => LoginRegisterLogic());
  }
}