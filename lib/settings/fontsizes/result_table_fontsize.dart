import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TableFontSize extends StatelessWidget {
  const TableFontSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: const Text("Result table\nfont size"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.tableFontSize.value > 0) {
                    sc.tableFontSize.value -= 2;
                    sbox.put(bm.tableFontSize, sc.tableFontSize.value);
                  }
                },
              ),
              Obx(() => Text((sc.tableFontSize.value - 7)
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: const Text("  +  "),
                onTap: () {
                  if (sc.tableFontSize.value < 35) {
                    sc.tableFontSize.value += 2;
                    sbox.put(bm.tableFontSize, sc.tableFontSize.value);
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
