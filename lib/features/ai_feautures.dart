import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AIfeaturesPage extends StatelessWidget {
  const AIfeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("AI feautures"),
        ),
        body: ListView(
          children: [
            iconCard(
              icon: Text("Results"),
              iconFlex: 2,
              text:
                  "Results will show while typing.\nNo need to press equal button for results.",
            ),
            iconCard(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MdiIcons.chevronUp,
                  ),
                  Text(
                    "10^",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              text: "Put ^ for numbers and put x10^ for operators.",
            ),
            iconCard(
              iconData: MdiIcons.circleSmall,
              text: "Put . if left was number, otherwise put 0.",
            ),
            iconCard(
              icon: Text(")"),
              iconFlex: 1,
              text: "Auto closes remaining brackets if enter new line.",
            ),
            iconCard(
              iconData: MdiIcons.blockHelper,
              text:
                  "Won't respond for invalid operations like\n-+, x/, /x, (x, (/, )%, x%, /%, %x etc.",
            ),
            iconCard(
              iconData: MdiIcons.currencyUsd,
              text:
                  "Auto detect comma seperation as per your country format,\nfor large results\nBillions displayed as x10\u2079 and\nCrores displayed as x10\u2077",
            ),
          ],
        ),
      ),
    );
  }
}

class AIfeaturesCard extends StatelessWidget {
  const AIfeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("AI features"),
          leading: Icon(
            MdiIcons.listStatus,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              AIfeaturesPage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
