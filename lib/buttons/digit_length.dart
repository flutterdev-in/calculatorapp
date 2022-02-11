import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DigitLength extends StatelessWidget {
  DigitLength({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final Box boxS = Hive.box("settings");

  int grdLength() {
    String grValue = r.gr.value;
    grValue = grValue.replaceAll(RegExp(r'\..*'), "");
    grValue = grValue.replaceAll(",", "");
    return grValue.length+1;
  }

  void onPressed() {
    r.digitLength.value = grdLength();
    if (r.digitLength.value > 1) {
      r.digitLength.value--;
    }
  }

  void doubleTap() {
    r.digitLength.value = grdLength();
    if (r.digitLength.value < 13) {
      r.digitLength.value++;
    }
  }

  void longPress() {
    r.digitLength.value = boxS.get("digitLength");
  }

  Widget icon() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                MdiIcons.arrowExpandHorizontal,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    r.digitLength.value.toString(),
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );

    Column(
      children: [
        Obx(() => Text(
              r.digitLength.value.toString(),
              textScaleFactor: 1,
            )),
        Icon(MdiIcons.arrowExpandHorizontal),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      onDoubleTap: () => doubleTap(),
      wantChild: true,
      child: icon(),
    );
  }
}
