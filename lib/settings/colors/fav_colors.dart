import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/settings/fontsizes/_font_sizes.dart';
import 'package:calculator_04/settings/fontsizes/action_buttons_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/display_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/main_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/numbers_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/operators_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/sub_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/result_table_fontsize.dart';
import 'package:calculator_04/settings/otherImp/bottom_padding.dart';
import 'package:calculator_04/settings/otherImp/comma_position.dart';
import 'package:calculator_04/settings/otherImp/default_precision.dart';
import 'package:calculator_04/settings/otherImp/enter_button_behaviour.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Colours"),
          backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              TableFontSize(),
              DisplayFontSize(),
              SubResultsFontSize(),
              MainResultsFontSize(),
              ActionButtonsFontsize(),
              OperatorsFontsize(),
              NumbersFontsize(),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorsWd extends StatelessWidget {
  const ColorsWd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
          title: Text("Colours"),
          onTap: () {
            Get.to(ColorsScreen(), transition: Transition.leftToRightWithFade);
          }),
    );
  }
}
