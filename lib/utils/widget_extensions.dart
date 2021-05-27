import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
}
