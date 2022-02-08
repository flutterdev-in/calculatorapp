import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/controller.dart';

class Percentage extends StatelessWidget {
  Percentage({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("pt", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'\d\.pt\D|.*\.pt$'))) {
      b.n.value = b.n.value.replaceAll("pt", "0%");
      b.p.value++;
    } else if (b.n.value.contains(RegExp(r'\)pt|%pt|\Dpt|(\d\.|\d)pt\d'))) {
      b.n.value = b.n.value.replaceAll("pt", "");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(r'\n[\-\+\()]*\d+(\.\d*)?pt'))) {
      b.n.value = b.n.value.replaceAll("pt", "");
      b.p.value--;
    } else if (b.n.value.contains(RegExp(r'\(\d+(\.\d*)?pt'))) {
      b.n.value = b.n.value.replaceAll("pt", "");
      b.p.value--;
    } else {
      b.n.value = b.n.value.replaceAll("pt", "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: "%",
      textColour: Colors.green,
      textScaleFactor: 2.6,
    );
  }
}
