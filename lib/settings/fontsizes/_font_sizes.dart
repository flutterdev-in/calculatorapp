import 'package:calculator_04/settings/fontsizes/action_buttons_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/display_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/main_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/numbers_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/operators_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/sub_results_fontsize.dart';
import 'package:calculator_04/settings/fontsizes/result_table_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FontSizesScreen extends StatelessWidget {
  const FontSizesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Font sizes"),
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

class FontSizes extends StatelessWidget {
  const FontSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
          title: Text("Font sizes"),
          onTap: () {
            Get.to(FontSizesScreen(),
                transition: Transition.leftToRightWithFade);
          }),
    );
  }
}
