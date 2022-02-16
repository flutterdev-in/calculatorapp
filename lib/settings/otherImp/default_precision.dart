import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class BottomPadding extends StatelessWidget {
  BottomPadding({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    r.precision.value = sbox.get("precision") ?? 2;
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Default precision"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  r.precision.value--;
                  sbox.put("precision", r.precision.value);
                },
              ),
              Obx(() => Text(r.precision.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  r.precision.value++;
                  sbox.put("precision", r.precision.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
