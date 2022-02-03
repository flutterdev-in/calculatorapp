
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/input/controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: Icons.backspace_outlined,
      iconColor: Colors.teal,
    );
  }
}
