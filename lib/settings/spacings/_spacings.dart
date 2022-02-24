import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/settings/colors/temp_home_page.dart';
import 'package:calculator_04/settings/fontsizes/action_buttons_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/display_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/main_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/numbers_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/operators_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/sub_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/result_table_fontsize.dart';
import 'package:calculator_04/settings/spacings/bottom_padding.dart';
import 'package:calculator_04/settings/spacings/buttons_radius.dart';
import 'package:calculator_04/settings/spacings/buttons_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SpacingsScreen extends StatelessWidget {
  const SpacingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Spacings"),
          // backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            children: [
              ButtonsSpacing(),
              ButtonsRadius(),
              BottonPadding(),
            ],
          ),
        ),
      ),
    );
  }
}

class Spacings extends StatelessWidget {
  const Spacings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sc.isThemeDark.value ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Spacings"),
          onTap: () {
            
            Get.to(
              SpacingsScreen(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
