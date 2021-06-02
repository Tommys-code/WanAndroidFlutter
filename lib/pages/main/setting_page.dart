import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';

class SettingPage extends StatelessWidget {
  final MainLogic logic = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildAppBar(Text('setting'.tr)),
      body: Container(
        color: Color(0xfff4f4f4),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child: Align(
                child: Image.asset(
                  'assets/images/ic_setting_logo.png',
                  scale: 1.5,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'app_name'.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ).center(),
            ),
            Divider(height: 1),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              height: 50,
              child: TextButton(
                child: Expanded(
                    child: Text(
                  'about_us'.tr,
                  style: TextStyle(fontSize: 16),
                )).drawableHorizontal(
                  right: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey[600],
                  ),
                ),
                onPressed: () => Get.toNamed(RouteConfig.web,
                    arguments:
                        'https://github.com/Tommys-code/WanAndroidFlutter'),
              ),
            ),
            Container(
              color: Colors.white,
              height: 60,
              child: TextButton(
                onPressed: () => _loginOrLogout(context),
                child: Text(
                  logic.isLogin.value ? 'logout'.tr : 'login'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _loginOrLogout(BuildContext context) {
    if (logic.isLogin.value) {
      _showLogoutDialog(context);
    } else {
      Get.offAndToNamed(RouteConfig.login);
    }
  }

  _showLogoutDialog(BuildContext context) async {
    bool confirm = await showDialog<bool>(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('hint'.tr),
            content: Text('confirm_logout'.tr),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text('cancel'.tr),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: Text('confirm'.tr),
              ),
            ],
          ),
        ) ??
        false;
    if (confirm) {
      logic.logout();
      Get.back();
    }
  }
}
