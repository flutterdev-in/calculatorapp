import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsSpacing extends StatelessWidget {
  const ButtonsSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sc.buttonsSpacing.value = sbox.get(bm.buttonsSpacing) ?? 0.6;
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: const Text("Buttons spacing"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.buttonsSpacing.value.isGreaterThan(0)) {
                    if (sc.buttonsSpacing.value < 0.2) {
                      sc.buttonsSpacing.value = 0.0;
                    } else {
                      sc.buttonsSpacing.value -= 0.2;
                    }

                    sbox.put(bm.buttonsSpacing, sc.buttonsSpacing.value);
                  }
                },
              ),
              Obx(() => Text(sc.buttonsSpacing.value.toStringAsFixed(1))),
              InkWell(
                child: const Text("  +  "),
                onTap: () {
                  if (sc.buttonsSpacing.value < 10) {
                    sc.buttonsSpacing.value += 0.2;
                    sbox.put(bm.buttonsSpacing, sc.buttonsSpacing.value);
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
