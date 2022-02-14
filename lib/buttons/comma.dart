import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:getwidget/getwidget.dart';

class Comma extends StatelessWidget {
  Comma({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final Box boxS = Hive.box("settings");
  void onPressed() {
    r.isCommaEnabled.value = !r.isCommaEnabled.value;
    boxS.put("isCommaEnabled", r.isCommaEnabled.value);
    String nfd = boxS.get("nfd") ?? "33";
    String nfd0 = boxS.get("nfd0") ?? "";
    if (r.isCommaEnabled.value) {
      r.nf.value = nfd;
    } else {
      r.nf.value = nfd0;
    }
  }

  Widget icon() {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Text(
                ",",
                textScaleFactor: 4,
                style: TextStyle(
                    color: r.isCommaEnabled.value
                        ? Colors.brown
                        : Colors.blueGrey.shade800),
              ),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      wantChild: true,
      child: Obx(() => icon()),
    );
  }
}
