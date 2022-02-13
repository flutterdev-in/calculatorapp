import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => Get.to(
        SettingsScreen(),
        opaque: false,
        transition: Transition.zoom,
      ),
      iconData: MdiIcons.cog,
      iconSize: 20,
      iconColor: Colors.brown,
    );
  }
}
