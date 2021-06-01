import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

extension ListWigetExt on Widget {
  Widget buildListStateWidget<T>({
    required List<T>? value,
  }) =>
      value == null
          ? CommonWidget.buildFirstLoad()
          : value.isEmpty
              ? CommonWidget.buildEmptyList()
              : this;

  Widget buildSliverListStateWidget<T>({
    required List<T>? value,
  }) =>
      value == null
          ? CommonWidget.buildFirstLoad().sliverBox
          : value.isEmpty
              ? CommonWidget.buildEmptyList().sliverBox
              : this;
}

extension WidgetDrawable on Widget {
  Widget drawableHorizontal({
    Widget? left,
    Widget? right,
  }) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (left != null) left,
          this,
          if (right != null) right,
        ],
      );
}

typedef TabCallBack = void Function();

extension WidgetGesture on Widget {
  Widget onTab(TabCallBack? callBack) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: this,
        onTap: callBack,
      );
}
