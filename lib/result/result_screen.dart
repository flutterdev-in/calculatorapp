import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ResultW extends StatelessWidget {
  ResultW({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;

    //
    Widget result(String resultType, double fontSize, Color textColour) {
      if (resultType == "invalid") {
        return const GFLoader(
          type: GFLoaderType.square,
          size: GFSize.SMALL,
        );
      } else {
        return AutoSizeText(
          resultType,
          minFontSize: 1,
          style: TextStyle(color: textColour, fontSize: fontSize),
          maxLines: 1,
        );
      }
    }

    return Obx(() {
      r.allResults(b.n.value);
      return SizedBox(
        width: double.infinity,
        height: md.height / 8 ,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                        child: result(
                            r.llr.value,
                            sc.subResultsFontSize.value.toDouble(),
                            Colors.orange.shade200),
                        alignment: Alignment.topLeft),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                        child: result(
                            r.sr.value,
                            sc.subResultsFontSize.value.toDouble(),
                            Colors.orange.shade200),
                        alignment: Alignment.topRight),
                  ),
                ],
              ),
              Obx(() {
                AlignmentGeometry al;
                if (sc.mainResultPlacement.value == "left") {
                  al = Alignment.bottomLeft;
                } else if (sc.mainResultPlacement.value == "center") {
                  al = Alignment.bottomCenter;
                } else {
                  al = Alignment.bottomRight;
                }
                return Align(
                    child: result(
                        r.gr.value,
                        sc.grossResultFontSize.value.toDouble(),
                        Colors.orange.shade300),
                    alignment: al);
              }),
            ],
          ),
        ),
      );
    });
  }
}
