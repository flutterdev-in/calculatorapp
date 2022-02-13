import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controller/main_controller.dart';

class Enter extends StatelessWidget {
  Enter({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());
  final ResultController r = Get.put(ResultController());
  final SettingsController sc = Get.put(SettingsController());

  void nextLine() {
    b.n.value = AddSymbol().add("et", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(^|\n|\(|\u207D|\^)et'))) {
      b.n.value = b.n.value.replaceAll("et", "");
      b.p.value--;
    } else if (b.n.value
        .contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*et'))) {
      b.n.value = b.n.value.replaceAll("et", "");
      b.p.value--;
    } else if (b.n.value.contains("(") && !b.n.value.contains("\u207D")) {
      int difference = 0;
      for (String i in b.n.value.split('')) {
        if (i == "(") {
          difference++;
        } else if (i == ")") {
          difference--;
        }
      }

      if (difference == 0) {
        if (b.n.value.contains(RegExp(r'[\d%\)]et'))) {
          b.n.value = b.n.value.replaceAll("et", "\n");
        } else if (b.n.value.contains(".et")) {
          b.n.value = b.n.value.replaceAll("et", "0\n");
          b.p.value++;
        } else {
          b.n.value = b.n.value.replaceAll("et", "");
          b.p.value--;
        }
      } else if (difference > 0) {
        String closedBrasToAdd = ")" * difference;
        if (b.n.value.contains(RegExp(r'[\d%]et'))) {
          b.n.value = b.n.value.replaceAll("et", closedBrasToAdd + "\n");
          b.p.value = b.p.value + closedBrasToAdd.length;
        } else if (b.n.value.contains(".et")) {
          b.n.value = b.n.value.replaceAll("et", closedBrasToAdd + "0\n");
          b.p.value = b.p.value + closedBrasToAdd.length;
        } else {
          b.n.value = b.n.value.replaceAll("et", "");
          b.p.value--;
        }
      }
    } else if (!b.n.value.contains("(") && b.n.value.contains("\u207D")) {
      int difference = 0;
      for (String i in b.n.value.split('')) {
        if (i == "\u207D") {
          difference++;
        } else if (i == "\u207E") {
          difference--;
        }
      }
      if (difference == 0) {
        if (b.n.value.contains(RegExp(r'[\d%]et'))) {
          b.n.value = b.n.value.replaceAll("et", "\n");
        } else if (b.n.value.contains(".et")) {
          b.n.value = b.n.value.replaceAll("et", "0\n");
          b.p.value++;
        } else {
          b.n.value = b.n.value.replaceAll("et", "");
          b.p.value--;
        }
      } else if (difference > 0) {
        String closedBrasToAdd = "\u207E" * difference;
        if (b.n.value.contains(RegExp(
            r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]et'))) {
          b.n.value = b.n.value.replaceAll("et", closedBrasToAdd + "\n");
          b.p.value = b.p.value + closedBrasToAdd.length;
        } else if (b.n.value.contains("\u22C5et")) {
          b.n.value = b.n.value.replaceAll("et", closedBrasToAdd + "\u2070\n");
          b.p.value = b.p.value + closedBrasToAdd.length;
        } else {
          b.n.value = b.n.value.replaceAll("et", "");
          b.p.value--;
        }
      }
    } else if (!b.n.value.contains("(") && !b.n.value.contains("\u207D")) {
      if (b.n.value.contains(RegExp(r'[\d%]et'))) {
        b.n.value = b.n.value.replaceAll("et", "\n");
      } else if (b.n.value.contains(".et")) {
        b.n.value = b.n.value.replaceAll("et", "0\n");
        b.p.value++;
      } else if (b.n.value.contains(RegExp(
          r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]et'))) {
        b.n.value = b.n.value.replaceAll("et", "\n");
      } else if (b.n.value.contains("\u22C5et")) {
        b.n.value = b.n.value.replaceAll("et", "\u2070\n");
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll("et", "");
        b.p.value--;
      }
    } else {
      b.n.value = b.n.value.replaceAll("et", "");
      b.p.value--;
    }
  }

  void eualto() {
    HistoryBox hb = HistoryBox();
    if (!b.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(b.n.value);
    }

    b.n.value = r.gr.value.replaceAll(",", "").replaceAll(" ", "");
    b.p.value = b.n.value.length;
  }
  
  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => sc.isEnterLine.value ? nextLine() : eualto(),
      onLongPress: () => sc.isEnterLine.value ? eualto() : nextLine(),
      iconData: MdiIcons.playlistPlus,
      buttonColor: Colors.green.shade900,
      iconColor: Colors.white,
      iconSize: 40,
      // wantChild: true,
      // child: icon(),
    );
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