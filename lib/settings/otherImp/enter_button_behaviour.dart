import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EnterButtonBehavior extends StatelessWidget {
  const EnterButtonBehavior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sc.isEnterLine.value = sbox.get("isEnterLine") ?? true;

    return Card(
      color: Colors.white12,
      child: ExpansionTile(
        title: const Text("Enter button response"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text("On tap"),
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
                icon: const Icon(MdiIcons.swapHorizontal),
                onPressed: () {
                  sc.isEnterLine.value = !sc.isEnterLine.value;
                  sbox.put("isEnterLine", sc.isEnterLine.value);
                },
              ),
              Column(
                children: [
                  const Text("Long press"),
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
