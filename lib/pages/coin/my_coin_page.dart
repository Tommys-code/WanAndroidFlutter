import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/coin_list_data.dart';
import 'package:wan_android_flutter/pages/coin/my_coin_logic.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';

class MyCoinPage extends GetView<MyCoinLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildAppBar(Text('my_score'.tr)),
      body: EasyRefresh.custom(
        controller: controller.refreshController,
        slivers: [
          _buildHead().sliverBox,
          Obx(() => _buildListView().buildSliverListStateWidget(value: controller.coinList.value)),
        ],
        onLoad: () => controller.loadMore(),
      ).paddingSymmetric(horizontal: 10),
    );
  }

  Widget _buildHead() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => Text(
              "${controller.coin.value?.coinCount ?? 0}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            )).marginOnly(top: 30),
        Text(
          'my_score'.tr,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'my_score_history'.tr,
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          )
              .drawableHorizontal(
                  left: Image.asset(
                'assets/images/ic_score.png',
                width: 24,
                height: 24,
              ).marginOnly(right: 8))
              .marginOnly(top: 30),
        )
      ],
    );
  }

  Widget _buildListView() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      _buildItem,
      childCount: controller.coinList.value?.length ?? 0,
    ));
  }

  Widget _buildItem(BuildContext context, int index) {
    CoinListData data = controller.coinList.value![index];
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.reason,
                  style: TextStyle(fontSize: 16),
                ).marginOnly(top: 10, bottom: 4),
                Text(
                  data.getDate(),
                  style: TextStyle(fontSize: 14),
                ),
                Divider(
                  color: Colors.grey[400],
                  height: 2,
                ).marginOnly(top: 10),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  "${data.coinCount}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
