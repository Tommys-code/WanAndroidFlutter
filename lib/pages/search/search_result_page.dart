import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/pages/search/search_result_logic.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';

class SearchResultPage extends StatelessWidget {
  final SearchResultLogic _control = Get.put(SearchResultLogic(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
      ),
      body: _buildRefresh(),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(children: [
              Icon(Icons.search, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                Get.arguments,
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
              )
            ]),
          ).marginOnly(left: 14),
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'cancel'.tr,
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  Widget _buildRefresh() {
    return Obx(
      () => EasyRefresh(
              controller: _control.refreshController,
              child: _buildListView(),
              onLoad: () => _control.loadMore(),
            ).buildListStateWidget(value: _control.articles.value),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        ArticleData data = _control.articles.value![index];
        return ArticleItemWidget(item: data);
      },
      itemCount: _control.articles.value?.length ?? 0,
    );
  }
}
