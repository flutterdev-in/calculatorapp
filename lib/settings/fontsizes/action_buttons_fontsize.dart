import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ActionButtonsFontsize extends StatelessWidget {
  const ActionButtonsFontsize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: Text("Action buttons\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.actionButtonsIconSize.value > 10) {
                    sc.actionButtonsIconSize.value--;
                    sbox.put(bm.actionButtonsIconSize, sc.actionButtonsIconSize.value);
                  }
                },
              ),
              Obx(() => Text((sc.actionButtonsIconSize.value-8)
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.actionButtonsIconSize.value < 60) {
                    sc.actionButtonsIconSize.value++;
                    sbox.put(bm.actionButtonsIconSize, sc.actionButtonsIconSize.value);
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
