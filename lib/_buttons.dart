import 'package:calculator_04/buttons/backspace.dart';
import 'package:calculator_04/buttons/brackets.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/divided.dart';
import 'package:calculator_04/buttons/dot.dart';
import 'package:calculator_04/buttons/enter.dart';
import 'package:calculator_04/buttons/minus.dart';
import 'package:calculator_04/buttons/multiply.dart';
import 'package:calculator_04/buttons/numbers.dart';
import 'package:calculator_04/buttons/percentage.dart';
import 'package:calculator_04/buttons/plus.dart';
import 'package:calculator_04/buttons/power.dart';
import 'package:calculator_04/buttons/precision.dart';
import 'package:calculator_04/buttons/zero_zero.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/history/history_button.dart';
import 'package:calculator_04/history/history_clean_button.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/history/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';

class ButtonsW extends StatelessWidget {
  ButtonsW({Key? key}) : super(key: key);
  MainController b = Get.put(MainController());
  final HistoryController hc = Get.put(HistoryController());
  final HistoryBox hb = HistoryBox();

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    double mw = MediaQuery.of(context).size.width;
    return SizedBox(
      height: md.height * 3 / 5 - 50,
      child: Obx(() {
        // if (hc.isHistoryOpen.value && hc.isHistoryEmpty.value) {
        //   return emptyHistory();
        // }
        if (hc.isHistoryOpen.value) {
          return withHistory();
        } else {
          return calcWhole();
        }
      }),
    );
  }

  Widget withHistory() {
    return Row(
      children: [
        Expanded(
          flex: 3,
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
          flex: 3,
          child: Container(color: Colors.white10),
        ),
        Expanded(child: fixedButtons(), flex: 1),
      ],
    );
  }

  Widget calcWhole() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        firstLeft(),
        secondLeft(),
        thirdLeft(),
        rigthColumn(),
      ],
    );
  }

  Widget rxButtons() {
    return Column(
      children: [
        Expanded(child: firstRow(), flex: 3),
        Expanded(child: secondRow(), flex: 3),
        Expanded(child: thirdRow(), flex: 4),
        Expanded(child: forthRow(), flex: 4),
        Expanded(child: fifthRow(), flex: 4),
        Expanded(child: sixthRow(), flex: 4),
      ],
    );
  }

  Widget fixedButtons() {
    return Column(
      children: [
        Expanded(child: HistoryButton(), flex: 3),
        Expanded(child: BackSpace(), flex: 3),
        Expanded(child: PrecisionB(), flex: 4),
        Expanded(child: HistoryCleanButton(), flex: 4),
        Expanded(child: Plus(), flex: 4),
        Expanded(child: Enter(), flex: 4),
      ],
    );
  }

  Widget firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Clear(),
        PrecisionB(),
        BackSpace(),
      ],
    );
  }

  Widget secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Power(),
        Percentage(),
        Brackets(),
      ],
    );
  }

  Widget thirdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Numbers.select(7),
        Numbers.select(8),
        Numbers.select(9),
      ],
    );
  }

  Widget forthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Numbers.select(4),
        Numbers.select(5),
        Numbers.select(6),
      ],
    );
  }

  Widget fifthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Numbers.select(1),
        Numbers.select(2),
        Numbers.select(3),
      ],
    );
  }

  Widget sixthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ZeroZero(),
        Numbers.select(0),
        Dot(),
      ],
    );
  }

  Widget rigthColumn() {
    return Column(
      children: [
        Expanded(child: HistoryButton(), flex: 3),
        Expanded(child: Divided(), flex: 3),
        Expanded(child: Multiply(), flex: 4),
        Expanded(child: Minus(), flex: 4),
        Expanded(child: Plus(), flex: 4),
        Expanded(child: Enter(), flex: 4),
      ],
    );
  }

  Widget leftGrossColumn() {
    return Column(children: [
      firstLeft(),
      secondLeft(),
      thirdLeft(),
    ]);
  }

  Widget firstLeft() {
    return Column(children: [
      Expanded(child: Clear(), flex: 3),
      Expanded(child: Power(), flex: 3),
      Expanded(child: Numbers.select(7), flex: 4),
      Expanded(child: Numbers.select(4), flex: 4),
      Expanded(child: Numbers.select(1), flex: 4),
      Expanded(child: ZeroZero(), flex: 4),
    ]);
  }

  Widget secondLeft() {
    return Column(children: [
      Expanded(child: PrecisionB(), flex: 3),
      Expanded(child: Percentage(), flex: 3),
      Expanded(child: Numbers.select(8), flex: 4),
      Expanded(child: Numbers.select(5), flex: 4),
      Expanded(child: Numbers.select(2), flex: 4),
      Expanded(child: Numbers.select(0), flex: 4),
    ]);
  }

  Widget thirdLeft() {
    return Column(children: [
      Expanded(child: BackSpace(), flex: 3),
      Expanded(child: Brackets(), flex: 3),
      Expanded(child: Numbers.select(9), flex: 4),
      Expanded(child: Numbers.select(6), flex: 4),
      Expanded(child: Numbers.select(3), flex: 4),
      Expanded(child: Dot(), flex: 4),
    ]);
  }
}
