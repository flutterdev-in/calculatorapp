import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:flutter/services.dart';

class Numbers extends StatelessWidget {
  Numbers({Key? key}) : super(key: key);

  late int number;
  Numbers.select(this.number);
  List<String> numberUcodes = [
    "\u2070",
    "\u00B9",
    '\u00B2',
    '\u00B3',
    '\u2074',
    '\u2075',
    '\u2076',
    '\u2077',
    '\u2078',
    '\u2079'
  ];

  void onPressed() {

    mc.n.value = AddSymbol().add("nm", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    String powerNum = numberUcodes[number];

    if (mc.n.value
        .contains(RegExp(r'(^|\n|[/\u00D7\+\-\(\)\.\d\%])nm($|.*)'))) {
      if (mc.n.value.contains(RegExp(r'[%\)]nm'))) {
        mc.n.value = mc.n.value.replaceAll("nm", "\u00D7$number");
        mc.p.value++;
      } else {
        mc.n.value = mc.n.value.replaceAll("nm", number.toString());
      }
    } else if (mc.n.value.contains("^nm")) {
      mc.n.value = mc.n.value.replaceAll("^nm", powerNum);
      mc.p.value--;
    } else if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+nm'))) {
      List<int> ocb = OCB().ocb(mc.n.value, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        mc.n.value = mc.n.value.replaceAll("nm", "\u00D7$number");
        mc.p.value++;
      } else if (mc.n.value.contains("\u207Enm")) {
        mc.n.value = mc.n.value.replaceAll("nm", "\u02E3$powerNum");
        mc.p.value++;
      } else {
        mc.n.value = mc.n.value.replaceAll("nm", powerNum);
      }
    } else {
      mc.n.value = mc.n.value.replaceAll("nm", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () {
          onPressed();
          },
          isIcon: false,
          text: number.toString(),
          textColour: Color(sc.numbersColor.value),
          textSize: sc.numbersFontSize.value.toDouble(),
        ));
  }
}
