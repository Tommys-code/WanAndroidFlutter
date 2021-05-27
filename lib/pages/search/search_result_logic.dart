import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';

class SearchResultLogic extends GetxController {
  late final Repository _repository;
  late final String key;
  late final EasyRefreshController refreshController;

  var articles = Rxn<List<ArticleData>>();
  var _currentPage = 0;
  int _totalPage = 0;

  SearchResultLogic(String _key) {
    key = _key;
    refreshController = EasyRefreshController();
    _repository = Get.find();
    loadData();
  }

  @override
  void onInit() {
    super.onInit();
  }

  loadData() async {
    _currentPage = 0;
    ArticleList? data = await _repository.queryArticles(_currentPage, key);
    _totalPage = data?.pageCount ?? 0;

    articles.value?.clear();
    articles.value = data?.datas;
    articles.refresh();
  }

  loadMore() async {
    if (_currentPage == _totalPage) {
      refreshController.finishLoad(noMore: true);
      return;
    }
    _currentPage++;
    printInfo(info: "$_currentPage");
    ArticleList? data = await _repository.queryArticles(_currentPage, key);
    articles.value?.addAll(data?.datas ?? RxList.empty());
    articles.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
