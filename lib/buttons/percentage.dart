import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Percentage extends StatelessWidget {
  Percentage({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  void onPressed() {
    b.n.value = AddSymbol().add("%", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'\d\.%\D|.*\.%$'))) {
      b.n.value = b.n.value.replaceAll("%", "0%");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(r'\D%|(\d\.|\d)%\d'))) {
      b.n.value = b.n.value.replaceAll("%", "");
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
        "%",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
