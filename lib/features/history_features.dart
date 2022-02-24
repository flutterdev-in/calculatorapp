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
                  "On tap : Opens history of Recycle bin / Favorites as decided by last item saved.\nLong press : Save input in 'Recycle bin' without clearing input from display.",
            ),
            iconCard(
              iconData: Icons.favorite_border_outlined,
              // iconFlex: 2,
              text: "History of 'Recycle bin'\nMaximum capacity 100.",
            ),
            iconCard(
              iconData: Icons.favorite,
              text: "History of 'Favorites'\nUnrestricted.",
            ),
            iconCard(
              iconData: MdiIcons.tableArrowRight,
              text: "On tap : Show result table of this item.",
            ),
            iconCard(
              icon: Text("Swipe\nactions"),
              iconFlex: 2,
              text:
                  "Swipe right : Move item to 'Favorites' / 'Recycle bin'\nSwipe left : Delete item from 'Favorites' / 'Recycle bin'.",
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
                  "1) Time stamp of the item will be taken at the time of saving.\n2) Time stamp of the item will not change if you move item to 'Favorites' / 'Recycle bin'",
            ),
            iconCard(
              icon: Text("Clear"),
              iconFlex: 2,
              text: "Delete all items from 'Recycle Bin' / 'Favorites'",
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
