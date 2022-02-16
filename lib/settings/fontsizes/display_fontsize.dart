import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DisplayFontSize extends StatelessWidget {
  DisplayFontSize({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Display fontSize"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.inputFontSize.value > 0) {
                    sc.inputFontSize.value -= 2;
                    sbox.put("inputFontSize", sc.inputFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.inputFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.inputFontSize.value < 50) {
                    sc.inputFontSize.value += 2;
                    sbox.put("inputFontSize", sc.inputFontSize.value);
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
