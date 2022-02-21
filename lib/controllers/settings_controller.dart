import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:calculator_04/settings/themes/theme_apply.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final SettingsController sc = Get.put(
  SettingsController(),
  permanent: true,
);

class SettingsController extends GetxController {
  Rx<bool> isThemeDark = Get.isDarkMode.obs;

  Rx<bool> isEnterLine = true.obs;

  Rx<num> buttonsSpacing = 0.6.obs;
  Rx<int> buttonsRadius = 0.obs;
  Rx<num> bottomPadding = 5.obs;
  Rx<String> mainResultPlacement = "right".obs;

  Rx<num> displayFontSize = 20.obs;
  Rx<num> grossResultFontSize = 22.obs;
  Rx<num> subResultsFontSize = 20.obs;
  Rx<num> numbersFontSize = 30.obs;
  Rx<num> operatorsIconSize = 40.obs;
  Rx<num> actionButtonsIconSize = 25.obs;
  Rx<num> tableFontSize = 22.obs;

  RxList<int> favColors = [0xFFFFFFFF].obs;
  Rx<int> screenBackgroundColor = pc(Colors.black, Colors.white).obs;
  Rx<int> dividerLineColor = pc(Colors.white70, Colors.black38).obs;
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
    isThemeDark.value = sbox.get(bm.isThemeDark) ?? Get.isDarkMode;
    isEnterLine.value = sbox.get(bm.isEnterLine) ?? true;

    buttonsRadius.value = sbox.get(bm.buttonsRadius) ?? 0;
    buttonsSpacing.value = sbox.get(bm.buttonsSpacing) ?? 0.6;
    bottomPadding.value = sbox.get(bm.bottomPadding) ?? 5;
    mainResultPlacement.value = sbox.get(bm.mainResultPlacement) ?? "right";

    //
    displayFontSize.value = sbox.get(bm.displayFontSize) ?? 20;
    grossResultFontSize.value = sbox.get(bm.grossResultFontSize) ?? 22;
    subResultsFontSize.value = sbox.get(bm.subResultsFontSize) ?? 20;
    numbersFontSize.value = sbox.get(bm.numbersFontSize) ?? 27;
    operatorsIconSize.value = sbox.get(bm.operatorsIconSize) ?? 37;
    actionButtonsIconSize.value = sbox.get(bm.actionButtonsIconSize) ?? 25;
    tableFontSize.value = sbox.get(bm.tableFontSize) ?? 22;

    //
    favColors.value = sbox.get(bm.favColors) ?? favColors0;
    screenBackgroundColor.value =
        sbox.get(bm.screenBackgroundColor) ?? pc(Colors.black, Colors.white);

    displayFontColor.value =
        sbox.get(bm.displayFontColor) ?? pc(Colors.white, Colors.black);
    grossResultFontColor.value = sbox.get(bm.grossResultFontColor) ??
        pc(Colors.orange.shade400, Colors.orange.shade900); // 0xFFFFCC80
    subResultsFontColor.value = sbox.get(bm.subResultsFontColor) ??
        pc(Colors.orange.shade200, Colors.orange.shade700);
    actionButtonsColor.value =
        sbox.get(bm.actionButtonsColor) ?? pc(Colors.brown, Colors.brown);
    buttonsBackgroundColor.value = sbox.get(bm.buttonsBackgroundColor) ??
        pc(Colors.white10, Colors.black12);
    cursorColor.value =
        sbox.get(bm.cursorColor) ?? pc(Colors.purple, Colors.purple);
    enterButtonIconColor.value =
        sbox.get(bm.enterButtonIconColor) ?? pc(Colors.white, Colors.white);
    enterButtonBackgroundColor.value =
        sbox.get(bm.enterButtonBackgroundColor) ??
            pc(Colors.green.shade900, Colors.green.shade900);
    numbersColor.value =
        sbox.get(bm.numbersColor) ?? pc(Colors.white, Colors.black);
    onTapColor.value =
        sbox.get(bm.onTapColor) ?? pc(Colors.purple.shade900, Colors.indigo);
    operatorsColor.value =
        sbox.get(bm.operatorsColor) ?? pc(Colors.green, Colors.green);
    powerValuesColor.value =
        sbox.get(bm.powerValuesColor) ?? pc(Colors.blue, Colors.blue);
    dividerLineColor.value =
        sbox.get(bm.dividerLineColor) ?? pc(Colors.white70, Colors.black38);
    sbox.put(bm.favColors, favColors0);
  }
}

List<int> favColors0 = Get.isDarkMode
    ? darkThemeColors.toSet().toList()
    : lightThemeColors.toSet().toList();

List<int> darkThemeColors = [
  psc(Colors.black),
  psc(Colors.white),
  psc(Colors.orange.shade400),
  psc(Colors.orange.shade200),
  psc(Colors.brown),
  psc(Colors.white10),
  psc(Colors.purple),
  psc(Colors.white),
  psc(Colors.green.shade900),
  psc(Colors.white),
  psc(Colors.purple.shade900),
  psc(Colors.green),
  psc(Colors.blue),
  psc(Colors.white70),
];

List<int> lightThemeColors = [
  psc(Colors.white),
  psc(Colors.black),
  psc(Colors.orange.shade900),
  psc(Colors.orange.shade700),
  psc(Colors.brown),
  psc(Colors.black12),
  psc(Colors.purple),
  psc(Colors.white),
  psc(Colors.green.shade900),
  psc(Colors.black),
  psc(Colors.indigo),
  psc(Colors.green),
  psc(Colors.blue),
  psc(Colors.black38),
];

int pc(Color dc, Color lc) {
  return Get.isDarkMode
      ? int.parse(dc.value.toString())
      : int.parse(lc.value.toString());
}

int psc(Color color) {
  return int.parse(color.value.toString());
}

void putFavColor(int intColor) {
  List<int> lf = sc.favColors;
  if (!lf.contains(intColor)) {
    lf.add(intColor);
    if (lf.length > 35) {
      lf.removeAt(15);
    }

    sbox.put(bm.favColors, lf);
  }
}

List<Color> listFavColors(List<int> listint) {
  List<Color> listFavColors0 = [];
  for (int i in listint) {
    listFavColors0.add(Color(i));
  }
  return listFavColors0;
}

List<int> favColors00 = [
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
