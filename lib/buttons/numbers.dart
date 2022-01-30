import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Numbers extends StatelessWidget {
  Numbers({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());
  late int number;
  Numbers.select(this.number);
  List<String> numberUcodes = [
    "\u2070",
    "\u00B9",
    '\u00B2',
    '\u00B3',
    '\u2074',
    '\u2075',
    '\u2076',
    '\u2077',
    '\u2078',
    '\u2079'
  ];

  void onPressed() {
    b.n.value = AddSymbol().add("nm", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    String powerNum = numberUcodes[number];

    for (String matchedString
        in regex(r'(^|\n|[/\u00D7\+\-\(\.\d\%])nm($|.*)')) {
      if (matchedString.contains("%nm")) {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("nm", "\u00D7$number"));
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("nm", number.toString()));
      }
    }
    for (String matchedString in regex(
        r'(\^|[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+)nm($|[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+)')) {
      List<int> ocb = OCB().ocb(matchedString, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("nm", "\u00D7$number"));
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("^nm", powerNum));
        b.n.value = b.n.value.replaceAll(
            matchedString, matchedString.replaceAll("nm", powerNum));
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
        number.toString(),
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
