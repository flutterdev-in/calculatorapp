import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TableFeaturesPage extends StatelessWidget {
  const TableFeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History feautures"),
        ),
        body: ListView(
          children: [
            iconCard(
              icon: Text("Sl No\nColumn"),
              iconFlex: 2,
              text: "Shows line number.",
            ),
            iconCard(
              icon: Text("Input\nColumn"),
              iconFlex: 2,
              text: "Shows original input value of each line.",
            ),
            iconCard(
              icon: Text("Result\nColumn"),
              iconFlex: 2,
              text: "Shows result value of the corresponding line.",
            ),
            iconCard(
              icon: Text(
                "*",
                textScaleFactor: 2,
              ),
              iconFlex: 1,
              text:
                  "If no operations in any of the lines, then input column will be hided, since it is not required as there is no operations.",
            ),
            iconCard(
              icon: Text(
                "**",
                textScaleFactor: 2,
              ),
              iconFlex: 1,
              text: "You can access result table for history items also.",
            ),
          ],
        ),
      ),
    );
  }
}

class TableFeaturesCard extends StatelessWidget {
  const TableFeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Table features"),
          leading: Icon(
            MdiIcons.tableArrowRight,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              TableFeaturesPage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
