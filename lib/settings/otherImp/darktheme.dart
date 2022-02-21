import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

Rx<bool> isDarkTheme = Get.isDarkMode.obs;

class DarkDecideCard extends StatelessWidget {
  const DarkDecideCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rc.precision.value = sbox.get(bm.precision) ?? 2;

    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Reset theme"),
          TextButton(
            onPressed: () async {
              selectTheme(lightThemeColors);
              isDarkTheme.value = false;
              await Future.delayed(const Duration(milliseconds: 700));
              Get.back();
            },
            child: Obx(() => Text(
                  "Light",
                  style: TextStyle(
                    color: isDarkTheme.value
                        ? Get.isDarkMode
                            ? Colors.white
                            : Colors.black
                        : Colors.green,
                  ),
                )),
          ),
          TextButton(
            onPressed: () async {
              selectTheme(darkThemeColors);
              isDarkTheme.value = true;
              await Future.delayed(const Duration(milliseconds: 700));
              Get.back();
            },
            child: Obx(() => Text(
                  "Dark",
                  style: TextStyle(
                    color: isDarkTheme.value
                        ? Colors.green
                        : Get.isDarkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

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

void selectTheme(List<int> l) {
  sc.isEnterLine.value = true;

  sc.buttonsRadius.value = 0;
  sc.buttonsSpacing.value = 0.6;
  sc.bottomPadding.value = 5;
  sc.mainResultPlacement.value = "right";

  //
  sc.displayFontSize.value = 20;
  sc.grossResultFontSize.value = 22;
  sc.subResultsFontSize.value = 20;
  sc.numbersFontSize.value = 27;
  sc.operatorsIconSize.value = 37;
  sc.actionButtonsIconSize.value = 25;
  sc.tableFontSize.value = 22;

  sc.screenBackgroundColor.value = l[0];

  sc.displayFontColor.value = l[1];
  sc.grossResultFontColor.value = l[2];
  sc.subResultsFontColor.value = l[3];
  sc.actionButtonsColor.value = l[4];
  sc.buttonsBackgroundColor.value = l[5];
  sc.cursorColor.value = l[6];
  sc.enterButtonIconColor.value = l[7];
  sc.enterButtonBackgroundColor.value = l[8];
  sc.numbersColor.value = l[9];
  sc.onTapColor.value = l[10];
  sc.operatorsColor.value = l[11];
  sc.powerValuesColor.value = l[12];
  sc.dividerLineColor.value = l[13];

  sbox.put(bm.isEnterLine, true);
  sbox.put(bm.buttonsRadius, 0);
  sbox.put(bm.buttonsSpacing, 0.6);
  sbox.put(bm.bottomPadding, 5);
  sbox.put(bm.mainResultPlacement, "right");
  sbox.put(bm.displayFontSize, 20);
  sbox.put(bm.grossResultFontSize, 22);
  sbox.put(bm.subResultsFontSize, 20);
  sbox.put(bm.numbersFontSize, 27);
  sbox.put(bm.operatorsIconSize, 37);
  sbox.put(bm.actionButtonsIconSize, 25);
  sbox.put(bm.tableFontSize, 22);

  sbox.put(bm.screenBackgroundColor, l[0]);
  sbox.put(bm.displayFontColor, l[1]);
  sbox.put(bm.grossResultFontColor, l[2]);
  sbox.put(bm.subResultsFontColor, l[3]);
  sbox.put(bm.actionButtonsColor, l[4]);
  sbox.put(bm.buttonsBackgroundColor, l[5]);
  sbox.put(bm.cursorColor, l[6]);
  sbox.put(bm.enterButtonIconColor, l[7]);
  sbox.put(bm.enterButtonBackgroundColor, l[8]);
  sbox.put(bm.numbersColor, l[9]);
  sbox.put(bm.onTapColor, l[10]);
  sbox.put(bm.operatorsColor, l[11]);
  sbox.put(bm.powerValuesColor, l[12]);
  sbox.put(bm.dividerLineColor, l[13]);
}
