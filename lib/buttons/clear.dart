import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/input/controller.dart';
import 'package:hive/hive.dart';

class Clear extends StatelessWidget {
  Clear({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  void onPressed() async {
    HistoryBox hb = HistoryBox();
    // int key = Hive.box("history").keys.toList().length-1;
    // Hive.box("history").putAt(index, value)
    hb.addItemToHistoryBox(b.n.value);
    b.n.value = "";
    b.p.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: "C",
      textScaleFactor: 2.5,
      textColour: Colors.red.shade400,
    );
  }
}
