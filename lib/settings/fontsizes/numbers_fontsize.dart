import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumbersFontsize extends StatelessWidget {
  const NumbersFontsize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: Text("Numbers\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.numbersFontSize.value > 10) {
                    sc.numbersFontSize.value--;
                    sbox.put(bm.numbersFontSize, sc.numbersFontSize.value);
                  }
                },
              ),
              Obx(() => Text((sc.numbersFontSize.value - 4)
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.numbersFontSize.value < 60) {
                    sc.numbersFontSize.value++;
                    sbox.put(bm.numbersFontSize, sc.numbersFontSize.value);
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
