import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultPrecision extends StatelessWidget {
  const DefaultPrecision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rc.precision.value = sbox.get(bm.precision) ?? 2;
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: const Text("Default precision"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (rc.precision.value > -6) {
                    rc.precision.value--;
                    sbox.put(bm.precision, rc.precision.value);
                  }
                },
              ),
              Obx(() => Text(rc.precision.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: const Text("  +  "),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (rc.precision.value < 7) {
                    rc.precision.value++;
                    sbox.put(bm.precision, rc.precision.value);
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
