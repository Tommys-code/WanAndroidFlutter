import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/hot_key.dart';
import 'package:wan_android_flutter/pages/search/search_logic.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

class SearchPage extends GetView<SearchLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
      ),
      body: SingleChildScrollView(
        child: _buildContent(),
      ),
    );
  }

  //搜索栏
  Widget _buildSearchBar() {
    return Row(
      children: [
        GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Get.back(),
        ),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.only(left: 10),
            child: TextField(
              autofocus: true,
              controller: controller.editController,
              focusNode: controller.editFocus,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'search_hint'.tr,
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Obx(
                  () => Offstage(
                    offstage: !controller.isShowClear.value,
                    child: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controller.editController.clear();
                      },
                    ),
                  ),
                ),
              ),
              onSubmitted: _search,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'search_hot'.tr,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ).paddingAll(13),
        Obx(() => Wrap(
              spacing: 9,
              children: _buildHotKeys(),
            )).paddingSymmetric(horizontal: 13),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: double.infinity),
          child: Stack(
            children: [
              Text(
                'search_history'.tr,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ).paddingAll(13),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      'clear'.tr,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ).paddingAll(9).marginOnly(right: 4),
                    onTap: () => controller.clearHistoryKey(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() => Wrap(
              spacing: 9,
              children: _buildHistoryKeys(),
            )).paddingSymmetric(horizontal: 13),
      ],
    );
  }

  List<Widget> _buildHotKeys() {
    List<HotKey> list = controller.hotKeys.value ?? [];
    return list.map((e) => _buildItem(e.name)).toList();
  }

  List<Widget> _buildHistoryKeys() {
    List<String> list = controller.historyKeys.value ?? [];
    return list.map((e) => _buildItem(e)).toList();
  }

  Widget _buildItem(String key) {
    return ActionChip(
      label: Text(key),
      pressElevation: 0,
      labelStyle: TextStyle(fontSize: 12, color: Colors.grey[700]),
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: () => _search(key),
    );
  }

  _search(String key) {
    if (key.isEmpty) {
      CommonWidget.showToast('search_hint'.tr);
      return;
    }
    controller.saveKey(key);
    Get.toNamed(RouteConfig.search + RouteConfig.searchResult, arguments: key);
  }
}
