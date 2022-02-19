import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () {
            Get.to(
              const SettingsScreen(),
              opaque: false,
              transition: Transition.leftToRightWithFade,
            );
          },
          iconData: MdiIcons.cog,
          iconSize: sc.actionButtonsIconSize.value.toDouble(),
          iconColor: Color(sc.actionButtonsColor.value), //  Colors.brown,
        ));
  }
}
