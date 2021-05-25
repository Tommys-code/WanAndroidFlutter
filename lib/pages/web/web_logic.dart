import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class WebLogic extends GetxController {
  late FlutterWebviewPlugin _flutterWebViewPlugin;

  late RxString mTitle;

  WebLogic(){
    _flutterWebViewPlugin = new FlutterWebviewPlugin();
    mTitle = ''.obs;
    _flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print('onUrlChanged');
      getWebTitle();
    });
  }


  //获取h5页面标题
  getWebTitle() async {
    String script = 'document.title';
    String title = await _flutterWebViewPlugin.evalJavascript(script) ?? '';
    mTitle.value = title;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _flutterWebViewPlugin.dispose();
  }
}
