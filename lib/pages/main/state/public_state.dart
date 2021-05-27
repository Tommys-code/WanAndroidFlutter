import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/wx_chapter.dart';

class PublicState {
  late final Repository _repository;

  var _currentPage = 1;

  var wxChapters = Rxn<List<WxChapter>>();
  var chooseChapter = Rxn<WxChapter>();
  var articles = Rxn<List<ArticleData>>();

  PublicState() {
    _repository = Get.find();

    loadData();
  }

  loadData() async {
    wxChapters.value = await _repository.getPublicChapters();
    wxChapters.refresh();
    chooseChapter.value = wxChapters.value?.first;
    chooseChapter.refresh();
    loadList();
  }

  loadList() async {
    if (chooseChapter.value == null) return;
    _currentPage = 0;
    ArticleList? data = await _repository.getPublicArticles(
        _currentPage, chooseChapter.value!.id);

    articles.value?.clear();
    articles.value = data?.datas;
    articles.refresh();
  }

  loadMore() async {
    _currentPage++;
    ArticleList? data = await _repository.getPublicArticles(
        _currentPage, chooseChapter.value!.id);
    articles.value?.addAll(data?.datas ?? RxList.empty());
    articles.refresh();
  }

  changeChapter(WxChapter chapter){
    chooseChapter.value = chapter;
    chooseChapter.refresh();
    articles.value = null;
    articles.refresh();
    loadList();
  }
}
