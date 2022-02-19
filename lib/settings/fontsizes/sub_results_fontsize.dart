import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SubResultsFontSize extends StatelessWidget {
  const SubResultsFontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: const Text("Sub results\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.subResultsFontSize.value > 0) {
                    sc.subResultsFontSize.value -= 2;
                    sbox.put(
                        bm.subResultsFontSize, sc.subResultsFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.subResultsFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: const Text("  +  "),
                onTap: () {
                  if (sc.subResultsFontSize.value < 35) {
                    sc.subResultsFontSize.value += 2;
                    sbox.put(
                        bm.subResultsFontSize, sc.subResultsFontSize.value);
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
