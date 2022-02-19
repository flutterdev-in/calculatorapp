import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackSpace extends StatelessWidget {
  BackSpace({Key? key}) : super(key: key);

  void onPressed() {
    if (mc.n.value.isEmpty || mc.p.value == 0) {
      mc.n.value = mc.n.value;
    } else if (mc.p.value >= mc.n.value.length) {
      mc.n.value = mc.n.value.substring(0, mc.n.value.length - 1);
      mc.p.value--;
    } else {
      mc.n.value = mc.n.value.substring(0, mc.p.value - 1) +
          mc.n.value.substring(mc.p.value);
      mc.p.value--;
    }
  }

  void doubleTap() {
    if (mc.p.value >= mc.n.value.length &&
        mc.n.value.contains(RegExp(r'\d+(\.\d*)?$'))) {
      mc.n.value = mc.n.value.replaceAll(RegExp(r'\d+(\.\d*)?$'), "");
      mc.p.value = mc.n.value.length;
    } else {
      onPressed();
    }
  }

  void onLongPressed() {
    mc.n.value = "";
    mc.p.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          onLongPress: () => onLongPressed(),
          iconData: Icons.backspace_outlined,
          iconColor:Color(sc.actionButtonsColor.value) ,
          iconSize: sc.actionButtonsIconSize.value.toDouble(),
        ));
  }
}
