import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_android_flutter/api/api_provider.dart';
import 'package:wan_android_flutter/api/constants.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/base_response.dart';
import 'package:wan_android_flutter/models/home_banner.dart';
import 'package:wan_android_flutter/models/hot_key.dart';
import 'package:wan_android_flutter/models/wx_chapter.dart';

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

  Future<List<HotKey>?> getHotKey() async {
    BaseResponse res = await apiProvider.getSearchHotKey();
    if (res.isSuccess()) {
      var listDynamic = res.data;
      List<HotKey> data = (listDynamic as List<dynamic>)
          .map((e) => HotKey.fromJson((e as Map<String, dynamic>)))
          .toList();
      return data;
    }
  }

  Future<List<String>> getHistoryKey() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(Constants.HISTORY_KEY) ?? [];
  }

  void saveHistoryKey(List<String> keys) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList(Constants.HISTORY_KEY, keys);
  }

  Future<ArticleList?> queryArticles(int page, String key) async {
    BaseResponse res = await apiProvider.queryArticles(page, key);
    if (res.isSuccess()) {
      return ArticleList.fromJson(res.data);
    }
  }

  Future<List<WxChapter>?> getPublicChapters() async {
    BaseResponse res = await apiProvider.getPublicChapters();
    if (res.isSuccess()) {
      List<WxChapter> data = (res.data as List<dynamic>)
          .map((e) => WxChapter.fromJson((e as Map<String, dynamic>)))
          .toList();
      return data;
    }
  }

  Future<ArticleList?> getPublicArticles(int page, int id) async {
    BaseResponse res = await apiProvider.getPublicArticles(page, id);
    if (res.isSuccess()) {
      return ArticleList.fromJson(res.data);
    }
  }
}
