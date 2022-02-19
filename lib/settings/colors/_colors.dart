import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/settings/colors/color_picker_custom.dart';
import 'package:calculator_04/settings/fontsizes/main_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/sub_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/result_table_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Colours"),
          backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            // shrinkWrap: true,
            children: [
              Obx(() => ColorPickerWd(
                    text: "Display font color",
                    colorInt: sc.displayFontColor.value,
                    onColorChange: (color) => sc.displayFontColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Sub results font color",
                    colorInt: sc.subResultsFontColor.value,
                    onColorChange: (color) => sc.subResultsFontColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Main results font color",
                    colorInt: sc.grossResultFontColor.value,
                    onColorChange: (color) => sc.grossResultFontColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Action buttons color",
                    colorInt: sc.actionButtonsColor.value,
                    onColorChange: (color) => sc.actionButtonsColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Operators color",
                    colorInt: sc.operatorsColor.value,
                    onColorChange: (color) => sc.operatorsColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Numbers color",
                    colorInt: sc.numbersColor.value,
                    onColorChange: (color) => sc.numbersColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Enter button icon color",
                    colorInt: sc.enterButtonIconColor.value,
                    onColorChange: (color) => sc.enterButtonIconColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Enter button background color",
                    colorInt: sc.enterButtonBackgroundColor.value,
                    onColorChange: (color) => sc.enterButtonBackgroundColor
                        .value = int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Buttons background color",
                    colorInt: sc.buttonsBackgroundColor.value,
                    onColorChange: (color) => sc.buttonsBackgroundColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Button tap color",
                    colorInt: sc.onTapColor.value,
                    onColorChange: (color) =>
                        sc.onTapColor.value = int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "PowerValues color",
                    colorInt: sc.powerValuesColor.value,
                    onColorChange: (color) => sc.powerValuesColor.value =
                        int.parse(color.value.toString()),
                  )),
              Obx(() => ColorPickerWd(
                    text: "Cursor color",
                    colorInt: sc.cursorColor.value,
                    onColorChange: (color) => sc.cursorColor.value =
                        int.parse(color.value.toString()),
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
      color: Colors.white12,
      child: ListTile(
          title: Text("Colours"),
          onTap: () {
            Get.to(ColorsScreen(), transition: Transition.leftToRightWithFade);
          }),
    );
  }
}
