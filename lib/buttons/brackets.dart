import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/controller.dart';

class Brackets extends StatelessWidget {
  Brackets({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  List<int> ocb(String toSplit, String openBra, String closedBra) {
    String leftString = toSplit.split("bk").first;
    int openBra0 = 0;
    int closedBra0 = 0;
    for (String i in leftString.split('')) {
      if (i == openBra) {
        openBra0++;
      }
      if (i == closedBra) {
        closedBra0++;
      }
    }
    return [openBra0, closedBra0];
  }

  void onPressed() {
    b.n.value = AddSymbol().add("bk", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    if (b.n.value.contains(RegExp(r'(^|\n)bk'))) {
      b.n.value = b.n.value.replaceAll("bk", "(");
    } else if (b.n.value.contains('^bk')) {
      b.n.value = b.n.value.replaceAll("^bk", "\u207D");
      b.p.value--;
    }

    for (String matchedString in regex(
        r'\u207D[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]*bk')) {
      int openBraS = ocb(matchedString, '\u207D', '\u207E')[0];
      int closedBraS = ocb(matchedString, '\u207D', '\u207E')[1];

      if (closedBraS == openBraS) {
        int openBraG = ocb(b.n.value, '(', ')')[0];
        int closedBraG = ocb(b.n.value, '(', ')')[1];
        if (closedBraG < openBraG) {
          b.n.value = b.n.value.replaceAll("bk", ")");
        } else {
          b.n.value = b.n.value.replaceAll("bk", "\u00D7(");
          b.p.value++;
        }
      } else if (matchedString
          .contains(RegExp(r'[\u207A\u207B\u02E3\u141F\u207D]bk'))) {
        b.n.value = b.n.value.replaceAll("bk", "\u207D");
        b.p.value++;
      } else if (closedBraS < openBraS) {
        if (b.n.value.contains(RegExp(r'[\u207A\u207B\u02E3\u141F\u207D]bk'))) {
          b.n.value = b.n.value.replaceAll("bk", "\u207E");
        } else if (b.n.value.contains("\u22C5bk")) {
          b.n.value = b.n.value.replaceAll("bk", "\u2070\u207E");
        }
        b.n.value = b.n.value.replaceAll("bk", "\u207E");
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll("bk", "\u02E3\u207D");
        b.p.value++;
      }
    }

    if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]bk'))) {
      int openBra = ocb(b.n.value, '(', ')')[0];
      int closedBra = ocb(b.n.value, '(', ')')[1];
      if (closedBra < openBra) {
        b.n.value = b.n.value.replaceAll("bk", ")");
      } else {
        b.n.value = b.n.value.replaceAll("bk", "\u00D7(");
        b.p.value++;
      }
    } else if (b.n.value.contains('\u22C5bk')) {
      int openBra = ocb(b.n.value, '(', ')')[0];
      int closedBra = ocb(b.n.value, '(', ')')[1];
      if (closedBra < openBra) {
        b.n.value = b.n.value.replaceAll("bk", "\u2070)");
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll("bk", "\u2070\u00D7(");
        b.p.value = b.p.value + 2;
      }
    }
    if (!b.n.value.contains('(')) {
      if (b.n.value.contains(RegExp(r'[\d%]bk'))) {
        b.n.value = b.n.value.replaceAll("bk", "\u00D7(");
        b.p.value++;
      } else if (b.n.value.contains(".bk")) {
        b.n.value = b.n.value.replaceAll("bk", "0\u00D7(");
        b.p.value = b.p.value + 2;
      } else {
        b.n.value = b.n.value.replaceAll("bk", "(");
      }
    } else if (b.n.value.contains('(')) {
      int openBra = ocb(b.n.value, '(', ')')[0];
      int closedBra = ocb(b.n.value, '(', ')')[1];
      if (b.n.value.contains(RegExp(r'[\(\+\-\u00D7/]bk'))) {
        b.n.value = b.n.value.replaceAll("bk", "(");
      } else if (closedBra == openBra && b.n.value.contains(")bk")) {
        b.n.value = b.n.value.replaceAll("bk", "\u00D7(");
        b.p.value++;
      } else if (closedBra < openBra) {
        if (b.n.value.contains(".bk")) {
          b.n.value = b.n.value.replaceAll("bk", "0)");
          b.p.value++;
        } else {
          b.n.value = b.n.value.replaceAll("bk", ")");
        }
      } else {
        b.n.value = b.n.value.replaceAll("bk", "\u00D7(");
        b.p.value++;
      }
    }
    if (b.n.value.contains('bk')) {
      b.n.value = b.n.value.replaceAll("bk", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      iconData: Icons.backspace_outlined,
      isIcon: false,
      text: "( )",
      textScaleFactor: 2.5,
      textColour: Colors.green,
    );
  }
}
