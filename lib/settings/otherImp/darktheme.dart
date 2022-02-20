import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/main.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkDecideCard extends StatelessWidget {
  const DarkDecideCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rc.precision.value = sbox.get(bm.precision) ?? 2;

    return Card(
      color: sc.isThemeDark.value ? Colors.white12 : Colors.white70,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Calculator theme"),
              TextButton(
                onPressed: () {
                  sc.isThemeDark.value == false;
                  
                },
                child: Text(
                  "Light",
                  style: TextStyle(
                      color: sc.isThemeDark.value ? Colors.red : Colors.green),
                ),
              ),
              TextButton(
                onPressed: () {
                  sc.isThemeDark.value = true;

                  
                },
                child: Text(
                  "Dark",
                  style: TextStyle(
                      color: sc.isThemeDark.value ? Colors.green : Colors.red),
                ),
              ),
            ],
          )),
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
  psc(Colors.purple),
  psc(Colors.green),
  psc(Colors.blue),
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
  psc(Colors.purple),
  psc(Colors.green.shade900),
  psc(Colors.blue),
];

void selectTheme(List<int> l) {
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
}
