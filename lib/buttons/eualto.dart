import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/result/final_result.dart';
import 'package:calculator_04/sub_scripts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Equalto extends StatelessWidget {
  Equalto({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        b.n.value = FR().finalMainResult(b.n.value);
        b.n.value = b.n.value.replaceAll(",", "");
        if (b.n.value.contains("x10")) {
          b.n.value = b.n.value
              .replaceAll("x", "\u00D7")
              .replaceAll(",", "")
              .replaceAll(" ", "");
        }

        b.p.value = b.n.value.length;
      },
      child: const Text(
        "=",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
