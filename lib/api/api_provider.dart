import 'package:wan_android_flutter/api/base_provider.dart';
import 'package:wan_android_flutter/models/base_response.dart';

import 'api.dart';

class ApiProvider extends BaseProvider {
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
