import 'package:calculator_04/buttons/backspace.dart';
import 'package:calculator_04/buttons/brackets.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/comma.dart';

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
import 'package:calculator_04/history/history_button.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    double mw = MediaQuery.of(context).size.width;
    return Container(
      height: md.height * 3 / 5 - 50,
      child: grossContainer(),
    );
  }

  Widget grossContainer() {
    return Column(
      children: [
        Expanded(child: firstRow(), flex: 3),
        Expanded(child: secondRow(), flex: 4),
        Expanded(child: thirdRow(), flex: 5),
        Expanded(child: forthRow(), flex: 5),
        Expanded(child: fifthRow(), flex: 5),
        Expanded(child: sixthRow(), flex: 5),
      ],
    );
  }

  Widget firstRow() {
    return Row(
      children: [
        Expanded(child: Clear(), flex: 1),
        Expanded(child: PrecisionB(), flex: 1),
        Expanded(child: Comma(), flex: 1),
        Expanded(child: BackSpace(), flex: 1),
        Expanded(child: HistoryButton(), flex: 1),
      ],
    );
  }

  Widget secondRow() {
    return Row(
      children: [
        Expanded(child: Power(), flex: 1),
        Expanded(child: Percentage(), flex: 1),
        Expanded(child: Brackets(), flex: 1),
        Expanded(child: Divided(), flex: 1),
      ],
    );
  }

  Widget thirdRow() {
    return Row(
      children: [
        Expanded(child: Numbers.select(7), flex: 1),
        Expanded(child: Numbers.select(8), flex: 1),
        Expanded(child: Numbers.select(9), flex: 1),
        Expanded(child: Multiply(), flex: 1),
      ],
    );
  }

  Widget forthRow() {
    return Row(
      children: [
        Expanded(child: Numbers.select(4), flex: 1),
        Expanded(child: Numbers.select(5), flex: 1),
        Expanded(child: Numbers.select(6), flex: 1),
        Expanded(child: Minus(), flex: 1),
      ],
    );
  }

  Widget fifthRow() {
    return Row(
      children: [
        Expanded(child: Numbers.select(1), flex: 1),
        Expanded(child: Numbers.select(2), flex: 1),
        Expanded(child: Numbers.select(3), flex: 1),
        Expanded(child: Plus(), flex: 1),
      ],
    );
  }

  Widget sixthRow() {
    return Row(
      children: [
        Expanded(child: ZeroZero(), flex: 1),
        Expanded(child: Numbers.select(0), flex: 1),
        Expanded(child: Dot(), flex: 1),
        Expanded(child: Enter(), flex: 1),
      ],
    );
  }
}
