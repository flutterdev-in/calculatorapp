import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonsResponsePage extends StatelessWidget {
  const ButtonsResponsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Buttons responses"),
        ),
        body: ListView(
          children: [
            iconCard(
              icon: Text("Results"),
              iconFlex: 2,
              text: "On tap : Paste result value next to the input cursor.",
            ),
            iconCard(
              iconData: MdiIcons.closeCircleMultipleOutline,
              text:
                  "On tap : 1) Clear input from display.\n2) save input in 'Recycle bin'.\nLong press : 1) Clear input from display.\n2) Save input in 'Favourites'.",
            ),
            iconCard(
              icon: Text(
                "\uFE50",
                textScaleFactor: 2.5,
              ),
              text: "On tap : Comma enable / disable for results.",
            ),
            iconCard(
              iconData: Icons.history,
              text:
                  "On tap : Opens history of Recycle bin / Favourites.\nLong press : Save input in 'Recycle bin' without clearing input from display.",
            ),
            iconCard(
              iconData: Icons.backspace_outlined,
              text:
                  "On tap : Delete one left letter to the cursor.\nLong press : 1) Clear input from display.\n2) Won't save input in history.",
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
              text:
                  "1) Put ^ for numbers and put x10^ for operators.\n2) Power operations are allowed inside brackets.",
            ),
            iconCard(
              iconData: MdiIcons.playlistPlus,
              text:
                  "On tap : 1) Input will go to next line (each line added by + symbol by default if not specified).\n2) Unclosed brackets of the line will automatically closes.\nLong press : 1) Clear input from display.\n2) Paste main result as input in display.\n3) Save input in 'Recycle bin'.",
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsResponseCard extends StatelessWidget {
  const ButtonsResponseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Buttons responses"),
          leading: Icon(
            MdiIcons.gestureDoubleTap,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              ButtonsResponsePage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
