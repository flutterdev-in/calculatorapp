import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class SubResultsFontSize extends StatelessWidget {
SubResultsFontSize({ Key? key }) : super(key: key);
final ResultController r = Get.put(ResultController());
final SettingsController sc = Get.put(SettingsController());
final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Sub Results fontSize"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.subResultsFontSize.value > 0) {
                    sc.subResultsFontSize.value -= 2;
                    sbox.put("subResultsFontSize", sc.subResultsFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.subResultsFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.subResultsFontSize.value < 35) {
                    sc.subResultsFontSize.value += 2;
                    sbox.put("subResultsFontSize", sc.subResultsFontSize.value);
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


