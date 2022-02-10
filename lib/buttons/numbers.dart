import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:calculator_04/buttons/functions/add_symbol.dart';
import 'package:calculator_04/buttons/functions/ocb.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/main_controller.dart';
class Numbers extends StatelessWidget {
  Numbers({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  late int number;
  Numbers.select(this.number);
  List<String> numberUcodes = [
    "\u2070",
    "\u00B9",
    '\u00B2',
    '\u00B3',
    '\u2074',
    '\u2075',
    '\u2076',
    '\u2077',
    '\u2078',
    '\u2079'
  ];

  void onPressed() {
    b.n.value = AddSymbol().add("nm", b.n.value, b.p.value);
    b.p.value++;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, b.n.value);
    }

    String powerNum = numberUcodes[number];

    if (b.n.value.contains(RegExp(r'(^|\n|[/\u00D7\+\-\(\)\.\d\%])nm($|.*)'))) {
      if (b.n.value.contains(RegExp(r'[%\)]nm'))) {
        b.n.value = b.n.value.replaceAll("nm", "\u00D7$number");
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll("nm", number.toString());
      }
    } else if (b.n.value.contains("^nm")) {
      b.n.value = b.n.value.replaceAll("^nm", powerNum);
      b.p.value--;
    } else if (b.n.value.contains(RegExp(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+nm'))) {
      List<int> ocb = OCB().ocb(b.n.value, "\u207D", "\u207E");
      if (ocb[1] != 0 && ocb[1] == ocb[0]) {
        b.n.value = b.n.value.replaceAll("nm", "\u00D7$number");
        b.p.value++;
      } else if (b.n.value.contains("\u207Enm")) {
        b.n.value = b.n.value.replaceAll("nm", "\u02E3$powerNum");
        b.p.value++;
      } else {
        b.n.value = b.n.value.replaceAll("nm", powerNum);
      }
    } else {
      b.n.value = b.n.value.replaceAll("nm", "");
      b.p.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => onPressed(),
      isIcon: false,
      text: number.toString(),
    );
  }
}
