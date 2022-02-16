import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsController extends GetxController {
  Rx<bool> isThemeBlack = true.obs;
  Rx<int> inputFontColor = 0xffb74093.obs;
  Rx<double> inputFontSize = 20.0.obs;
  Rx<double> grossResultFontSize = 22.0.obs;
  Rx<double> subResultsFontSize = 20.0.obs;
  Rx<double> bottomPadding = 15.0.obs;
  Rx<bool> isEnterLine = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    Box sbox = Hive.box("settings");
    double? _inputFontSize = sbox.get("inputFontSize");
    double? _grossResultFontSize = sbox.get("grossResultFontSize");
    double? _subResultsFontSize = sbox.get("inputFontSize");
    int? _inputFontColor = sbox.get("inputFontColor");
    double? _bottomPadding = sbox.get("bottomPadding");
    bool? _isEnterLine = sbox.get("isEnterLine");

    if (_inputFontSize == null) {
      sbox.put("inputFontSize", 20.0);
    }
    if (_grossResultFontSize == null) {
      sbox.put("grossResultFontSize", 22.0);
    }
    if (_subResultsFontSize == null) {
      sbox.put("subResultsFontSize", 20.0);
    }
    if (_inputFontColor == null) {
      sbox.put("inputFontColor", 0xFFFFFF);
    }
    if (_bottomPadding == null) {
      sbox.put("bottomPadding", 15.0);
    }
    if (_isEnterLine == null) {
      sbox.put("isEnterLine", true);
    }

    inputFontSize.value = sbox.get("inputFontSize") ?? 20.0;
    inputFontColor.value = sbox.get("inputFontColor") ?? 0xFFFFFF;
    grossResultFontSize.value = sbox.get("grossResultFontSize") ?? 22.0;
    subResultsFontSize.value = sbox.get("subResultsFontSize") ?? 20.0;
    bottomPadding.value = sbox.get("bottomPadding") ?? 15.0;
    isEnterLine.value = sbox.get("isEnterLine") ?? true;
  }
}
