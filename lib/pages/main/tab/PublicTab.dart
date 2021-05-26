import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';

class PublicTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('square'.tr),
        centerTitle: true,
      ),
      // body: _buildContent(),
    );
  }

  // Widget _buildContent() {
  //   return EasyRefresh(
  //     child: ListView.builder(itemBuilder: _buildItem),
  //     onRefresh: () => controller.publicState.loadData(),
  //     onLoad: () => controller.publicState.loadMore(),
  //   );
  // }

  // Widget _buildItem(BuildContext context, int index) {
  //   ArticleData data = controller.publicState.articles.value![index];
  //   return ArticleItemWidget(item: data);
  // }
}
