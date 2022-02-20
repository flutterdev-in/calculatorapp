import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    return rc.commaSymbol.value == ","
        ? Icon(MdiIcons.comma,
            size: sc.operatorsIconSize.value.toDouble() - 24,
            color: rc.isPrimaryComma.value
                ? Color(sc.actionButtonsColor.value)
                : Color(sc.numbersColor.value))
        : Text(
            "'",
            style: TextStyle(
                fontSize: sc.operatorsIconSize.value.toDouble() - 3,
                color: rc.isPrimaryComma.value
                    ? Color(sc.actionButtonsColor.value)
                    : Color(sc.numbersColor.value)),
          );
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
