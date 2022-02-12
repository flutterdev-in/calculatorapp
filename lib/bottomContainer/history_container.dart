import 'package:calculator_04/bottomContainer/main_container.dart';
import 'package:calculator_04/buttons/backspace.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/enter.dart';
import 'package:calculator_04/buttons/plus.dart';
import 'package:calculator_04/buttons/precision.dart';

import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/history/history_button.dart';
import 'package:calculator_04/history/history_clean_button.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/history/history_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';

class ButtonsWd extends StatelessWidget {
  ButtonsWd({Key? key}) : super(key: key);
  MainController b = Get.put(MainController());
  final HistoryController hc = Get.put(HistoryController());

  HistoryBox hb = HistoryBox();

  @override
  Widget build(BuildContext context) {
    List hl = hb.listHistory();
    Size md = MediaQuery.of(context).size;
    double mw = MediaQuery.of(context).size.width;
    return Container(
      height: md.height * 3 / 5 - 50,
      child: Obx(() {
        if (hc.isHistoryOpen.value) {
          return withHistory();
        } else {
          return MainContainer();
        }
      }),
    );
  }

  Widget withHistory() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(child: HistoryWidget(), color: Colors.white10),
        ),
        Expanded(child: fixedButtons(), flex: 1),
      ],
    );
  }

  Widget emptyHistory() {
    return Row(
      children: [
        Expanded(
          flex: 29,
          child: Container(color: Colors.white10),
        ),
        Expanded(child: fixedButtons(), flex: 7),
      ],
    );
  }

  Widget fixedButtons() {
    return Column(
      children: [
        Expanded(child: HistoryButton(), flex: 3),
        Expanded(child: BackSpace(), flex: 3),
        Expanded(child: HistoryCleanButton(), flex: 4),
        Expanded(child: Clear(), flex: 4),
        Expanded(child: Plus(), flex: 4),
        Expanded(child: Enter(), flex: 4),
      ],
    );
  }
}
