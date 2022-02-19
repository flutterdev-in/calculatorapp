import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comma extends StatelessWidget {
  const Comma({Key? key}) : super(key: key);

  void onPressed() {
    var primaryCommaPosition = sbox.get(bm.primaryCommaPosition) ?? 33;
    var secondaryCommaPosition = sbox.get(bm.secondaryCommaPosition) ?? 0;
    if (rc.isPrimaryComma.value) {
      rc.nf.value = secondaryCommaPosition;
    } else {
      rc.nf.value = primaryCommaPosition;
    }
    rc.isPrimaryComma.value = !rc.isPrimaryComma.value;
  }

  Widget icon() {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Text(
                ",",
                style: TextStyle(
                    fontSize: sc.operatorsIconSize.value.toDouble(),
                    color: rc.isPrimaryComma.value
                        ? Color(sc.actionButtonsColor.value)
                        : Color(sc.numbersColor.value)),
              ),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => onPressed(),
          wantChild: true,
          child: icon(),
        ));
  }
}
