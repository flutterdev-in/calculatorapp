import 'package:calculator_04/buttons/_main_container.dart';
import 'package:calculator_04/buttons/backspace.dart';

import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/history/history_button.dart';
import 'package:calculator_04/history/history_clean_button.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/history/history_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class ButtonsWd extends StatelessWidget {
  ButtonsWd({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
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

    // ? Row(
    //     children: [
    //       Expanded(
    //           flex: 400,
    //           child: Container(
    //               child:  HistoryWidget(),
    //               // !hc.isHistoryEmpty.value
    //               //     ? HistoryWidget()
    //               //     : const SizedBox(),
    //               color: Colors.white10)),
    //       Expanded(child: fixedButtons(), flex: 97),
    //     ],
    //   )
  }

  Widget withHistory() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            flex: 400,
            child: Container(
                child: !hc.isHistoryEmpty.value ? HistoryWidget() : Container(),
                color: Colors.white10),
          ),
          Expanded(child: fixedButtons(), flex: 97),
        ],
      ),
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
        Expanded(child: BackSpace(), flex: 5),
        Expanded(child: HistoryCleanButton(), flex: 5),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: Container(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "Swipe left or right to delete each item",
                    textScaleFactor: 1.13,
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ),
            flex: 15),
      ],
    );
  }
}
