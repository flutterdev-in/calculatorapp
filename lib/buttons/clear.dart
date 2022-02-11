import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Clear extends StatelessWidget {
  Clear({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());
  void onPressed() async {
    HistoryBox hb = HistoryBox();
    if (!b.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(b.n.value);
    }

    b.n.value = "";
    b.p.value = 0;
    r.gr.value = "0";
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: MdiIcons.closeCircleMultipleOutline,
      iconSize: 28,
      iconColor: Colors.pink.shade900,
      // buttonColor: Colors.white12,
    );
  }
}
