import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavHistoryButton extends StatelessWidget {
  const FavHistoryButton({Key? key}) : super(key: key);

  void onPressed() {
    if (hc.isFavHistoryEmpty.value && hc.isFavPressed.value) {
      hc.isHistoryEmpty.value = false;
    }
    hc.isHistoryEmpty.value = false;
    hc.isFavPressed.value = !hc.isFavPressed.value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          iconData: hc.isFavPressed.value
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          iconColor: Color(sc.actionButtonsColor.value),
        ));
  }
}
