import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_rx.dart';
import 'package:calculator_04/history/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryButton extends StatelessWidget {
  HistoryButton({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final HistoryController hrx = Get.put(HistoryController());
  void onPressed() async {
    hrx.isHistoryOpen.value = !hrx.isHistoryOpen.value;
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: MdiIcons.history,
      iconColor: Colors.brown,
    );
  }
}
