import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'dart:io';
import 'package:devicelocale/devicelocale.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  Rx<int> p = 0.obs;
  Rx<String> n = "".obs;
  Rx<String> nf = "indian".obs;
  RichTextController? rtc;

  @override
  void onInit() {
    // await openBoxes();
    rtcInit();
    settingsInit();
    super.onInit();
  }

  Future<void> openBoxes() async {
    await Hive.openBox("history");
    await Hive.openBox("settings");
  }

  void rtcInit() {
    rtc = RichTextController(
      onMatch: (List<String> matches) {},
      patternMatchMap: {
        RegExp(r"[/\+\-\u00D7\(\)%]"): TextStyle(color: Colors.green),
        RegExp(r"[^\d\./\+\-\u00D7\(\)%]"): TextStyle(color: Colors.blue),
      },
    );
  }

  void settingsInit() async {
     
    try {
      // IN , PK, NP, BD
      await http.get(Uri.parse('http://ip-api.com/json')).then((value) {

        print(json.decode(value.body)['countryCode'].toString());
      });
    } catch (err) {
      //handleError
    }
  }
}
