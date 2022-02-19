import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Plus extends StatelessWidget {
  Plus({Key? key}) : super(key: key);

  void onPressed() {
    mc.n.value = AddSymbol().add("ps", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value.contains(RegExp(r'(\n|\d|\)|%)ps'))) {
      mc.n.value = mc.n.value.replaceAll("ps", "+");
    } else if (mc.n.value.contains(".ps")) {
      mc.n.value = mc.n.value.replaceAll("ps", "0+");
      mc.p.value++;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*ps')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ps'))) {
        mc.n.value = mc.n.value.replaceAll("ps", "\u207A");
      } else if (matchedString.contains('\u22C5ps')) {
        mc.n.value = mc.n.value.replaceAll("ps", "\u207A");
      } else if (closedBraS == openBraS) {
        mc.n.value = mc.n.value.replaceAll("ps", "+");
      }
    }
    if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ps'))) {
      mc.n.value = mc.n.value.replaceAll("ps", "+");
    } else if (mc.n.value.contains('\u22C5ps')) {
      mc.n.value = mc.n.value.replaceAll("ps", "\u2070+");
      mc.p.value++;
    }
    if (mc.n.value.contains('ps')) {
      mc.n.value = mc.n.value.replaceAll("ps", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          isIcon: false,
          text: "+",
          textColour: Color(sc.operatorsColor.value), // Colors.green,
          textSize: sc.operatorsIconSize.value.toDouble(),
        ));
  }
}
