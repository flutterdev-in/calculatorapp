import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Percentage extends StatelessWidget {
  Percentage({Key? key}) : super(key: key);

  void onPressed() {
    mc.n.value = AddSymbol().add("pt", mc.n.value, mc.p.value);
    mc.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, mc.n.value);
    }

    if (mc.n.value == "pt") {
      mc.n.value = mc.n.value.replaceAll("pt", "");
      mc.p.value = 0;
    }

    if (mc.n.value.contains(RegExp(r'\d\.pt\D|.*\.pt$'))) {
      mc.n.value = mc.n.value.replaceAll("pt", "0%");
      mc.p.value++;
    } else if (mc.n.value.contains(RegExp(r'\)pt|%pt|\Dpt|(\d\.|\d)pt\d'))) {
      mc.n.value = mc.n.value.replaceAll("pt", "");
      mc.p.value--;
    }
    //  else if (b.n.value.contains(RegExp(r'\n[\-\+\()]*\d+(\.\d*)?pt'))) {
    //   b.n.value = b.n.value.replaceAll("pt", "");
    //   b.p.value--;
    // }
    else if (mc.n.value.contains(RegExp(r'\(\d+(\.\d*)?pt'))) {
      mc.n.value = mc.n.value.replaceAll("pt", "");
      mc.p.value--;
    } else {
      mc.n.value = mc.n.value.replaceAll("pt", "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          isIcon: false,
          text: "%",
          textColour: Color(sc.operatorsColor.value), // Colors.green,
          textSize: sc.operatorsIconSize.value.toDouble() - 14 > 1
              ? sc.operatorsIconSize.value.toDouble() - 14
              : 1,
        ));
  }
}
