import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsRadius extends StatelessWidget {
  const ButtonsRadius({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sc.buttonsRadius.value = sbox.get(bm.buttonsRadius) ?? 0;
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: const Text("Buttons radius"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (sc.buttonsRadius.value.isGreaterThan(0)) {
                    if (sc.buttonsRadius.value < 1) {
                      sc.buttonsRadius.value = 0;
                    } else {
                      sc.buttonsRadius.value -= 5;
                    }

                    sbox.put(bm.buttonsRadius, sc.buttonsRadius.value);
                  }
                },
              ),
              Obx(() => Text(sc.buttonsRadius.value.toString())),
              InkWell(
                child: const Text("  +  "),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (sc.buttonsRadius.value < 60) {
                    sc.buttonsRadius.value += 5;
                    sbox.put(bm.buttonsRadius, sc.buttonsRadius.value);
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
