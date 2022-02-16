import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MainResultsFontSize extends StatelessWidget {
  MainResultsFontSize({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Main Result fontSize"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.grossResultFontSize.value > 0) {
                    sc.grossResultFontSize.value -= 2;
                    sbox.put(
                        "grossResultFontSize", sc.grossResultFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.grossResultFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.grossResultFontSize.value < 35) {
                    sc.grossResultFontSize.value += 2;
                    sbox.put(
                        "grossResultFontSize", sc.grossResultFontSize.value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
