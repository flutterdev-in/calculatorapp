import 'package:calculator_04/_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Clear extends StatelessWidget {
  Clear({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        b.n.value = "";
        b.p.value = 0;
      },
      child: const Text(
        "C",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
