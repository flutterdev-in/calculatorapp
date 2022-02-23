import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Power extends StatelessWidget {
  Power({Key? key}) : super(key: key);

  void onPressed() {
    mc.n.value = AddSymbol().add("pw", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value.contains(RegExp(r'\d\.pw'))) {
      mc.n.value = mc.n.value.replaceAll("pw", "0^");
      mc.p.value++;
    } else if (mc.n.value.contains(RegExp(r'(^|\n|[/\u00D7\+\-\(])pw'))) {
      mc.n.value = mc.n.value.replaceAll("pw", "10^");
      mc.p.value = mc.p.value + 2;
    } else if (mc.n.value.contains(RegExp(r'\dpw'))) {
      mc.n.value = mc.n.value.replaceAll("pw", "^");
    } else if (mc.n.value.contains(")pw")) {
      mc.n.value = mc.n.value.replaceAll("pw", "^");
    } else {
      mc.n.value = mc.n.value.replaceAll("pw", "");
      mc.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          wantChild: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.chevronUp,
                color: Color(sc.operatorsColor.value), // Colors.green,
                size: sc.operatorsIconSize.value.toDouble() - 15 > 1
                    ? sc.operatorsIconSize.value.toDouble() - 15
                    : 1,
              ),
              Text(
                "10^",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(
                    sc.operatorsColor.value,
                  ),
                  fontSize: sc.operatorsIconSize.value.toDouble() - 24 > 1
                      ? sc.operatorsIconSize.value.toDouble() - 24
                      : 1,
                ),
              ),
            ],
          ),
        ));
  }
}
