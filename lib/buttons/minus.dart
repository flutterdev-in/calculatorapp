import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Minus extends StatelessWidget {
  Minus({Key? key}) : super(key: key);

  void onPressed() {
    mc.n.value = AddSymbol().add("ms", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value.contains(RegExp(r'(^|\n|[\d\(\)%\+\u00D7])ms'))) {
      mc.n.value = mc.n.value.replaceAll("ms", "-");
    } else if (mc.n.value.contains(".ms")) {
      mc.n.value = mc.n.value.replaceAll("ms", "0-");
      mc.p.value++;
    } else if (mc.n.value.contains("^ms")) {
      mc.n.value = mc.n.value.replaceAll("^ms", "\u207B");
      mc.p.value--;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*ms')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ms'))) {
        mc.n.value = mc.n.value.replaceAll("ms", "\u207B");
      } else if (matchedString.contains('\u22C5ms')) {
        mc.n.value = mc.n.value.replaceAll("ms", "\u207B");
      } else if (closedBraS == openBraS) {
        mc.n.value = mc.n.value.replaceAll("ms", "-");
      }
    }
    if (mc.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ms'))) {
      mc.n.value = mc.n.value.replaceAll("ms", "-");
    } else if (mc.n.value.contains('\u22C5ms')) {
      mc.n.value = mc.n.value.replaceAll("ms", "\u2070-");
      mc.p.value++;
    }
    if (mc.n.value.contains('ms')) {
      mc.n.value = mc.n.value.replaceAll("ms", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          iconData: MdiIcons.minus,
          iconColor: Color(sc.operatorsColor.value), // Colors.green,
          iconSize: sc.operatorsIconSize.value.toDouble(),
        ));
  }
}
