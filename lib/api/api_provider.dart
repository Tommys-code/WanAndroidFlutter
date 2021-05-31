import 'package:wan_android_flutter/api/base_provider.dart';
import 'package:wan_android_flutter/models/base_response.dart';

import 'api.dart';

class ApiProvider extends BaseProvider {
  Future<BaseResponse> login(String username, String password) {
    return mPost(Api.LOGIN,
        query: {"username": username, "password": password});
  }

  Future<BaseResponse> register(
      String username, String password, String repassword) {
    return mPost(Api.REGISTER, query: {
      "username": username,
      "password": password,
      "repassword": repassword
    });
  }

  Future<BaseResponse> getCoin() {
    return mGet(Api.MY_COIN);
  }

  Future<BaseResponse> getCoinList(int page) {
    return mGet(Api.MY_COIN_LIST.replaceFirst('{pageNum}', '$page'));
  }

  Future<BaseResponse> getHomeBanner() {
    return mGet(Api.HOME_BANNER);
  }

  Future<BaseResponse> getHomeArticles(int num) {
    return mGet(Api.HOME_ARTICLE_LIST.replaceFirst('{pageNum}', '$num'));
  }

  Future<BaseResponse> getSearchHotKey() {
    return mGet(Api.HOME_HOT_KEY);
  }

  Future<BaseResponse> queryArticles(int num, String key) {
    return mPost(
      Api.QUERY_ARTICLES.replaceFirst('{pageNum}', '$num'),
      query: {"k": key},
    );
  }

  Future<BaseResponse> getPublicChapters() {
    return mGet(Api.PUBLIC_CHAPTER);
  }

  Future<BaseResponse> getPublicArticles(int num, int id) {
    return mGet(Api.PUBLIC_CHAPTER_ARTICLES
        .replaceFirst('{id}', '$id')
        .replaceFirst('{pageNum}', '$num'));
  }

  Future<BaseResponse> getProjectTree() {
    return mGet(Api.PROJECT_TREE);
  }

  Future<BaseResponse> getProjectList(int num, int id) {
    return mGet(
      Api.PROJECT_LIST.replaceFirst('{pageNum}', '$num'),
      query: {"cid": "$id"},
    );
  }
}
