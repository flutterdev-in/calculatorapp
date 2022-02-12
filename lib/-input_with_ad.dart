import 'package:calculator_04/ads/banner_ad_widget.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:calculator_04/input/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWithAdWidget extends StatelessWidget {
  InputWithAdWidget({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return SizedBox(
      height: md.height / 4,
      child: Stack(
        children: [
          InputW(),
          Obx(() {
            if (b.n.value.contains("\n")) {
              return const Text("");
            } else {
              return BannerAdW();
            }
          })
        ],
      ),
    );
  }
}
