import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrecisionB extends StatelessWidget {
  PrecisionB({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  Box bxs = Hive.box("settings");

  Widget inkwell(String text,
      {double scalefactor = 1.1, double left = 0, double right = 0}) {
    if (text == "P-") {
      left = 0.5;
    }
    if (text == "P+") {
      right = 0.5;
    }
    return Expanded(
      child: Container(
        height: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.fromLTRB(left, 0.5, right, 0.5),
          child: Material(
            color: Colors.white10,
            child: InkWell(
              onTap: () {
                if (text == "P-") {
                  r.precision.value--;
                } else if (text == "P+") {
                  r.precision.value++;
                } else {
                  r.precision.value = bxs.get("precision");
                }
              },
              child: Ink(
                child: Center(
                  child: Text(
                    text,
                    textScaleFactor: scalefactor,
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
              highlightColor: Colors.pink.shade900,
              splashColor: Colors.pink.shade900,
              radius: 30,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonss() {
    return Row(
      children: [
        inkwell("P-"),
        Obx(() => inkwell(r.precision.value.toString(), scalefactor: 1.3)),
        inkwell("P+"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buttonss();
  }
}
