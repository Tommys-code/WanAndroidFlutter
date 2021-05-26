import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/search/search_logic.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchLogic>(() => SearchLogic());
  }
}
