import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/input_settings_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());
  Box sbox = Hive.box("settings");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Colors.black38,
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              enterButtonBehavior(),
              commaPosition(),
              precision(),
              displayFontSize(),
              subResultFontSize(),
              mainResultFontSize(),
              bottomPadding(),
            ],
          ),
        ),
      ),
    );
  }

  Widget commaPosition() {
    return Card(
        color: Colors.white12,
        child: Obx(
          () => ExpansionTile(
            title: Text("Default comma position"),
            // subtitle: Align(
            //   child: Obx(() {
            //     String nfd = r.nf.value;
            //     String nf;
            //     if (nfd == "23") {
            //       nf = "dd,dd,dd,ddd";
            //     } else if (nfd == "33") {
            //       nf = "ddd,ddd,ddd";
            //     } else {
            //       nf = "dddddddd";
            //     }
            //     return Text(nf);
            //   }),
            //   alignment: Alignment.bottomRight,
            // ),
            children: [
              GFButton(
                onPressed: () {
                  r.nf.value = "33";
                  sbox.put("nfd", "33");
                },
                text: "ddd,ddd,ddd",
                type: GFButtonType.outline,
                color: r.nf.value == "33" ? GFColors.SECONDARY : GFColors.LIGHT,
              ),
              GFButton(
                onPressed: () {
                  r.nf.value = "23";
                  sbox.put("nfd", "23");
                },
                text: "dd,dd,ddd",
                type: GFButtonType.outline,
                color: r.nf.value == "23" ? GFColors.SECONDARY : GFColors.LIGHT,
              ),
              GFButton(
                onPressed: () {
                  r.nf.value = "";
                  sbox.put("nfd", "");
                },
                text: "dddddddd",
                type: GFButtonType.outline,
                color: (r.nf.value != "23" && r.nf.value != "33")
                    ? GFColors.SECONDARY
                    : GFColors.LIGHT,
              ),
            ],
          ),
        ));
  }

  Widget displayFontSize() {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Display fontSize"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  sc.inputFontSize.value--;
                  sbox.put("inputFontSize", sc.inputFontSize.value);
                },
              ),
              Obx(() => Text(sc.inputFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  sc.inputFontSize.value++;
                  sbox.put("inputFontSize", sc.inputFontSize.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget precision() {
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

  Widget mainResultFontSize() {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Main Result fontSize"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  if (sc.grossResultFontSize.value > 0) {
                    sc.grossResultFontSize.value--;
                    sbox.put(
                        "grossResultFontSize", sc.grossResultFontSize.value);
                  }
                },
              ),
              Obx(() => Text(sc.grossResultFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.grossResultFontSize.value < 35) {
                    sc.grossResultFontSize.value++;
                    sbox.put(
                        "grossResultFontSize", sc.grossResultFontSize.value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subResultFontSize() {
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
                  sc.subResultsFontSize.value--;
                  sbox.put("subResultsFontSize", sc.subResultsFontSize.value);
                },
              ),
              Obx(() => Text(sc.subResultsFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  if (sc.subResultsFontSize.value < 35) {
                    sc.subResultsFontSize.value++;
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

  Widget bottomPadding() {
    sc.bottomPadding.value = sbox.get("bottomPadding") ?? 15.0;
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Bottom padding"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  sc.bottomPadding.value -= 3;
                  sbox.put("bottomPadding", sc.bottomPadding.value);
                },
              ),
              Obx(() => Text(sc.bottomPadding.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  sc.bottomPadding.value += 3;
                  sbox.put("bottomPadding", sc.bottomPadding.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget enterButtonBehavior() {
    sc.isEnterLine.value = sbox.get("isEnterLine") ?? true;

    return Card(
      color: Colors.white12,
      child: ExpansionTile(
        title: Text("Enter button behaviour"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Single Tap"),
                  Obx(() => Text(
                        sc.isEnterLine.value ? "Next line" : "Equal",
                        style: TextStyle(
                            color: sc.isEnterLine.value
                                ? Colors.green
                                : Colors.orange),
                      )),
                ],
              ),
              IconButton(
                icon: Icon(MdiIcons.swapHorizontal),
                onPressed: () {
                  sc.isEnterLine.value = !sc.isEnterLine.value;
                  sbox.put("isEnterLine", sc.isEnterLine.value);
                },
              ),
              Column(
                children: [
                  Text("Long press"),
                  Obx(() => Text(
                        sc.isEnterLine.value ? "Equal" : "Next line",
                        style: TextStyle(
                            color: sc.isEnterLine.value
                                ? Colors.orange
                                : Colors.green),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
