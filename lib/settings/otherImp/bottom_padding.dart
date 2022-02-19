import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottonPadding extends StatelessWidget {
  const BottonPadding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: const Text("Bottom empty space"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Center(child: Text("  -  ")),
                onTap: () {
                  sc.bottomPadding.value -= 3;
                  sbox.put(bm.bottomPadding, sc.bottomPadding.value);
                },
              ),
              Obx(() => Text(sc.bottomPadding.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: const Text("  +  "),
                onTap: () {
                  sc.bottomPadding.value += 3;
                  sbox.put(bm.bottomPadding, sc.bottomPadding.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
