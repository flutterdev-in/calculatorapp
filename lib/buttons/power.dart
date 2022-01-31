import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Power extends StatelessWidget {
  Power({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  void onPressed() {
    b.n.value = AddSymbol().add("pw", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'\d\.pw'))) {
      b.n.value = b.n.value.replaceAll("pw", "0^");
      b.p.value++;
    } else if (b.n.value.contains(RegExp(r'(^|\n|[/\*\+\-\(])pw'))) {
      b.n.value = b.n.value.replaceAll("pw", "10^");
      b.p.value = b.p.value + 2;
    } else if (b.n.value.contains(RegExp(r'\dpw'))) {
      b.n.value = b.n.value.replaceAll("pw", "^");
    } else if (b.n.value.contains(")pw")) {
      b.n.value = b.n.value.replaceAll("pw", "^");
    } else {
      b.n.value = b.n.value.replaceAll("pw", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.chevronUp,
            color: Colors.black,
            size: 27,
          ),
          Text(
            "10^",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
