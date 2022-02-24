import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/features/app_features.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/about/about.dart';
import 'package:calculator_04/settings/colors/_colors.dart';
import 'package:calculator_04/settings/fontsizes/_font_sizes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:calculator_04/settings/spacings/_spacings.dart';
import 'package:calculator_04/settings/otherImp/comma_position.dart';
import 'package:calculator_04/settings/otherImp/darktheme.dart';
import 'package:calculator_04/settings/otherImp/default_precision.dart';
import 'package:calculator_04/settings/otherImp/enter_button_behaviour.dart';
import 'package:calculator_04/settings/otherImp/main_result_position.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          actions: [
            IconButton(
                onPressed: () async {
                  String _url = "https://aicalculator.web.app";
                  if (await canLaunch(_url)) {
                    await launch(_url);
                  }
                },
                icon: Icon(
                  MdiIcons.web,
                  size: 20,
                )),
            IconButton(
                onPressed: () {
                  String? countryCode = sbox.get(bm.countryCode);
                  String shareI = "";
                  if (countryCode == "IN") {
                    shareI = "\n\n🇮🇳 Made in India, Made by Indian";
                  }
                  Share.share(
                      "Hi, i found an innovative multiline calculator, it simplify our calculations, highly customizable and many advanced features, install it from Playstore https://play.google.com/store/apps/details?id=com.aicalculator\nor you can access directly from this website aicalculator.web.app" +
                          shareI);
                },
                icon: Icon(
                  MdiIcons.shareOutline,
                )),
          ],
          // backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            children: [
              DarkDecideCard(),
              ColorsCard(),
              FontSizes(),
              Spacings(),
              DefaultPrecision(),
              CommaPosition(),
              MainResultPosition(),
              EnterButtonBehavior(),
              FeaturesCard(),
              AboutCard(),
            ],
          ),
        ),
      ),
    );
  }
}
