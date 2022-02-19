import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class ZeroZero extends StatelessWidget {
  ZeroZero({Key? key}) : super(key: key);

  String zz = "00";
  String powerZZ = "\u2070\u2070";
  void onPressed() {
    mc.n.value = AddSymbol().add("zz", mc.n.value, mc.p.value);
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    mc.p.value = mc.p.value + 2;
    if (mc.n.value.contains(RegExp(r'[\.\d]zz'))) {
      mc.n.value = mc.n.value.replaceAll("zz", zz);
    } else if (mc.n.value.contains(RegExp(r'(^|\n)zz'))) {
      mc.n.value = mc.n.value.replaceAll("zz", "0");
      mc.p.value--;
    } else if (mc.n.value.contains(RegExp(r'[%\)]zz'))) {
      mc.n.value = mc.n.value.replaceAll("zz", "\u00D70");
    } else if (mc.n.value.contains(RegExp(r'[/\u00D7\+\-\(]zz'))) {
      mc.n.value = mc.n.value.replaceAll("zz", "0");
      mc.p.value--;
    } else if (mc.n.value.contains("^zz")) {
      mc.n.value = mc.n.value.replaceAll("^zz", "\u2070");
      mc.p.value--;
    } else if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+zz'))) {
      List<int> ocb = OCB().ocb(mc.n.value, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        mc.n.value = mc.n.value.replaceAll("zz", "\u00D7$zz");
        mc.p.value++;
      } else if (mc.n.value.contains("\u207Ezz")) {
        mc.n.value = mc.n.value.replaceAll("zz", "\u02E3\u2070");
      } else {
        mc.n.value = mc.n.value.replaceAll("zz", powerZZ);
      }
    } else {
      mc.n.value = mc.n.value.replaceAll("zz", "");
      mc.p.value = mc.p.value - 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          isIcon: false,
          text: zz,
          textColour: Color(sc.numbersColor.value),
          textSize: sc.numbersFontSize.value.toDouble(),
        ));
  }
}
