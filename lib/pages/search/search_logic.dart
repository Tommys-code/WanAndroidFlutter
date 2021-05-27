import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/hot_key.dart';

class SearchLogic extends GetxController {
  late final Repository _repository;

  TextEditingController editController = TextEditingController();
  FocusNode editFocus = FocusNode();
  late RxBool isShowClear;

  //热门搜索
  Rxn hotKeys = Rxn<List<HotKey>>();
  Rxn historyKeys = Rxn<List<String>>();

  SearchLogic() {
    isShowClear = false.obs;
    _repository = Get.find();

    _getHotKey();
    _getHistoryKeys();
  }

  _getHotKey() async {
    hotKeys.value = await _repository.getHotKey();
  }

  _getHistoryKeys() async {
    historyKeys.value = await _repository.getHistoryKey();
  }

  saveKey(String key) async {
    List<String> list = historyKeys.value ?? [];
    if (list.contains(key)) {
      list.remove(key);
    }
    if (list.length == 10) {
      list.removeLast();
    }
    list.insert(0, key);
    historyKeys.value = list;
    historyKeys.refresh();
    _repository.saveHistoryKey(list);
    editController.text = key;
  }

  clearHistoryKey() async {
    historyKeys.value = null;
    historyKeys.refresh();
    _repository.saveHistoryKey([]);
  }

  @override
  void onInit() {
    super.onInit();
    editController.addListener(() {
      isShowClear.value = editController.text.isNotEmpty && editFocus.hasFocus;
    });
    editFocus.addListener(() {
      isShowClear.value = editController.text.isNotEmpty && editFocus.hasFocus;
    });
  }

  @override
  void onClose() {
    super.onClose();
    editController.dispose();
    editFocus.dispose();
  }
}
