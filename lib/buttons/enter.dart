import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:calculator_04/controller/main_controller.dart';

class Enter extends StatelessWidget {
  Enter({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  void onPressed() {
    b.n.value = AddSymbol().add("et", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(^|\n|\(|\u207D|\^)et'))) {
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

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      buttonColor: Colors.green.shade900,
      iconData: MdiIcons.playlistPlus,
      iconSize: 40,
      // padding: 0.3,
    );
  }
}
