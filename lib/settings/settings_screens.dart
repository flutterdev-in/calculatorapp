import 'package:calculator_04/settings/colors/_colors.dart';
import 'package:calculator_04/settings/fontsizes/_font_sizes.dart';
import 'package:calculator_04/settings/otherImp/bottom_padding.dart';
import 'package:calculator_04/settings/otherImp/comma_position.dart';
import 'package:calculator_04/settings/otherImp/default_precision.dart';
import 'package:calculator_04/settings/otherImp/enter_button_behaviour.dart';
import 'package:calculator_04/settings/otherImp/main_result_position.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          // backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            children: [
              FontSizes(),
              ColorsCard(),
              MainResultPosition(),
              EnterButtonBehavior(),
              CommaPosition(),
              DefaultPrecision(),
              BottonPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
