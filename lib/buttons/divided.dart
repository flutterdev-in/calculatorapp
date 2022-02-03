import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/input/controller.dart';

class Divided extends StatelessWidget {
  Divided({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("dv", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(\n|\d|\)|%)dv'))) {
      b.n.value = b.n.value.replaceAll("dv", "/");
    } else if (b.n.value.contains(".dv")) {
      b.n.value = b.n.value.replaceAll("dv", "0/");
      b.p.value++;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*dv')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]dv'))) {
        b.n.value = b.n.value.replaceAll("dv", "\u141F");
      } else if (matchedString.contains('\u22C5dv')) {
        b.n.value = b.n.value.replaceAll("dv", "\u141F");
      } else if (closedBraS == openBraS) {
        b.n.value = b.n.value.replaceAll("dv", "/");
      }
    }
    if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]dv'))) {
      b.n.value = b.n.value.replaceAll("dv", "/");
    } else if (b.n.value.contains('\u22C5dv')) {
      b.n.value = b.n.value.replaceAll("dv", "\u2070/");
      b.p.value++;
    }
    if (b.n.value.contains('dv')) {
      b.n.value = b.n.value.replaceAll("dv", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: "/",
      textColour: Colors.green,
    );
  }
}
