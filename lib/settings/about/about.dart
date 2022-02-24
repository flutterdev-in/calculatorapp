import 'package:calculator_04/features/custom_card_for_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("https://aicalculator.web.app"),
              onTap: () async {
                String _url = "https://aicalculator.web.app";
                if (await canLaunch(_url)) {
                  await launch(_url);
                }
              },
            ),
            ListTile(
              // leading: Icon(MdiIcons.cardAccountMailOutline),
              title: Text("aicalculator.contact@gmail.com"),
            ),
            ListTile(
              title: Text("App version 1.0.0"),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
          title: Text("About"),
          trailing: Icon(
            MdiIcons.informationOutline,
          ),
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => AboutPage()));

            Get.to(
              AboutPage(),
              transition: Transition.leftToRightWithFade,
              opaque: false,
            );
          }),
    );
  }
}
