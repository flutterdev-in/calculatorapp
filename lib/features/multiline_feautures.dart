import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MultiLineFeaturesPage extends StatelessWidget {
  const MultiLineFeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Multiline feautures"),
        ),
        body: ListView(
          children: [
            iconCard(
              iconData: MdiIcons.playlistPlus,
              text:
                  "Press this button to go to next line.\nVery usefult for vertical operations. Example : Adding prices in grocery store, Quatity and rate multiplications for multiple items etc",
            ),
            iconCard(
              icon: Text("+"),
              iconFlex: 1,
              text: "Each line will be added by + by default.",
            ),
            iconCard(
              icon: Text("-"),
              iconFlex: 1,
              text: "You can use minus - at starting of the line.",
            ),
            iconCard(
              icon: Text("x /"),
              iconFlex: 1,
              text:
                  "if you use multiply x or devided / at starting of line then this line it will become your last line. And this line will be operated to the combined result of your previous lines.",
            ),
            iconCard(
              icon: Text("%"),
              iconFlex: 1,
              text:
                  "If you use % for starting number of line, then this line it will become your last line. And this line will be operated to the combined result of your previous lines.",
            ),
            iconCard(
              icon: Text("No line"),
              iconFlex: 2,
              text:
                  "Using line is optional, you can do multiple operations without line also.  But for better experience using line is recommended.",
            ),
          ],
        ),
      ),
    );
  }
}

class MultiLineFeaturesCard extends StatelessWidget {
  const MultiLineFeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Multiline features"),
          leading: Icon(
            MdiIcons.playlistPlus,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              MultiLineFeaturesPage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
