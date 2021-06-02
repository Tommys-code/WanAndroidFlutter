import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/pages/main/state/home_state.dart';
import 'package:wan_android_flutter/pages/main/state/main_state.dart';
import 'package:wan_android_flutter/pages/main/state/mine_state.dart';
import 'package:wan_android_flutter/pages/main/state/project_state.dart';
import 'package:wan_android_flutter/pages/main/state/public_state.dart';

class MainLogic extends GetxController {
  final Repository _repository = Get.find();

  final mainState = MainState();

  //HomePage状态
  final homeState = HomeState();
  final projectState = ProjectState();
  final publicState = PublicState();
  final mineState = MineState();

  final userName = ''.obs;
  final isLogin = false.obs;

  MainLogic() {
    getUserInfo();
  }

  getUserInfo() async {
    String? value = await _repository.getUserName();
    userName.value = value ?? 'not_login'.tr;
    userName.refresh();

    if (value != null && value.isNotEmpty) {
      isLogin.value = true;
      mineState.getCoinData();
    } else {
      isLogin.value = false;
      mineState.clearCoinData();
    }
  }

  logout() async {
    bool success = await _repository.logout() ?? false;
    if (success) getUserInfo();
  }
}
