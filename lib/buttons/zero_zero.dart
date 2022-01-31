import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ZeroZero extends StatelessWidget {
  ZeroZero({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());
  String number = "00";
  String powerNum = "\u2070\u2070";
  void onPressed() {
    b.n.value = AddSymbol().add("zz", b.n.value, b.p.value);
    b.p.value = b.p.value + 2;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    for (String matchedString
        in regex(r'(^|\n|\^|[/\u00D7\+\-\(\.\d\%])zz($|.*)')) {
      if (matchedString.contains(RegExp(r'(^|\n|\^)zz'))) {
        b.n.value = b.n.value
            .replaceAll(matchedString, matchedString.replaceAll("zz", ""));
        b.p.value--;
      } else if (matchedString.contains("%zz")) {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("zz", "\u00D7$number"));
        b.p.value++;
      } else {
        b.n.value = b.n.value
            .replaceAll(matchedString, matchedString.replaceAll("zz", number));
      }
    }
    for (String matchedString in regex(
        r'(\^|[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+)zz($|[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+)')) {
      List<int> ocb = OCB().ocb(matchedString, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("zz", "\u00D7$number"));
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("^zz", powerNum));
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("zz", powerNum));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        number,
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
