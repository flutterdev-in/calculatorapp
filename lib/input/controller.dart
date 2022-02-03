import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class MainController extends GetxController {
  Rx<int> p = 0.obs;
  Rx<String> n = "".obs;
  RichTextController? rtc;
  @override
  void onInit() {
    rtc = RichTextController(
      onMatch: (List<String> matches) {},
      patternMatchMap: {
        RegExp(r"[/\+\-\u00D7\(\)%]"): TextStyle(color: Colors.green),
        RegExp(r"[^\d\./\+\-\u00D7\(\)%]"): TextStyle(color: Colors.blue),
      },
    );

    super.onInit();
  }
}
