import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/collect_list.dart';
import 'package:wan_android_flutter/pages/collect/my_collect_logic.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';
import 'package:wan_android_flutter/widgets/animation_list_item.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';

class MyCollectPage extends GetView<MyCollectLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.buildAppBar(Text('my_collect'.tr)),
        body: Obx(
          () => EasyRefresh(
            child: _buildListView(),
            controller: controller.refreshController,
            onLoad: () => controller.loadMore(),
          ).buildListStateWidget(value: controller.articleList.value),
        ));
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: controller.articleList.value?.length ?? 0,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    CollectArticleData data = controller.articleList.value![index];
    GlobalKey<AnimationListItemState> key = GlobalKey();
    return AnimationListItem(
      key: key,
      child: ArticleItemWidget(
        item: ArticleData(
          id: data.originId,
          author: data.author,
          title: data.title,
          publishTime: 0,
          superChapterName: '',
          shareUser: '',
          desc: '',
          envelopePic: '',
          collect: true,
          chapterName: data.chapterName,
          link: data.link,
          niceDate: data.niceDate,
        ),
        callBack: (success) => {
          if (success)
            {
              key.currentState?.removeItem((finish) {
                controller.removeItem(index);
              })
            },
        },
      ),
    );
  }
}
