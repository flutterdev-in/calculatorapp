import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainResultsFontSize extends StatelessWidget {
  const MainResultsFontSize({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: const Text("Main result\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.grossResultFontSize.value > 0) {
                    sc.grossResultFontSize.value -= 2;
                    sbox.put(
                        bm.grossResultFontSize, sc.grossResultFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.grossResultFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: const Text("  +  "),
                onTap: () {
                  if (sc.grossResultFontSize.value < 35) {
                    sc.grossResultFontSize.value += 2;
                    sbox.put(
                        bm.grossResultFontSize, sc.grossResultFontSize.value);
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
