import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/settings/settings_screens.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controller/main_controller.dart';

class Dot extends StatelessWidget {
  Dot({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("dt", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'\.\d*dt'))) {
      b.n.value = b.n.value.replaceAll("dt", "");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(r'\ddt'))) {
      b.n.value = b.n.value.replaceAll("dt", ".");
    } else if (b.n.value.contains(RegExp(r'(^|\n|[/\-\+\(\u00D7])dt'))) {
      b.n.value = b.n.value.replaceAll("dt", "0.");
      b.p.value++;
    } else if (b.n.value.contains(')dt')) {
      b.n.value = b.n.value.replaceAll("dt", "\u00D70.");
      b.p.value = b.p.value + 2;
    } else if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]dt'))) {
      b.n.value = b.n.value.replaceAll("dt", "\u22C5");
    } else if (b.n.value
        .contains(RegExp(r'[u207A\u207B\u02E3\u141F\u207D]dt'))) {
      b.n.value = b.n.value.replaceAll("dt", "\u2070\u22C5");
      b.p.value++;
    } else if (b.n.value.contains(RegExp(r'\u22C5dt'))) {
      b.n.value = b.n.value.replaceAll("dt", "");
      b.p.value--;
    } else if (b.n.value.contains('^dt')) {
      b.n.value = b.n.value.replaceAll("^dt", "\u2070\u22C5");
      b.p.value++;
    }
    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*bk')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (closedBraS == openBraS && openBraS != 0) {
        b.n.value = b.n.value.replaceAll("dt", "\u00D70.");
        b.p.value = b.p.value + 2;
      }
    }
    if (b.n.value.contains('dt')) {
      b.n.value = b.n.value.replaceAll("dt", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: Icons.circle_rounded,
      iconSize: 8,
    );
  }
}

