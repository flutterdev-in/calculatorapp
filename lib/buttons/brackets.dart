import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Brackets extends StatelessWidget {
  Brackets({Key? key}) : super(key: key);

  List<int> ocb(String toSplit, String openBra, String closedBra) {
    String leftString = toSplit.split("bk").first;
    int openBra0 = 0;
    int closedBra0 = 0;
    for (String i in leftString.split('')) {
      if (i == openBra) {
        openBra0++;
      }
      if (i == closedBra) {
        closedBra0++;
      }
    }
    return [openBra0, closedBra0];
  }

  void onPressed() {
    mc.n.value = AddSymbol().add("bk", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value.contains(RegExp(r'(^|\n)bk'))) {
      mc.n.value = mc.n.value.replaceAll("bk", "(");
    } else if (mc.n.value.contains('^bk')) {
      mc.n.value = mc.n.value.replaceAll("^bk", "\u207D");
      mc.p.value--;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*bk')) {
      int openBraS = ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = ocb(matchedString, '\u207D', '\u207E')[1];

      if (closedBraS == openBraS) {
        int openBraG = ocb(mc.n.value, '(', ')')[0];
        int closedBraG = ocb(mc.n.value, '(', ')')[1];
        if (closedBraG < openBraG) {
          mc.n.value = mc.n.value.replaceAll("bk", ")");
        } else {
          mc.n.value = mc.n.value.replaceAll("bk", "\u00D7(");
          mc.p.value++;
        }
      } else if (matchedString
          .contains(RegExp(r'[\u207A\u207B\u02E3\u141F\u207D]bk'))) {
        mc.n.value = mc.n.value.replaceAll("bk", "\u207D");
        mc.p.value++;
      } else if (closedBraS < openBraS) {
        if (mc.n.value
            .contains(RegExp(r'[\u207A\u207B\u02E3\u141F\u207D]bk'))) {
          mc.n.value = mc.n.value.replaceAll("bk", "\u207E");
        } else if (mc.n.value.contains("\u22C5bk")) {
          mc.n.value = mc.n.value.replaceAll("bk", "\u2070\u207E");
        }
        mc.n.value = mc.n.value.replaceAll("bk", "\u207E");
        mc.p.value++;
      } else {
        mc.n.value = mc.n.value.replaceAll("bk", "\u02E3\u207D");
        mc.p.value++;
      }
    }

    if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]bk'))) {
      int openBra = ocb(mc.n.value, '(', ')')[0];
      int closedBra = ocb(mc.n.value, '(', ')')[1];
      if (closedBra < openBra) {
        mc.n.value = mc.n.value.replaceAll("bk", ")");
      } else {
        mc.n.value = mc.n.value.replaceAll("bk", "\u00D7(");
        mc.p.value++;
      }
    } else if (mc.n.value.contains('\u22C5bk')) {
      int openBra = ocb(mc.n.value, '(', ')')[0];
      int closedBra = ocb(mc.n.value, '(', ')')[1];
      if (closedBra < openBra) {
        mc.n.value = mc.n.value.replaceAll("bk", "\u2070)");
        mc.p.value++;
      } else {
        mc.n.value = mc.n.value.replaceAll("bk", "\u2070\u00D7(");
        mc.p.value = mc.p.value + 2;
      }
    }
    if (!mc.n.value.contains('(')) {
      if (mc.n.value.contains(RegExp(r'[\d%]bk'))) {
        mc.n.value = mc.n.value.replaceAll("bk", "\u00D7(");
        mc.p.value++;
      } else if (mc.n.value.contains(".bk")) {
        mc.n.value = mc.n.value.replaceAll("bk", "0\u00D7(");
        mc.p.value = mc.p.value + 2;
      } else {
        mc.n.value = mc.n.value.replaceAll("bk", "(");
      }
    } else if (mc.n.value.contains('(')) {
      int openBra = ocb(mc.n.value, '(', ')')[0];
      int closedBra = ocb(mc.n.value, '(', ')')[1];
      if (mc.n.value.contains(RegExp(r'[\(\+\-\u00D7/]bk'))) {
        mc.n.value = mc.n.value.replaceAll("bk", "(");
      } else if (closedBra == openBra && mc.n.value.contains(")bk")) {
        mc.n.value = mc.n.value.replaceAll("bk", "\u00D7(");
        mc.p.value++;
      } else if (closedBra < openBra) {
        if (mc.n.value.contains(".bk")) {
          mc.n.value = mc.n.value.replaceAll("bk", "0)");
          mc.p.value++;
        } else {
          mc.n.value = mc.n.value.replaceAll("bk", ")");
        }
      } else {
        mc.n.value = mc.n.value.replaceAll("bk", "\u00D7(");
        mc.p.value++;
      }
    }
    if (mc.n.value.contains('bk')) {
      mc.n.value = mc.n.value.replaceAll("bk", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          iconData: Icons.backspace_outlined,
          isIcon: false,
          text: "( )",
          textSize: sc.operatorsIconSize.value.toDouble() - 15,
          textColour: Color(sc.operatorsColor.value),
        ));
  }
}
