
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';


final MainController mc = Get.put(
  MainController(),
  permanent: true,
);

class MainController extends GetxController {
  Rx<int> p = 0.obs;
  Rx<String> n = "".obs;
  RichTextController? rtc;

 
}
