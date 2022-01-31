import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Minus extends StatelessWidget {
  Minus({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  void onPressed() {
    b.n.value = AddSymbol().add("ms", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(^|\n|\d|\(|\)|%)ms'))) {
      b.n.value = b.n.value.replaceAll("ms", "-");
    } else if (b.n.value.contains(".ms")) {
      b.n.value = b.n.value.replaceAll("ms", "0-");
      b.p.value++;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*ms')) {
      int openBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = OCB().ocb(matchedString, '\u207D', '\u207E')[1];
      if (matchedString.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ms'))) {
        b.n.value = b.n.value.replaceAll("ms", "\u207B");
      } else if (matchedString.contains('\u22C5ms')) {
        b.n.value = b.n.value.replaceAll("ms", "\u207B");
      } else if (closedBraS == openBraS) {
        b.n.value = b.n.value.replaceAll("ms", "-");
      }
    }
    if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]ms'))) {
      b.n.value = b.n.value.replaceAll("ms", "-");
    } else if (b.n.value.contains('\u22C5ms')) {
      b.n.value = b.n.value.replaceAll("ms", "\u2070-");
      b.p.value++;
    }
    if (b.n.value.contains('ms')) {
      b.n.value = b.n.value.replaceAll("ms", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        onPressed();
      },
      child: const Text(
        "-",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
