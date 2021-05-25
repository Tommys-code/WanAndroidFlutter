import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/language/zh_CN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {"zh_CN": zh_CN};
}
