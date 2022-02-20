import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';

class TableResult extends StatelessWidget {
  TableResult({Key? key}) : super(key: key);
  List<String> listStrings = [];
  String lastString = "";

  @override
  Widget build(BuildContext context) {
    getInputs();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Result Table"),
          // backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: Container(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            children: [listBuilder(), endResult()],
          ),
        ),
      ),
    );
  }

  Widget endResult() {
    if (lastString.isEmpty || lastString == "") {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Obx(() => Container(
            width: double.maxFinite,
            color: Get.isDarkMode ? Colors.white10 : Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: parseText("Total =  " + rc.tgr.value,
                    txtColor: Color(sc.grossResultFontColor.value)),
                alignment: Alignment.topRight,
              ),
            ))),
      );
    } else {
      if (lastString.contains(RegExp(r'^\n?[\u00D7/]'))) {
        lastString = lastString.replaceAll("\n", " ");
      } else {
        lastString = lastString.replaceAll("\n", " + ");
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Obx(() => Container(
                  color: Get.isDarkMode ? Colors.white10 : Colors.black12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: parseText("Total  =  " + rc.tsr.value,
                          txtColor: Color(sc.subResultsFontColor.value)),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Container(
              color: sc.isThemeDark.value ? Colors.white10 : Colors.black12,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      parseText("Total$lastString = ",
                          txtColor: Color(sc.grossResultFontColor.value)),
                      parseText(rc.tgr.value,
                          txtColor: Color(sc.grossResultFontColor.value)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget listBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listStrings.length,
        itemBuilder: (context, index) {
          return listRow(index);
        });
  }

  Widget listRow(int index) {
    String rowString = listStrings[index];
    String rowResult = rowResultF(rowString);
    Widget indexW() {
      return Expanded(
        flex: 2,
        child: Container(
          height: double.infinity,
          color: sc.isThemeDark.value ? Colors.white10 : Colors.black12,
          child: Align(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: Color(sc.displayFontColor.value),
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      );
    }

    Widget rowSW() {
      return Expanded(
        flex: 10,
        child: Container(
          height: double.infinity,
          color: sc.isThemeDark.value ? Colors.white10 : Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: parseText(rowString,
                  txtColor: Color(sc.displayFontColor.value)),
              alignment: Alignment.topRight,
            ),
          ),
        ),
      );
    }

    Widget resultRowW({double txtFactor = 1}) {
      return Expanded(
        flex: 8,
        child: Container(
          height: double.infinity,
          color: sc.isThemeDark.value ? Colors.white10 : Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: parseText(rowResult,
                  txtColor: Color(sc.displayFontColor.value)),
              alignment: Alignment.topRight,
            ),
          ),
        ),
      );
    }

    if (mc.n.value.contains(RegExp(r'[^\n\.\d]+'))) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              indexW(),
              SizedBox(
                width: 2,
              ),
              rowSW(),
              SizedBox(
                width: 2,
              ),
              resultRowW(),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              indexW(),
              SizedBox(
                width: 2,
              ),
              resultRowW(),
            ],
          ),
        ),
      );
    }
  }

  Widget parseText(String txt, {Color txtColor = Colors.white}) {
    double textFactor = 1.2;
    if (mc.n.value.contains(RegExp(r'[^\n\.\d]+'))) {
      textFactor = 1;
    }
    return ParsedText(
      text: txt,
      softWrap: true,
      style: TextStyle(
        color: txtColor,
        fontSize: sc.tableFontSize.value.toDouble() * textFactor,
      ),
      parse: <MatchText>[
        MatchText(
          pattern: r"[/\+\-\u00D7\(\)%]",
          style: const TextStyle(
            color: Colors.green,
          ),
        ),
        MatchText(
          pattern: r",",
          style: TextStyle(
            color: sc.isThemeDark.value ? Colors.white70 : Colors.black87,
          ),
        ),
        MatchText(
          pattern: r"[A-Za-z=]",
          style: const TextStyle(
            color: Colors.purple,
          ),
        ),
        MatchText(
          pattern: r"[\d\.]",
          style: TextStyle(
            color: txtColor,
          ),
        ),
        MatchText(
          pattern:
              r"[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079]",
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  String rowResultF(String rowString) {
    String newLastNvalue = Modifications().modifications(rowString);

    num finalResult0 = TryCatches().tc(newLastNvalue);

    if (finalResult0 == 0.1921465) {
      return "invalid input";
    } else {
      return rc.resultString(finalResult0);
    }
  }

  void getInputs() {
    String subString = rc.tableString.value
        .replaceAll(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'), "")
        .replaceAll(RegExp(r'\n[^\d]*$'), "");
    listStrings = subString.split("\n");

    if (rc.tableString.value
        .contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'))) {
      lastString = RegEx()
          .listMatch(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$', rc.tableString.value)
          .first;
    }
  }
}
