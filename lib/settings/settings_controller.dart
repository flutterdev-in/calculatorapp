import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsController extends GetxController {

  Rx<bool> isThemeBlack = true.obs;

  Rx<int> inputFontColor = 0xffb74093.obs;
  Rx<double> inputFontSize = 20.0.obs;
  Rx<double> grossResultFontSize = 20.0.obs;
  Rx<double> subResultsFontSize = 20.0.obs;


  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    Box sbox = Hive.box("settings");
    inputFontSize.value = sbox.get("inputFontSize", defaultValue: 20.0);
    inputFontColor.value = sbox.get("inputFontColor", defaultValue: 0xffb74093);
    grossResultFontSize.value = sbox.get("grossResultFontSize", defaultValue: 20.0);
    subResultsFontSize.value = sbox.get("subResultsFontSize", defaultValue: 20.0);
  }
}