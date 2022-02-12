import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/input_settings_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';

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
          title: Text("Seetings"),
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              displayFontSize(),
              mainResultFontSize(),
              subResultFontSize(),
              precision(),
              commaPosition(),
            ],
          ),
        ),
      ),
    );
  }

  Widget commaPosition() {
    return Card(
      color: Colors.white12,
      child: ExpansionTile(
        title: Text("Default comma position"),
        subtitle: Align(
          child: Obx(() {
            String nfd = r.nf.value;
            String nf;
            if (nfd == "23") {
              nf = "dd,dd,dd,ddd";
            } else if (nfd == "33") {
              nf = "ddd,ddd,ddd";
            } else {
              nf = "dddddddd";
            }
            return Text(nf);
          }),
          alignment: Alignment.bottomRight,
        ),
        children: [
          GFButton(
            onPressed: () {
              r.nf.value = "33";
              sbox.put("nfd", "33");
            },
            text: "ddd,ddd,ddd",
            type: GFButtonType.outline,
            color: GFColors.LIGHT,
          ),
          GFButton(
            onPressed: () {
              r.nf.value = "23";
              sbox.put("nfd", "23");
            },
            text: "dd,dd,ddd",
            type: GFButtonType.outline,
            color: GFColors.LIGHT,
          ),
          GFButton(
            onPressed: () {
              r.nf.value = "";
              sbox.put("nfd", "");
            },
            text: "dddddddd",
            type: GFButtonType.outline,
            color: GFColors.LIGHT,
          ),
        ],
      ),
    );
  }

  Widget precision() {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Default precision"),
        trailing: Flexible(
          child: SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                inkwell(" -  "),
                Obx(() => inkwell(r.precision.value.toString())),
                inkwell("  + ")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inkwell(
    String text, {
    void Function()? onTap,
  }) {
    r.precision.value = sbox.get("precision");
    return InkWell(
      onTap: () {
        if (text == " -  ") {
          r.precision.value--;
          sbox.put("precision", r.precision.value);
        } else if (text == "  + ") {
          r.precision.value++;
          sbox.put("precision", r.precision.value);
        }
      },
      child: Ink(
        child: Center(
          child: Text(
            text,
            textScaleFactor: 1.6,
          ),
        ),
      ),
    );
  }

  Widget displayFontSize() {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Display fontSize"),
        trailing: SizedBox(
          width: 100,
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

  Widget mainResultFontSize() {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text("Main Result fontSize"),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Center(child: Text("  -  ")),
                onTap: () {
                  sc.grossResultFontSize.value--;
                  sbox.put("grossResultFontSize", sc.grossResultFontSize.value);
                },
              ),
              Obx(() => Text(sc.grossResultFontSize.value
                  .toString()
                  .replaceAll(RegExp(r'\..*'), ""))),
              InkWell(
                child: Text("  +  "),
                onTap: () {
                  sc.grossResultFontSize.value++;
                  sbox.put("grossResultFontSize", sc.grossResultFontSize.value);
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
          width: 100,
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
                  sc.subResultsFontSize.value++;
                  sbox.put("subResultsFontSize", sc.subResultsFontSize.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
