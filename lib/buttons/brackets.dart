import 'package:calculator_04/ac_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Brackets extends StatelessWidget {
  Brackets({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  void onPressed() {
    b.n.value = AddSymbol().add("(", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }
    
    for (var matchedString in regex(r'\.\(')) {
      b.n.value = b.n.value
          .replaceAll(matchedString, matchedString.replaceAll("(", "0\u00D7("));
      b.p.value = b.p.value + 2;
    }
    for (var matchedString in regex(r'\d\(')) {
      b.n.value = b.n.value
          .replaceAll(matchedString, matchedString.replaceAll("(", "\u00D7("));
      b.p.value = b.p.value + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        onPressed();
      },
      child: const Text(
        "( )",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
