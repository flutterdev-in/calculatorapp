import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Clear extends StatelessWidget {
  Clear({Key? key}) : super(key: key);

  void onPressed() async {
    HistoryBox hb = HistoryBox();
    if (!mc.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(mc.n.value);
      hc.isFavPressed.value = false;
    }

    mc.n.value = "";
    mc.p.value = 0;
    rc.gr.value = "0";
  }

  void onLongPressed() {
    HistoryBox hb = HistoryBox();
    if (!mc.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToFavHistoryBox(mc.n.value);
      hc.isFavPressed.value = true;
    }

    mc.n.value = "";
    mc.p.value = 0;
    rc.gr.value = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          onLongPress: () => onLongPressed(),
          iconData: MdiIcons.closeCircleMultipleOutline,
          iconSize: sc.actionButtonsIconSize.value.toDouble() + 5,
          iconColor: Color(sc.actionButtonsColor.value),
        ));
  }
}
