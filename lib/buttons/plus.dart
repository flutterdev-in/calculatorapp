import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/controller.dart';

class Plus extends StatelessWidget {
  Plus({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("ps", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(\n|\d|\)|%)ps'))) {
      b.n.value = b.n.value.replaceAll("ps", "+");
    } else if (b.n.value.contains(".ps")) {
      b.n.value = b.n.value.replaceAll("ps", "0+");
      b.p.value++;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*ps')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ps'))) {
        b.n.value = b.n.value.replaceAll("ps", "\u207A");
      } else if (matchedString.contains('\u22C5ps')) {
        b.n.value = b.n.value.replaceAll("ps", "\u207A");
      } else if (closedBraS == openBraS) {
        b.n.value = b.n.value.replaceAll("ps", "+");
      }
    }
    if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ps'))) {
      b.n.value = b.n.value.replaceAll("ps", "+");
    } else if (b.n.value.contains('\u22C5ps')) {
      b.n.value = b.n.value.replaceAll("ps", "\u2070+");
      b.p.value++;
    }
    if (b.n.value.contains('ps')) {
      b.n.value = b.n.value.replaceAll("ps", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: "+",
      textColour: Colors.green,
      textScaleFactor: 4,
      // padding: 0.3,
    );
  }
}
