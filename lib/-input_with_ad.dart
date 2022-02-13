import 'package:calculator_04/ads/banner_ad_widget.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:calculator_04/input/input_stack.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class InputWithAdWidget extends StatelessWidget {
  InputWithAdWidget({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final SettingsController sc = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Obx(() {
      double heightx = md.height -
          (md.height * 3 / 5 - 50) -
          (md.height / 8) -
          44 -
          (sc.bottomPadding.value);
      return SizedBox(
        height: heightx,
        child: Stack(
          children: [
            InputStack(),
            Obx(() {
              if (b.n.value.contains("\n")) {
                return const Text("");
              } else {
                return BannerAdW();
              }
            }),
          ],
        ),
      );
    });
  }
}
