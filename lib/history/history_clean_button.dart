import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCleanButton extends StatelessWidget {
  const HistoryCleanButton({Key? key}) : super(key: key);

  void onPressed() async {
    if (hc.isFavPressed.value) {
      await favhbox.clear();
    } else {
      await hbox.clear();
    }
    await Future.delayed(const Duration(milliseconds: 600));
    hc.isHistoryEmpty.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          isIcon: false,
          text: hc.isFavPressed.value
              ? " Clear\n Favourites"
              : " Clear\n recycle\n bin",
          textSize: 10,
          textColour: Color(sc.actionButtonsColor.value),
        ));
  }
}
