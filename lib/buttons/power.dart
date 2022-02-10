import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controller/main_controller.dart';

class Power extends StatelessWidget {
  Power({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("pw", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'\d\.pw'))) {
      b.n.value = b.n.value.replaceAll("pw", "0^");
      b.p.value++;
    } else if (b.n.value.contains(RegExp(r'(^|\n|[/\u00D7\+\-\(])pw'))) {
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
    double mw = MediaQuery.of(context).size.width;
    return GFButtonC.all(
      ontap: () => onPressed(),
      wantChild: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MdiIcons.chevronUp,
            color: Colors.green,
            size: 28,
          ),
          Text(
            "10^",
            textScaleFactor: 1.5,
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
