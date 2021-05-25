import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/home_banner.dart';

class HomeState {
  late final Repository repository;
  var bannerData = Rxn<List<HomeBanner>>();
  var articles = Rxn<List<ArticleData>>();

  var _currentPage = 0;

  HomeState() {
    repository = Get.find();

    loadData();
  }

  getBanner() async {
    bannerData.value = await repository.getHomeBanner();
    bannerData.refresh();
  }

  loadData() async {
    getBanner();
    _currentPage = 0;
    ArticleList? data = await repository.getHomeArticles(_currentPage);
    articles.value?.clear();
    articles.value = data?.datas;
    articles.refresh();
  }

  loadMore() async {
    _currentPage++;
    ArticleList? data = await repository.getHomeArticles(_currentPage);
    articles.value?.addAll(data?.datas ?? RxList.empty());
    articles.refresh();
  }
}
