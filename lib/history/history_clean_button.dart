import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';

class HistoryCleanButton extends StatelessWidget {
  const HistoryCleanButton({Key? key}) : super(key: key);

  void onPressed() async {
    await hbox.clear();
    await Future.delayed(const Duration(milliseconds: 600));
    hc.isHistoryEmpty.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
          ontap: () => onPressed(),
          isIcon: false,
          text: " Clear\n History",
          textSize: 10,
          textColour: Colors.brown,
        );
  }
}
