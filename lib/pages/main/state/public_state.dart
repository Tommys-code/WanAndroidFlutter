import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';

class PublicState{
  late final Repository repository;

  PublicState() {
    repository = Get.find();
  }


}