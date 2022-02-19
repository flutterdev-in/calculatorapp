import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final SettingsController sc = Get.put(
  SettingsController(),
  permanent: true,
);

class SettingsController extends GetxController {
  Rx<bool> isThemeBlack = true.obs;

  Rx<bool> isEnterLine = true.obs;

  Rx<num> bottomPadding = 15.obs;
  Rx<String> mainResultPlacement = "right".obs;

  Rx<num> displayFontSize = 20.obs;
  Rx<num> grossResultFontSize = 22.obs;
  Rx<num> subResultsFontSize = 20.obs;
  Rx<num> numbersFontSize = 30.obs;
  Rx<num> operatorsIconSize = 40.obs;
  Rx<num> actionButtonsIconSize = 25.obs;
  Rx<num> tableFontSize = 22.obs;

  RxList<int> favColors = [0xFFFFFFFF].obs;
  Rx<int> displayFontColor = 0xFFFFFFFF.obs;
  Rx<int> grossResultFontColor = 0xFFFFCC80.obs;
  Rx<int> subResultsFontColor = 0xFFFFB74D.obs;
  Rx<int> actionButtonsColor = 0xFF795548.obs;
  Rx<int> buttonsBackgroundColor = 0x1AFFFFFF.obs;
  Rx<int> cursorColor = 0xFF9C27B0.obs;
  Rx<int> enterButtonIconColor = 0xFFFFFFFF.obs;
  Rx<int> enterButtonBackgroundColor = 0xFF1B5E20.obs;
  Rx<int> numbersColor = 0xFFFFFFFF.obs;
  Rx<int> onTapColor = 0xFF880E4F.obs;
  Rx<int> operatorsColor = 0xFF4CAF50.obs;
  Rx<int> powerValuesColor = 0xFF2196F3.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    isThemeBlack.value = sbox.get(bm.isThemeBlack) ?? true;
    isEnterLine.value = sbox.get(bm.isEnterLine) ?? true;

    bottomPadding.value = sbox.get(bm.bottomPadding) ?? 15;
    mainResultPlacement.value = sbox.get(bm.mainResultPlacement) ?? "right";

    displayFontSize.value = sbox.get(bm.displayFontSize) ?? 20;
    grossResultFontSize.value = sbox.get(bm.grossResultFontSize) ?? 22;
    subResultsFontSize.value = sbox.get(bm.subResultsFontSize) ?? 20;
    numbersFontSize.value = sbox.get(bm.numbersFontSize) ?? 27;
    operatorsIconSize.value = sbox.get(bm.operatorsIconSize) ?? 37;
    actionButtonsIconSize.value = sbox.get(bm.actionButtonsIconSize) ?? 25;
    tableFontSize.value = sbox.get(bm.tableFontSize) ?? 22;

    favColors.value = sbox.get(bm.favColors) ?? favColors0;

    displayFontColor.value = sbox.get(bm.displayFontColor) ?? 0xFFFFFFFF;
    grossResultFontColor.value =
        sbox.get(bm.grossResultFontColor) ?? 0xFFFFCC80;
    subResultsFontColor.value = sbox.get(bm.subResultsFontColor) ?? 0xFFFFB74D;
    actionButtonsColor.value = sbox.get(bm.actionButtonsColor) ?? 0xFF795548;
    buttonsBackgroundColor.value =
        sbox.get(bm.buttonsBackgroundColor) ?? 0x1AFFFFFF;
    cursorColor.value = sbox.get(bm.cursorColor) ?? 0xFF9C27B0;
    enterButtonIconColor.value =
        sbox.get(bm.enterButtonIconColor) ?? 0xFFFFFFFF;
    enterButtonBackgroundColor.value =
        sbox.get(bm.enterButtonBackgroundColor) ?? 0xFF1B5E20;
    numbersColor.value = sbox.get(bm.numbersColor) ?? 0xFFFFFFFF;
    onTapColor.value = sbox.get(bm.onTapColor) ?? 0xFF880E4F;
    operatorsColor.value = sbox.get(bm.operatorsColor) ?? 0xFF4CAF50;
    powerValuesColor.value = sbox.get(bm.powerValuesColor) ?? 0xFF2196F3;

    sbox.put(bm.favColors, favColors0);
  }
  

  
}
void putFavColor(int intColor) {
  List<int> lf = sbox.get(bm.favColors)??favColors0;
  if (!lf.contains(intColor)) {
    lf.add(intColor);
    if (lf.length > 35) {
      lf.removeAt(0);
    }
    
    sbox.put(bm.favColors, lf);
  }}



List<Color> listFavColors(List<int> listint) {
  List<Color> listFavColors0 = [];
  for (int i in listint) {
    listFavColors0.add(Color(i));
  }
  return listFavColors0;
}






List<int> favColors0 = [
  0xFFFFFFFF,
  0xFFFFCC80,
  0xFFFFB74D,
  0xFF795548,
  0x1AFFFFFF,
  0xFF9C27B0,
  0xFF1B5E20,
  0xFF880E4F,
  0xFF4CAF50,
  0xFF2196F3,
];
