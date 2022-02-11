import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrecisionB extends StatelessWidget {
  PrecisionB({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  Box bxs = Hive.box("settings");
  void onPressed() {
    r.precision.value++;
    bxs.put("precision", r.precision.value);
  }

  void longPress() {
    r.precision.value--;
    bxs.put("precision", r.precision.value);
  }

  Widget buttons() {
    return Row(
      children: [
        Spacer(flex: 10),
        Icon(MdiIcons.swapHorizontal, color: Colors.white),
        Obx(
          () => Text(" " + r.precision.value.toString(),
              textScaleFactor: 1.3, style: TextStyle(color: Colors.yellow)),
        ),
        Spacer(flex: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      onLongPress: () => longPress(),
      wantChild: true,
      child: buttons(),
      // buttonColor: Colors.white12,
    );
  }
}
