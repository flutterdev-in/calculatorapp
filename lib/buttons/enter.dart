import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controllers/main_controller.dart';

class Enter extends StatelessWidget {
  Enter({Key? key}) : super(key: key);

  void nextLine() {
    mc.n.value = AddSymbol().add("et", mc.n.value, mc.p.value);
    mc.p.value++;

    if (mc.n.value.contains(RegExp(r'(^|\n|\(|\u207D|\^)et'))) {
      mc.n.value = mc.n.value.replaceAll("et", "");
      mc.p.value--;
    } else if (mc.n.value
        .contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*et'))) {
      mc.n.value = mc.n.value.replaceAll("et", "");
      mc.p.value--;
    } else if (mc.n.value.contains("(") && !mc.n.value.contains("\u207D")) {
      int difference = 0;
      for (String i in mc.n.value.split('')) {
        if (i == "(") {
          difference++;
        } else if (i == ")") {
          difference--;
        }
      }

      if (difference == 0) {
        if (mc.n.value.contains(RegExp(r'[\d%\)]et'))) {
          mc.n.value = mc.n.value.replaceAll("et", "\n");
          // r.sr.value = r.gr.value;
        } else if (mc.n.value.contains(".et")) {
          mc.n.value = mc.n.value.replaceAll("et", "0\n");
          mc.p.value++;
          // r.sr.value = r.gr.value;
        } else {
          mc.n.value = mc.n.value.replaceAll("et", "");
          mc.p.value--;
        }
      } else if (difference > 0) {
        String closedBrasToAdd = ")" * difference;
        if (mc.n.value.contains(RegExp(r'[\d%]et'))) {
          mc.n.value = mc.n.value.replaceAll("et", closedBrasToAdd + "\n");
          mc.p.value = mc.p.value + closedBrasToAdd.length;
          // r.sr.value = r.gr.value;
        } else if (mc.n.value.contains(".et")) {
          mc.n.value = mc.n.value.replaceAll("et", closedBrasToAdd + "0\n");
          mc.p.value = mc.p.value + closedBrasToAdd.length;
          // r.sr.value = r.gr.value;
        } else {
          mc.n.value = mc.n.value.replaceAll("et", "");
          mc.p.value--;
        }
      }
    } else if (!mc.n.value.contains("(") && mc.n.value.contains("\u207D")) {
      int difference = 0;
      for (String i in mc.n.value.split('')) {
        if (i == "\u207D") {
          difference++;
        } else if (i == "\u207E") {
          difference--;
        }
      }
      if (difference == 0) {
        if (mc.n.value.contains(RegExp(r'[\d%]et'))) {
          mc.n.value = mc.n.value.replaceAll("et", "\n");
          // r.sr.value = r.gr.value;
        } else if (mc.n.value.contains(".et")) {
          mc.n.value = mc.n.value.replaceAll("et", "0\n");
          mc.p.value++;
          // r.sr.value = r.gr.value;
        } else {
          mc.n.value = mc.n.value.replaceAll("et", "");
          mc.p.value--;
        }
      } else if (difference > 0) {
        String closedBrasToAdd = "\u207E" * difference;
        if (mc.n.value.contains(RegExp(
            r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]et'))) {
          mc.n.value = mc.n.value.replaceAll("et", closedBrasToAdd + "\n");
          mc.p.value = mc.p.value + closedBrasToAdd.length;
          // r.sr.value = r.gr.value;
        } else if (mc.n.value.contains("\u22C5et")) {
          mc.n.value =
              mc.n.value.replaceAll("et", closedBrasToAdd + "\u2070\n");
          mc.p.value = mc.p.value + closedBrasToAdd.length;
          // r.sr.value = r.gr.value;
        } else {
          mc.n.value = mc.n.value.replaceAll("et", "");
          mc.p.value--;
        }
      }
    } else if (!mc.n.value.contains("(") && !mc.n.value.contains("\u207D")) {
      if (mc.n.value.contains(RegExp(r'[\d%]et'))) {
        mc.n.value = mc.n.value.replaceAll("et", "\n");
        // r.sr.value = r.gr.value;
      } else if (mc.n.value.contains(".et")) {
        mc.n.value = mc.n.value.replaceAll("et", "0\n");
        mc.p.value++;
        // r.sr.value = r.gr.value;
      } else if (mc.n.value.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]et'))) {
        mc.n.value = mc.n.value.replaceAll("et", "\n");
        // r.sr.value = r.gr.value;
      } else if (mc.n.value.contains("\u22C5et")) {
        mc.n.value = mc.n.value.replaceAll("et", "\u2070\n");
        mc.p.value++;
        // r.sr.value = r.gr.value;
      } else {
        mc.n.value = mc.n.value.replaceAll("et", "");
        mc.p.value--;
      }
    } else {
      mc.n.value = mc.n.value.replaceAll("et", "");
      mc.p.value--;
    }
  }

  void eualto() {
    HistoryBox hb = HistoryBox();
    if (!mc.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(mc.n.value);
    }

    mc.n.value = rc.gr.value.replaceAll(",", "").replaceAll(" ", "");
    mc.p.value = mc.n.value.length;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GFButtonC.all(
          ontap: () => sc.isEnterLine.value ? nextLine() : eualto(),
          onLongPress: () => sc.isEnterLine.value ? eualto() : nextLine(),
          iconData: MdiIcons.playlistPlus,
          isButtenEnter: true,
          buttonColor: Color(
              sc.enterButtonBackgroundColor.value), // Colors.green.shade900,
          iconColor: Color(sc.enterButtonIconColor.value), // Colors.white,
          iconSize: sc.operatorsIconSize.value.toDouble(),
        ));
  }
}


//  Widget icon() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(18, 5, 0, 0),
//       child: SizedBox(
//         width: 50,
//         height: 50,
//         child: Stack(
//           children: [
//             Icon(
//               MdiIcons.equal,
//               size: 20,
//               color: Colors.white,
//             ),
//             Positioned(
//               right: 19,
//               top: 3,
//               child: Icon(
//                 MdiIcons.arrowLeftBottom,
//                 size: 38,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }