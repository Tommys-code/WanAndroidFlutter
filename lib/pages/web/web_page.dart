import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/web/web_logic.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

class WebPage extends GetView<WebLogic> {
  @override
  Widget build(BuildContext context) {
    printInfo(info: Get.arguments);
    return WebviewScaffold(
      url: Get.arguments,
      appBar: AppBar(
        leading: CommonWidget.buildBackIcon(),
        centerTitle: true,
        title: Obx(() => Text(controller.mTitle.value)),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
