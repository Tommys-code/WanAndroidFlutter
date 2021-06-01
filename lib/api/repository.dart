import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_android_flutter/api/api_provider.dart';
import 'package:wan_android_flutter/api/constants.dart';
import 'package:wan_android_flutter/db/my_dao.dart';
import 'package:wan_android_flutter/db/my_db.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/base_response.dart';
import 'package:wan_android_flutter/models/coin.dart';
import 'package:wan_android_flutter/models/coin_list_data.dart';
import 'package:wan_android_flutter/models/collect_list.dart';
import 'package:wan_android_flutter/models/home_banner.dart';
import 'package:wan_android_flutter/models/hot_key.dart';
import 'package:wan_android_flutter/models/project_tree.dart';
import 'package:wan_android_flutter/models/user.dart';
import 'package:wan_android_flutter/models/wx_chapter.dart';

class Repository {
  final ApiProvider apiProvider;
  late final MyDao dao = Get.find<MyDb>().myDao;

  final Map<String, String> cookies = {};

  Repository({required this.apiProvider});

  Future<String?> getCookie(String domain) async {
    if (cookies[domain] != null) return cookies[domain];
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(domain) != null)
      cookies[domain] = pref.getString(domain)!;
    return cookies[domain];
  }

  Future<String?> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.USER_NAME);
  }

  saveUserName(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Constants.USER_NAME, name);
  }

  ///登录注册
  Future<User?> login(String name, String pwd) async {
    BaseResponse res = await apiProvider.login(name, pwd);
    if (res.isSuccess()) {
      return User.fromJson(res.data);
    }
  }

  Future<User?> register(String name, String pwd, String rePwd) async {
    BaseResponse res = await apiProvider.register(name, pwd, rePwd);
    if (res.isSuccess()) {
      return User.fromJson(res.data);
    }
  }

  ///首页
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

  ///搜索
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

  ///公众号
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

  ///项目
  Future<List<ProjectTree>?> getProjectTree() async {
    BaseResponse res = await apiProvider.getProjectTree();
    if (res.isSuccess()) {
      List<ProjectTree> data = (res.data as List<dynamic>)
          .map((e) => ProjectTree.fromJson((e as Map<String, dynamic>)))
          .toList();
      return data;
    }
  }

  Future<ArticleList?> getProjectArticles(int page, int id) async {
    BaseResponse res = await apiProvider.getProjectList(page, id);
    if (res.isSuccess()) {
      return ArticleList.fromJson(res.data);
    }
  }

  ///获取积分
  Stream<Coin?> getCoins() async* {
    String? data = (await dao.getDataByKey(Constants.COIN_DATA))?.data;
    if (data != null) {
      yield Coin.fromJson(json.decode(data));
    }
    BaseResponse res = await apiProvider.getCoin();
    if (res.isSuccess()) {
      dao.save(Constants.COIN_DATA, json.encode(res.data));
      yield Coin.fromJson(res.data);
    }
  }

  Future<CoinList?> getCoinList(int page) async {
    BaseResponse res = await apiProvider.getCoinList(page);
    if (res.isSuccess()) {
      return CoinList.fromJson(res.data);
    }
  }

  Future<CollectList?> getCollectList(int page) async {
    BaseResponse res = await apiProvider.getCollectList(page);
    if (res.isSuccess()) {
      return CollectList.fromJson(res.data);
    }
  }

  Future<bool> collect(int id, bool isCollect) async {
    BaseResponse res = await apiProvider.collect(id, isCollect);
    if (res.isSuccess()) {
      return true;
    }
    return false;
  }
}
