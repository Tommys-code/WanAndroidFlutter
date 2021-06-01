import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/collect_list.dart';

class MyCollectLogic extends GetxController {
  late final Repository _repository = Get.find();
  late EasyRefreshController refreshController;

  var articleList = Rxn<List<CollectArticleData>>();
  int _currentPage = 0;
  int _totalCount = 1;

  MyCollectLogic() {
    refreshController = EasyRefreshController();
    loadList();
  }

  loadList() async {
    _currentPage = 0;
    CollectList? data = await _repository.getCollectList(_currentPage);
    _totalCount = data?.pageCount ?? 1;
    articleList.value = data?.datas;
    articleList.refresh();
  }

  loadMore() async {
    if (noMoreData()) return;
    _currentPage++;
    CollectList? data = await _repository.getCollectList(_currentPage);
    articleList.value?.addAll(data?.datas ?? RxList.empty());
    articleList.refresh();
  }

  bool noMoreData() {
    if (_currentPage == _totalCount - 1) {
      refreshController.finishLoad(noMore: true);
      return true;
    }
    return false;
  }
}
