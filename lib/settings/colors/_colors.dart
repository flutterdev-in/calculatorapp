import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/main.dart';
import 'package:calculator_04/settings/colors/color_picker_custom.dart';
import 'package:calculator_04/settings/colors/temp_home_page.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Colours"),

          // backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            // shrinkWrap: true,
            children: [
              Obx(() => ColorPickerWd(
                    text: "Screen background color",
                    colorInt: sc.screenBackgroundColor.value,
                    onColorPick: () =>
                        sc.screenBackgroundColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.screenBackgroundColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Buttons background color",
                    colorInt: sc.buttonsBackgroundColor.value,
                    onColorPick: () =>
                        sc.buttonsBackgroundColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.buttonsBackgroundColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Button tap color",
                    colorInt: sc.onTapColor.value,
                    onColorPick: () =>
                        sc.onTapColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.onTapColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Math symbols color",
                    colorInt: sc.mathSymbolsColor.value,
                    onColorPick: () =>
                        sc.mathSymbolsColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.mathSymbolsColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Divider line color",
                    colorInt: sc.dividerLineColor.value,
                    onColorPick: () =>
                        sc.dividerLineColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.dividerLineColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Display font color",
                    colorInt: sc.displayFontColor.value,
                    onColorPick: () =>
                        sc.displayFontColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.displayFontColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Sub results font color",
                    colorInt: sc.subResultsFontColor.value,
                    onColorPick: () =>
                        sc.subResultsFontColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.subResultsFontColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Main results font color",
                    colorInt: sc.grossResultFontColor.value,
                    onColorPick: () =>
                        sc.grossResultFontColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.grossResultFontColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Action buttons color",
                    colorInt: sc.actionButtonsColor.value,
                    onColorPick: () =>
                        sc.actionButtonsColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.actionButtonsColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Operators color",
                    colorInt: sc.operatorsColor.value,
                    onColorPick: () {
                      sc.operatorsColor.value = pickedColorInt.value;
                      if (sbox.get(bm.mathSymbolsColor) == null) {
                        sc.mathSymbolsColor.value = sc.operatorsColor.value;
                      }
                      if (sbox.get(bm.enterButtonBackgroundColor) == null) {
                        sc.enterButtonBackgroundColor.value =
                            sc.operatorsColor.value;
                      }
                    },
                    colorKeyToPut: bm.operatorsColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Numbers color",
                    colorInt: sc.numbersColor.value,
                    onColorPick: () =>
                        sc.numbersColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.numbersColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Enter button icon color",
                    colorInt: sc.enterButtonIconColor.value,
                    onColorPick: () =>
                        sc.enterButtonIconColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.enterButtonIconColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Enter button background color",
                    colorInt: sc.enterButtonBackgroundColor.value,
                    onColorPick: () => sc.enterButtonBackgroundColor.value =
                        pickedColorInt.value,
                    colorKeyToPut: bm.enterButtonBackgroundColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Power values color",
                    colorInt: sc.powerValuesColor.value,
                    onColorPick: () =>
                        sc.powerValuesColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.powerValuesColor,
                  )),
              Obx(() => ColorPickerWd(
                    text: "Cursor color",
                    colorInt: sc.cursorColor.value,
                    onColorPick: () =>
                        sc.cursorColor.value = pickedColorInt.value,
                    colorKeyToPut: bm.cursorColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorsCard extends StatelessWidget {
  const ColorsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sc.isThemeDark.value ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Colors"),
          onTap: () {
            Get.to(
              ColorsScreen(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
