import 'package:calculator_04/controllers/result_controller.dart';
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
      color: Colors.white12,
      child: ListTile(
        title: const Text("Default precision"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
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
