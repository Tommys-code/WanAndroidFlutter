import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/user.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';

class LoginRegisterLogic extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final Repository _repository = Get.find();

  MainLogic _mainLogic = Get.find();

  final isRegister = false.obs;

  changeLoginOrRegister() {
    isRegister.value = !isRegister.value;
    isRegister.refresh();
  }

  String name = '';
  String pwd = '';
  String rePwd = '';

  loginOrRegister() async {
    printInfo(info: "${formKey.currentState!.validate()}");
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      User? mUser;
      if (isRegister.value) {
        mUser = await _repository.register(name, pwd, rePwd);
      } else {
        mUser = await _repository.login(name, pwd);
      }
      if (mUser != null) {
        Get.back();
        await _repository.saveUserName(mUser.nickname);
        _mainLogic.getUserInfo();
      }
    }
  }
}
