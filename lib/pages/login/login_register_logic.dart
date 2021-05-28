import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';

class LoginRegisterLogic extends GetxController{

  late final  Repository _repository = Get.find();

  final isRegister = false.obs;

  changeLoginOrRegister(){
    isRegister.value = !isRegister.value;
    printInfo(info: '${isRegister.value}');
    isRegister.refresh();
  }

}