import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';

class MineTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mine'.tr)),
      body: Center(child: Text('mine'),),
    );
  }
}
