import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/history/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryCleanButton extends StatelessWidget {
  HistoryCleanButton({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final HistoryController hc = Get.put(HistoryController());
  void onPressed() async {
    await Hive.box("history").clear();
    await Duration(milliseconds: 700);
    hc.isHistoryEmpty.value = true;
    await Duration(milliseconds: 700);
    hc.isHistoryEmpty.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: MdiIcons.deleteCircleOutline,
      iconColor: Colors.brown,
    );
  }
}
