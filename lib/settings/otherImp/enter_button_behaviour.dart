import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EnterButtonBehavior extends StatelessWidget {
  EnterButtonBehavior({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    sc.isEnterLine.value = sbox.get("isEnterLine") ?? true;

    return Card(
      color: Colors.white12,
      child: ExpansionTile(
        title: Text("Enter button behaviour"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Single Tap"),
                  Obx(() => Text(
                        sc.isEnterLine.value ? "Next line" : "Equal",
                        style: TextStyle(
                            color: sc.isEnterLine.value
                                ? Colors.green
                                : Colors.orange),
                      )),
                ],
              ),
              IconButton(
                icon: Icon(MdiIcons.swapHorizontal),
                onPressed: () {
                  sc.isEnterLine.value = !sc.isEnterLine.value;
                  sbox.put("isEnterLine", sc.isEnterLine.value);
                },
              ),
              Column(
                children: [
                  Text("Long press"),
                  Obx(() => Text(
                        sc.isEnterLine.value ? "Equal" : "Next line",
                        style: TextStyle(
                            color: sc.isEnterLine.value
                                ? Colors.orange
                                : Colors.green),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
