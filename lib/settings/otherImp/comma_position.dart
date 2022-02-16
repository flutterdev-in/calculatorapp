import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';

class BottomPadding extends StatelessWidget {
  BottomPadding({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  final Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white12,
        child: Obx(
          () {
            String nfd00 = sbox.get("nfd0") ?? "";
            Rx<String> nfd0 = nfd00.obs;
            String nf0 = sbox.get("nfd") ?? "";
            Rx<String> nf = nf0.obs;
            r.nf.value = nf.value;
            return ExpansionTile(
              title: Text("Default comma position"),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Primary",
                          style: TextStyle(color: Colors.green),
                        ),
                        GFButton(
                          onPressed: () {
                            nf.value = "33";
                            r.nf.value = nf.value;
                            // r.isCommaEnabled.value = true;
                            sbox.put("nfd", "33");
                          },
                          text: "ddd,ddd,ddd",
                          type: GFButtonType.outline,
                          color: nf.value == "33"
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                        GFButton(
                          onPressed: () {
                            nf.value = "23";
                            r.nf.value = nf.value;
                            // r.isCommaEnabled.value = true;
                            sbox.put("nfd", "23");
                          },
                          text: "dd,dd,ddd",
                          type: GFButtonType.outline,
                          color: nf.value == "23"
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                        GFButton(
                          onPressed: () {
                            nf.value = "";
                            r.nf.value = nf.value;
                            // r.isCommaEnabled.value = false;
                            sbox.put("nfd", "");
                          },
                          text: "dddddddd",
                          type: GFButtonType.outline,
                          color: (nf.value != "23" && nf.value != "33")
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Secondary",
                          style: TextStyle(color: Colors.orange),
                        ),
                        GFButton(
                          onPressed: () {
                            nfd0.value = "33";
                            sbox.put("nfd0", "33");
                          },
                          text: "ddd,ddd,ddd",
                          type: GFButtonType.outline,
                          color: nfd0.value == "33"
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                        GFButton(
                          onPressed: () {
                            nfd0.value = "23";
                            sbox.put("nfd0", "23");
                          },
                          text: "dd,dd,ddd",
                          type: GFButtonType.outline,
                          color: nfd0.value == "23"
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                        GFButton(
                          onPressed: () {
                            nfd0.value = "";
                            sbox.put("nfd0", "");
                          },
                          text: "dddddddd",
                          type: GFButtonType.outline,
                          color: (nfd0.value != "23" && nfd0.value != "33")
                              ? GFColors.SECONDARY
                              : GFColors.LIGHT,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ));  }
}
