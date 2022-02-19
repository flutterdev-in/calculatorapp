import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Dot extends StatelessWidget {
  Dot({Key? key}) : super(key: key);

  void onPressed() {
    mc.n.value = AddSymbol().add("dt", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value.contains(RegExp(r'\.\d*dt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", "");
      mc.p.value--;
    } else if (mc.n.value.contains(RegExp(r'\ddt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", ".");
    } else if (mc.n.value.contains(RegExp(r'(^|\n|[/\-\+\(\u00D7])dt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", "0.");
      mc.p.value++;
    } else if (mc.n.value.contains(')dt')) {
      mc.n.value = mc.n.value.replaceAll("dt", "\u00D70.");
      mc.p.value = mc.p.value + 2;
    } else if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]dt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", "\u22C5");
    } else if (mc.n.value
        .contains(RegExp(r'[u207A\u207B\u02E3\u141F\u207D]dt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", "\u2070\u22C5");
      mc.p.value++;
    } else if (mc.n.value.contains(RegExp(r'\u22C5dt'))) {
      mc.n.value = mc.n.value.replaceAll("dt", "");
      mc.p.value--;
    } else if (mc.n.value.contains('^dt')) {
      mc.n.value = mc.n.value.replaceAll("^dt", "\u2070\u22C5");
      mc.p.value++;
    }
    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*bk')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (closedBraS == openBraS && openBraS != 0) {
        mc.n.value = mc.n.value.replaceAll("dt", "\u00D70.");
        mc.p.value = mc.p.value + 2;
      }
    }
    if (mc.n.value.contains('dt')) {
      mc.n.value = mc.n.value.replaceAll("dt", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          iconData: Icons.circle_rounded,
          iconColor: Color(sc.numbersColor.value),
          iconSize: sc.numbersFontSize.value.toDouble() - 18,
        ));
  }
}
