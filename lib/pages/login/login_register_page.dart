import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/login/login_register_logic.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';
import 'package:wan_android_flutter/widgets/clear_textfield.dart';

class LoginRegisterPage extends GetView<LoginRegisterLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildAppBar(Obx(() =>
          Text(controller.isRegister.value ? 'register'.tr : 'login'.tr))),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Obx(() => Text(
                    controller.isRegister.value ? 'register'.tr : 'login'.tr,
                    style: TextStyle(fontSize: 48, color: Colors.blue),
                  )).marginSymmetric(vertical: 50),
              Form(
                child: Column(
                  children: [
                    ClearTextFiled(
                      maxLines: 1,
                      showClear: true,
                      maxLength: 20,
                      decoration: _buildDecoration('login_account_hint'.tr),
                    ),
                    ClearTextFiled(
                      maxLines: 1,
                      showClear: true,
                      obscureText: true,
                      maxLength: 30,
                      decoration: _buildDecoration('login_password_hint'.tr),
                    ).marginOnly(top: 12),
                    Obx(() => Offstage(
                          offstage: !controller.isRegister.value,
                          child: ClearTextFiled(
                            maxLines: 1,
                            showClear: true,
                            obscureText: true,
                            maxLength: 30,
                            decoration: _buildDecoration(
                                'login_password_confirm_hint'.tr),
                          ).marginOnly(top: 12),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => _clickLoginOrRegister(),
                  child: Obx(() => Text(controller.isRegister.value
                      ? 'register'.tr
                      : 'login'.tr)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff2979FF)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 16)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ).marginOnly(top: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => _clickGoToLoginOrRegister(),
                  child: Obx(
                    () => Text(controller.isRegister.value
                        ? 'direct_login'.tr
                        : 'register_account'.tr),
                  ),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 25),
        ),
      ),
    );
  }

  _clickLoginOrRegister() {}

  _clickGoToLoginOrRegister() => controller.changeLoginOrRegister();

  _buildDecoration(String hint) {
    return InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
      labelText: hint,
      labelStyle: TextStyle(fontSize: 14, color: Color(0xffBAB7B7)),
    );
  }
}
