import 'package:get/get.dart';
import 'package:hive/hive.dart';

class InputSettingsController extends GetxController {
  Rx<double> fontSize = 20.0.obs;
  Rx<int> fontColor = 0xffb74093.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    Box sbox = Hive.box("settings");
    fontSize.value = sbox.get("inputFontSize", defaultValue: 20.0);
    fontColor.value = sbox.get("inputFontColor", defaultValue: 0xffb74093);
  }
}
