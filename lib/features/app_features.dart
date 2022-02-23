import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/features/hidden_touch_responses.dart';
import 'package:calculator_04/settings/colors/_colors.dart';
import 'package:calculator_04/settings/fontsizes/_font_sizes.dart';
import 'package:calculator_04/settings/spacings/_spacings.dart';
import 'package:calculator_04/settings/otherImp/comma_position.dart';
import 'package:calculator_04/settings/otherImp/darktheme.dart';
import 'package:calculator_04/settings/otherImp/default_precision.dart';
import 'package:calculator_04/settings/otherImp/enter_button_behaviour.dart';
import 'package:calculator_04/settings/otherImp/main_result_position.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppFeatures extends StatelessWidget {
  const AppFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("App feautures"),
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            children: [
              TouchResponseCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturesCard extends StatelessWidget {
  const FeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sc.isThemeDark.value ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("App hidden features"),
          trailing: Icon(
            MdiIcons.magnify,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              AppFeatures(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
