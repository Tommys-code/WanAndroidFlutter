import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';

class ProjectListLogic extends GetxController{
  late final Repository _repository;
  final int id;

  var articles = Rxn<List<ArticleData>>();
  var _currentPage = 0;

  ProjectListLogic({required this.id}) {
    _repository = Get.find();
    loadData();
  }

  loadData() async {
    _currentPage = 0;
    ArticleList? data = await _repository.getProjectArticles(_currentPage, id);

    articles.value?.clear();
    articles.value = data?.datas;
    articles.refresh();
  }

  loadMore() async {
    _currentPage++;
    ArticleList? data = await _repository.getProjectArticles(_currentPage, id);
    articles.value?.addAll(data?.datas ?? RxList.empty());
    articles.refresh();
  }
}
