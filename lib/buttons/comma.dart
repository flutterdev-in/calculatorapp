import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
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
    if (r.isCommaEnabled.value) {
      r.nf.value = nfd;
    } else {
      r.nf.value = "";
    }
  }

  void longPress() {
    String nfd = boxS.get("nfd") ?? "33";
    String df = '';
    if (nfd == "33") {
      boxS.put("nfd", "23");
      r.nf.value = "23";
      df = "dd,dd,ddd.dd";
    } else if (r.nf.value == "23") {
      boxS.put("nfd", "33");
      r.nf.value = "33";
      df = "ddd,ddd,ddd.dd";
    }
    if (df != '') {
      Get.defaultDialog(
          title: "Comma seperation has been changed to", middleText: df);
      // Get.snackbar("Comma seperation has been changed to", df);
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
                        : Colors.pink.shade900),
              ),
              SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Align(
          child: Icon(MdiIcons.cogOutline, size: 12, color: Colors.transparent),
          alignment: Alignment.bottomRight,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      onLongPress: () => longPress(),
      wantChild: true,
      child: Obx(() => icon()),
      // buttonColor: Colors.white12,
    );
  }
}
