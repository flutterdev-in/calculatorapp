import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TouchResponse extends StatelessWidget {
  const TouchResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sc.isEnterLine.value = sbox.get("isEnterLine") ?? true;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            iconCard(
              iconData: MdiIcons.playlistPlus,
              text:
                  "On tap : Input will go to next line (each line added by + symbol by default if not specified.\nLong press : 1) Clear input from display, 2) Paste main result as input in display & 3) Save input to 'Recycle bin'.",
            ),
            iconCard(
              iconData: MdiIcons.closeCircleMultipleOutline,
              text:
                  "On tap : 1) Clear input from display & 2) save input in 'Recycle bin'\nLong press : 1) Clear input from display & 2) Save input in 'Favorites'.",
            ),
            iconCard(
              iconData: Icons.backspace_outlined,
              text:
                  "On tap : Delete one left letter to the cursor\nLong press : 1) Clear input from display & 2) Won't save input in history",
            ),
            iconCard(
              iconData: Icons.history,
              text:
                  "On tap : Delete one left letter to the cursor\nLong press : 1) Clear input from display & 2) Won't save input in history",
            ),
          ],
        ),
      ),
    );
  }
}

Widget iconCard(
    {IconData? iconData, String? text, Widget? icon, Widget? textw}) {
  return Card(
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon ??
              Expanded(
                flex: 1,
                child: Align(
                  child: Icon(iconData),
                ),
              ),
          Container(
            color: Get.isDarkMode ? Colors.black : Colors.white,
            width: 2,
          ),
          textw ??
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: ParsedText(
                      textScaleFactor: 1.2,
                      text: text ?? "",
                      softWrap: true,
                      parse: <MatchText>[
                        MatchText(
                          pattern: r"On tap : ",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        MatchText(
                          pattern: r"Long press : ",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}

class TouchResponseCard extends StatelessWidget {
  const TouchResponseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sc.isThemeDark.value ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("Buttons touch features"),
          trailing: Icon(
            MdiIcons.gestureDoubleTap,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              TouchResponse(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
