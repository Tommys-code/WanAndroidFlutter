import 'package:wan_android_flutter/api/api_provider.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/base_response.dart';
import 'package:wan_android_flutter/models/home_banner.dart';

class Repository {
  Repository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<HomeBanner>?> getHomeBanner() async {
    BaseResponse res = await apiProvider.getHomeBanner();
    if (res.isSuccess()) {
      var listDynamic = res.data;
      List<HomeBanner> data = (listDynamic as List<dynamic>)
          .map((e) => HomeBanner.fromJson((e as Map<String, dynamic>)))
          .toList();
      return data;
    }
  }

  Future<ArticleList?> getHomeArticles(int page) async {
    BaseResponse res = await apiProvider.getHomeArticles(page);
    if (res.isSuccess()) {
      return ArticleList.fromJson(res.data);
    }
  }
}
