import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';

class MineTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.settings),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildHead(context),
          _buildCoinList(),
          Divider(
            color: Colors.grey[400],
            height: 2,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Expanded(
                child: Text(
              'my_collect'.tr,
              style: TextStyle(fontSize: 16, color: Colors.grey[850]),
            )).drawableHorizontal(
              left: Icon(
                Icons.star_border,
                color: Colors.blue[700],
                size: 24,
              ).marginOnly(right: 10),
              right: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey[600],
              ),
            ),
          ).onTab(() => _onTab(() => Get.toNamed(RouteConfig.myCollect))),
          Divider(
            color: Colors.grey[400],
            height: 2,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }

  //Image.asset('assets/images/icon_user_head_default.png',width: 50,height: 50,)
  Widget _buildHead(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Image.asset(
                'assets/images/icon_user_head_default.png',
                width: 60,
                height: 60,
              ),
              SizedBox(width: 9),
              Obx(() => Text(
                    controller.userName.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ],
          ).marginOnly(left: 25, bottom: 25).onTab(() =>
              {if (!controller.isLogin.value) Get.toNamed(RouteConfig.login)}),
        ),
      ),
    );
  }

  Widget _buildCoinList() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Stack(
        children: [
          Text(
            'my_score'.tr,
            style: TextStyle(fontSize: 16, color: Colors.grey[850]),
          ).drawableHorizontal(
            left: Image.asset(
              'assets/images/ic_score.png',
              width: 24,
              height: 24,
            ).marginOnly(right: 10),
          ),
          Positioned(
            right: 0,
            child: Obx(
              () => Text(
                controller.mineState.coin.value?.getMyCoinCount() ?? '',
              ).drawableHorizontal(
                right: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey[600],
                ).marginOnly(left: 10),
              ),
            ),
          ),
        ],
      ),
    ).onTab(() {
      printInfo(info: 'onTap');
      _onTab(() => Get.toNamed(RouteConfig.myCoin));
    });
  }

  _onTab(Function function) {
    if (!controller.isLogin.value) {
      Get.toNamed(RouteConfig.login);
    } else {
      function();
    }
  }
}
