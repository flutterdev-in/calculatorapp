import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryFeaturesPage extends StatelessWidget {
  const HistoryFeaturesPage({Key? key}) : super(key: key);

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
              iconData: Icons.history,
              text:
                  "On tap : Opens history of Recycle bin / Favourites as decided by last item saved.\nLong press : Save input in 'Recycle bin' without clearing input from display.",
            ),
            iconCard(
              iconData: Icons.favorite_border_outlined,
              // iconFlex: 2,
              text:
                  "'Recycle bin' icon\nIf Recycle bin exceed 100 items, then older entry will be deleted.",
            ),
            iconCard(
              iconData: Icons.favorite,
              text: "'Favourites' icon\nUnrestricted.",
            ),
            iconCard(
              iconData: MdiIcons.tableArrowRight,
              text: "On tap : Shows result table of the item.",
            ),
            iconCard(
              icon: Text("Swipe\nactions"),
              iconFlex: 2,
              text:
                  "Swipe right : Move item to 'Favourites' / 'Recycle bin'\nSwipe left : Delete item from 'Favourites' / 'Recycle bin'.",
            ),
            iconCard(
              icon: Text("On Tap\nactions"),
              iconFlex: 2,
              text:
                  "1) Tap on 'input text' will clear display and paste this input.\n2) Tap on 'result' will not clear display but paste this result next to the cursor postition.",
            ),
            iconCard(
              icon: Text("Sorting"),
              iconFlex: 2,
              text: "History will be sorted by latest entry.",
            ),
            iconCard(
              icon: Text("Time\nstamp"),
              iconFlex: 2,
              text:
                  "1) Time stamp of the item will be taken at the time of saving.\n2) Time stamp of the item will not change if you move item to 'Favourites' / 'Recycle bin'",
            ),
            iconCard(
              icon: Text("Clear recycle bin"),
              iconFlex: 2,
              text: "Delete all items from 'Recycle Bin'",
            ),
            iconCard(
              icon: Text("Clear favourites"),
              iconFlex: 2,
              text: "Delete all items from 'Favourites'",
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryFeaturesCard extends StatelessWidget {
  const HistoryFeaturesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("History features"),
          leading: Icon(
            MdiIcons.history,
            color: Colors.green,
          ),
          onTap: () {
            Get.to(
              HistoryFeaturesPage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
