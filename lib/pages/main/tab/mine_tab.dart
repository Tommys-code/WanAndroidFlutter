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
}
