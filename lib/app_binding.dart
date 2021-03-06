import 'package:get/get.dart';
import 'package:wan_android_flutter/db/my_db.dart';

import 'api/api_provider.dart';
import 'api/repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(Repository(apiProvider: Get.find()), permanent: true);
    Get.put<MyDb>(Get.find());
  }
}
