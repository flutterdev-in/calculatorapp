import 'dart:async';

import 'package:calculator_04/buttons/backspace.dart';
import 'package:calculator_04/buttons/brackets.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/divided.dart';
import 'package:calculator_04/buttons/dot.dart';
import 'package:calculator_04/buttons/dummy.dart';
import 'package:calculator_04/buttons/enter.dart';
import 'package:calculator_04/buttons/equalto.dart';
import 'package:calculator_04/buttons/minus.dart';
import 'package:calculator_04/buttons/multiply.dart';
import 'package:calculator_04/buttons/numbers.dart';
import 'package:calculator_04/buttons/percentage.dart';
import 'package:calculator_04/buttons/plus.dart';
import 'package:calculator_04/buttons/power.dart';
import 'package:calculator_04/buttons/zero_zero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:calculator_04/input/controller.dart';
class ButtonsW extends StatelessWidget {
  ButtonsW({Key? key}) : super(key: key);
  MainController b = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Container(
      height: md.height * 3 / 5 - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          firstLeft(),
          secondLeft(),
          thirdLeft(),
          rigthColumn(),
        ],
      ),
    );
  }

  Widget rigthColumn() {
    return Column(
      children: [
        Expanded(child: Dummy(), flex: 3),
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
      Expanded(child: Equalto(), flex: 3),
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
