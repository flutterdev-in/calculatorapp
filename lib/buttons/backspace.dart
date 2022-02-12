import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackSpace extends StatelessWidget {
  BackSpace({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  void onPressed() {
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
  }

  void doubleTap() {
    if (b.p.value >= b.n.value.length && b.n.value.contains(RegExp(r'\d+(\.\d*)?$'))) {
      b.n.value = b.n.value.replaceAll(RegExp(r'\d+(\.\d*)?$'), "");
      b.p.value = b.n.value.length;
    } else {
      onPressed();
    }
  }

  void onLongPressed() {
    b.n.value = "";
    b.p.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      // onDoubleTap: () => doubleTap(),
      onLongPress: () => onLongPressed(),
      iconData: Icons.backspace_outlined,
      iconColor: Colors.brown,
      iconSize: 24,
      // buttonColor: Colors.white12,
    );
  }
}
