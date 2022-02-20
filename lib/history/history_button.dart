import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryButton extends StatelessWidget {
  HistoryButton({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  void onPressed() {
    hc.isHistoryOpen.value = !hc.isHistoryOpen.value;
    hc.isHistoryEmpty.value = false;
  }

  void longPress() {
    HistoryBox hb = HistoryBox();
    if (!b.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(b.n.value);
      hc.isHistoryEmpty.value = false;
      hc.isFavPressed.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          onLongPress: () => longPress(),
          iconData:
              hc.isHistoryOpen.value ? MdiIcons.tableLarge : MdiIcons.history,
          iconColor: Color(sc.actionButtonsColor.value),
          iconSize: sc.actionButtonsIconSize.value.toDouble() + 4,
          // buttonColor: Colors.white12,
        ));
  }
}
