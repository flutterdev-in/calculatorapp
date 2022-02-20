import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainResultPosition extends StatelessWidget {
  const MainResultPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sc.mainResultPlacement.value = sbox.get(bm.mainResultPlacement) ?? "right";

    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child:
          ExpansionTile(title: const Text("Main result position"), children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text(
                  "Left",
                  style: TextStyle(
                    color: sc.mainResultPlacement.value == "left"
                        ? Colors.green
                        : Get.isDarkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onPressed: () {
                  if (sc.mainResultPlacement.value != "left") {
                    sc.mainResultPlacement.value = "left";
                  }
                  sbox.put(bm.mainResultPlacement, "left");
                },
              ),
              TextButton(
                child: Text(
                  "Center",
                  style: TextStyle(
                    color: sc.mainResultPlacement.value == "center"
                        ? Colors.green
                        : Get.isDarkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onPressed: () {
                  if (sc.mainResultPlacement.value != "center") {
                    sc.mainResultPlacement.value = "center";
                  }
                  sbox.put(bm.mainResultPlacement, "center");
                },
              ),
              TextButton(
                child: Text(
                  "Right",
                  style: TextStyle(
                    color: (sc.mainResultPlacement.value != "left" &&
                            sc.mainResultPlacement.value != "center")
                        ? Colors.green
                        : Get.isDarkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onPressed: () {
                  if (sc.mainResultPlacement.value == "left" ||
                      sc.mainResultPlacement.value == "center") {
                    sc.mainResultPlacement.value = "right";
                  }
                  sbox.put(bm.mainResultPlacement, "right");
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
