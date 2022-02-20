import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/input/input_widget.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/result/resultTable/result_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InputStack extends StatelessWidget {
  InputStack({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InputW(),
        Align(
          alignment: Alignment.bottomRight,
          child: Obx(() {
            if (b.n.value.contains("\n")) {
              return IconButton(
                  color: Color(sc.actionButtonsColor.value),
                  icon: const Icon(
                    MdiIcons.tableArrowRight,
                  ),
                  onPressed: () {
                    r.tableString.value = b.n.value;
                    r.tgr.value = r.gr.value;
                    r.tsr.value = r.sr.value;
                    Get.to(
                      TableResult(),
                      transition: Transition.leftToRightWithFade,
                      opaque: false,
                    );
                  });
            } else {
              return const Text("");
            }
          }),
        )
      ],
    );
  }
}
