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
}
