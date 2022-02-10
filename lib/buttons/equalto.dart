import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/resultTypes/final_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controller/main_controller.dart';

class Equalto extends StatelessWidget {
  Equalto({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void doubleTap() {
    b.n.value = FR().finalMainResult(b.n.value);
    b.n.value = b.n.value.replaceAll(",", "");
    if (b.n.value.contains("x10")) {
      b.n.value = b.n.value
          .replaceAll("x", "\u00D7")
          .replaceAll(",", "")
          .replaceAll(" ", "");
    }
    b.p.value = b.n.value.length;
  }

  void onPressed() {
    if (b.n.value.isNotEmpty) {
      String lastS = b.n.value.split('').last;
      if (lastS.contains(RegExp(r'[/\n\+\-\u00D7]'))) {
        String subN = b.n.value.replaceAll(RegExp(r'[/\n\+\-\u00D7]$'), "");
        String subS = FR().finalMainResult(subN);
        subS = subS.replaceAll(",", "");
        if (subS.contains("x10")) {
          subS = subS
              .replaceAll("x", "\u00D7")
              .replaceAll(",", "")
              .replaceAll(" ", "");
        }
        b.n.value = b.n.value + subS;
        b.p.value = b.n.value.length;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      onDoubleTap: () => doubleTap(),
      iconData: MdiIcons.equal,
      iconColor: Colors.brown,
    );
  }
}
