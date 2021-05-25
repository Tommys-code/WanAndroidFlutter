import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/state/home_state.dart';
import 'package:wan_android_flutter/pages/main/state/main_state.dart';

class MainLogic extends GetxController {

  final mainState = MainState();
  //HomePage状态
  final homeState = HomeState();

  @override
  void onInit() {
    super.onInit();
  }
}
