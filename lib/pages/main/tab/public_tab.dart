import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/models/wx_chapter.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';
import 'package:wan_android_flutter/widgets/public_chapters_sheet.dart';

class PublicTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('square'.tr),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(),
        child: Obx(
          () => Text(controller.publicState.chooseChapter.value?.name
                  .substring(0, 2) ??
              ''),
        ),
      ),
      body: Obx(() => _buildContent()),
    );
  }

  Widget _buildContent() {
    return EasyRefresh(
      child: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: controller.publicState.articles.value?.length ?? 0,
      ),
      onRefresh: () => controller.publicState.loadData(),
      onLoad: () => controller.publicState.loadMore(),
    ).buildListStateWidget(value: controller.publicState.articles.value);
  }

  Widget _buildItem(BuildContext context, int index) {
    ArticleData data = controller.publicState.articles.value![index];
    return ArticleItemWidget(item: data);
  }

  _showBottomSheet() async {
    if (controller.publicState.wxChapters.value == null) return;
    WxChapter chapter = await Get.bottomSheet(
      PublicChapterSheet(
        chapters: controller.publicState.wxChapters.value!,
        checkId: controller.publicState.chooseChapter.value?.id,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      backgroundColor: Colors.white,
    );
    controller.publicState.changeChapter(chapter);
  }
}
