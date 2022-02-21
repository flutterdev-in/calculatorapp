import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperatorsFontsize extends StatelessWidget {
  const OperatorsFontsize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: Text("Operators\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (sc.operatorsIconSize.value > 10) {
                    sc.operatorsIconSize.value--;
                    sbox.put(bm.operatorsIconSize, sc.operatorsIconSize.value);
                  }
                },
              ),
              Obx(() => Text((sc.operatorsIconSize.value - 15)
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (sc.operatorsIconSize.value < 60) {
                    sc.operatorsIconSize.value++;
                    sbox.put(bm.operatorsIconSize, sc.operatorsIconSize.value);
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
