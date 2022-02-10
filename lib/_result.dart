import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/result/resultTypes/final_result.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ResultW extends StatelessWidget {
  ResultW({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    Widget result(String resultType, double factor, Color textColour) {
      if (resultType == "invalid") {
        return GFLoader(
          type: GFLoaderType.square,
          size: GFSize.SMALL,
        );
      } else {
        return Text(
          resultType,
          textScaleFactor: factor,
          style: TextStyle(color: textColour),
        );
      }
    }

    return Obx(() {
      everAll([r.nf, r.precision, r.digitLength, b.n],
          (_) => r.allResults(b.n.value));
      return Container(
        width: double.infinity,
        color: Colors.black87,
        height: md.height / 8,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  result(r.llr.value, 2, Colors.yellow.shade200),
                  result(r.sr.value, 2, Colors.yellow.shade200)
                ],
              ),
              Align(
                  child: result(r.gr.value, 2.7, Colors.yellow.shade600),
                  alignment: Alignment.bottomRight),
            ],
          ),
        ),
      );
    });
  }
}
