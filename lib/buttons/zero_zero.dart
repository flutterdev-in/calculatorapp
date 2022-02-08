import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/controller.dart';
class ZeroZero extends StatelessWidget {
  ZeroZero({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  String zz = "00";
  String powerZZ = "\u2070\u2070";
  void onPressed() {
    b.n.value = AddSymbol().add("zz", b.n.value, b.p.value);
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    b.p.value = b.p.value + 2;
    if (b.n.value.contains(RegExp(r'[\.\d]zz'))) {
      b.n.value = b.n.value.replaceAll("zz", zz);
    } else if (b.n.value.contains(RegExp(r'(^|\n)zz'))) {
      b.n.value = b.n.value.replaceAll("zz", "0");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(r'[%\)]zz'))) {
      b.n.value = b.n.value.replaceAll("zz", "\u00D70");
    } else if (b.n.value.contains(RegExp(r'[/\u00D7\+\-\(]zz'))) {
      b.n.value = b.n.value.replaceAll("zz", "0");
      b.p.value--;
    } else if (b.n.value.contains("^zz")) {
      b.n.value = b.n.value.replaceAll("^zz", "\u2070");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+zz'))) {
      List<int> ocb = OCB().ocb(b.n.value, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        b.n.value = b.n.value.replaceAll("zz", "\u00D7$zz");
        b.p.value++;
      } else if (b.n.value.contains("\u207Ezz")) {
        b.n.value = b.n.value.replaceAll("zz", "\u02E3\u2070");
      } else {
        b.n.value = b.n.value.replaceAll("zz", powerZZ);
      }
    } else {
      b.n.value = b.n.value.replaceAll("zz", "");
      b.p.value = b.p.value - 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: zz,
    );
  }
}
