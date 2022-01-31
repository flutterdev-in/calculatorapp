import 'package:calculator_04/buttons/backspace.dart';
import 'package:calculator_04/buttons/brackets.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/divided.dart';
import 'package:calculator_04/buttons/dot.dart';
import 'package:calculator_04/buttons/enter.dart';
import 'package:calculator_04/buttons/eualto.dart';
import 'package:calculator_04/buttons/minus.dart';
import 'package:calculator_04/buttons/multiply.dart';
import 'package:calculator_04/buttons/numbers.dart';
import 'package:calculator_04/buttons/percentage.dart';
import 'package:calculator_04/buttons/plus.dart';
import 'package:calculator_04/buttons/power.dart';
import 'package:calculator_04/buttons/zero_zero.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ButtonsW extends StatelessWidget {
  ButtonsW({Key? key}) : super(key: key);
  ButtonsController b = Get.put(ButtonsController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: md.height * 3 / 5 - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
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
        Expanded(child: Divided(), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: Multiply(), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: Minus(), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: Plus(), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: Enter(), flex: 2),
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
      SizedBox(
        height: 3,
      ),
      Expanded(child: Power(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(7), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(4), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(1), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: ZeroZero(), flex: 4),
    ]);
  }

  Widget secondLeft() {
    return Column(children: [
      Expanded(child: Equalto(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Percentage(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(8), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(5), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(2), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(0), flex: 4),
    ]);
  }

  Widget thirdLeft() {
    return Column(children: [
      Expanded(child: BackSpace(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Brackets(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(9), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(6), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(3), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Dot(), flex: 4),
    ]);
  }
}

class ButtonsController extends GetxController {
  late TextEditingController? tc;
  Rx<int> p = 0.obs;
  Rx<String> n = "".obs;

  @override
  void onInit() {
    tc = TextEditingController();
    super.onInit();
  }

  Widget dummy() {
    return GFButton(
      onPressed: () {},
      child: const Text(
        "=",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
      // padding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
