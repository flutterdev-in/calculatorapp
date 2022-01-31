import 'package:calculator_04/_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class BackSpace extends StatelessWidget {
  BackSpace({Key? key}) : super(key: key);
  final ButtonsController b = Get.put(ButtonsController());

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        if (b.n.value.isEmpty || b.p.value == 0) {
          b.n.value = b.n.value;
        } else if (b.p.value >= b.n.value.length) {
          b.n.value = b.n.value.substring(0, b.n.value.length - 1);
          b.p.value--;
        } else {
          b.n.value = b.n.value.substring(0, b.p.value - 1) +
              b.n.value.substring(b.p.value);
          b.p.value--;
        }
      },
      child: Icon(
        Icons.backspace_outlined,
        size: 25,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }
}
