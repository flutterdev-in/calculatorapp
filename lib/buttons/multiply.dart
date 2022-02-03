import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/input/controller.dart';

class Multiply extends StatelessWidget {
  Multiply({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("mt", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(\n|\d|\)|%)mt'))) {
      b.n.value = b.n.value.replaceAll("mt", "\u00D7");
    } else if (b.n.value.contains(".mt")) {
      b.n.value = b.n.value.replaceAll("mt", "0\u00D7");
      b.p.value++;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*mt')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]mt'))) {
        b.n.value = b.n.value.replaceAll("mt", "\u02E3");
      } else if (matchedString.contains('\u22C5mt')) {
        b.n.value = b.n.value.replaceAll("mt", "\u02E3");
      } else if (closedBraS == openBraS) {
        b.n.value = b.n.value.replaceAll("mt", "\u00D7");
      }
    }
    if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]mt'))) {
      b.n.value = b.n.value.replaceAll("mt", "\u00D7");
    } else if (b.n.value.contains('\u22C5mt')) {
      b.n.value = b.n.value.replaceAll("mt", "\u2070\u00D7");
      b.p.value++;
    }
    if (b.n.value.contains('mt')) {
      b.n.value = b.n.value.replaceAll("mt", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: MdiIcons.windowClose,
      iconColor: Colors.green,
      iconSize: 40,
      // padding: 0.3,
    );
  }
}
