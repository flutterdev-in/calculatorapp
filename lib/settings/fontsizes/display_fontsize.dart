import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayFontSize extends StatelessWidget {
  const DisplayFontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: ListTile(
        title: Text("Display\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                splashColor: Colors.brown.shade100,
                onTap: () {
                  if (sc.displayFontSize.value > 0) {
                    sc.displayFontSize.value -= 2;
                    sbox.put(bm.displayFontSize, sc.displayFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.displayFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                splashColor: Colors.brown.shade100,
                // autofocus: true,
                onTap: () {
                  if (sc.displayFontSize.value < 50) {
                    sc.displayFontSize.value += 2;
                    sbox.put(bm.displayFontSize, sc.displayFontSize.value);
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
