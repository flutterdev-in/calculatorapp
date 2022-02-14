import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';

class TableResult extends StatelessWidget {
  TableResult({Key? key}) : super(key: key);
  final ResultController r = Get.put(ResultController());
  List<String> listStrings = [];
  String lastString = "";

  @override
  Widget build(BuildContext context) {
    getInputs();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Result Table"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
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
        child: Container(
            width: double.maxFinite,
            color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: parseText("Total  =  " + r.tgr.value,
                    txtColor: Colors.yellow.shade500),
                alignment: Alignment.topRight,
              ),
            )),
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
            child: Container(
              color: Colors.white10,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: parseText("Total  =  " + r.tsr.value,
                      txtColor: Colors.orange.shade200),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Container(
              color: Colors.white10,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      parseText("Total $lastString = ",
                          txtColor: Colors.orange.shade200),
                      parseText(r.tgr.value, txtColor: Colors.orange.shade400),
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
          String rowString = listStrings[index];
          String rowResult = rowResultF(rowString);
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      color: Colors.white12,
                      child: Align(
                        child: Text(
                          (index + 1).toString(),
                          textScaleFactor: 1.25,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: double.infinity,
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          child: parseText(rowString),
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: double.infinity,
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          child: parseText(rowResult),
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget parseText(String txt, {Color txtColor = Colors.white}) {
    return ParsedText(
      text: txt,
      textScaleFactor: 1.4,
      softWrap: true,
      // maxLines: 10,
      style: TextStyle(color: Colors.white),
      parse: <MatchText>[
        MatchText(
          pattern: r"[/\+\-\u00D7\(\)%]",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        MatchText(
          pattern: r",",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        MatchText(
          pattern: r"[A-Za-z=]",
          style: TextStyle(
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
          style: TextStyle(
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
      return r.resultString(finalResult0);
    }
  }

  void getInputs() {
    String subString = r.tableString.value
        .replaceAll(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'), "")
        .replaceAll(RegExp(r'\n[^\d]*$'), "");
    listStrings = subString.split("\n");

    if (r.tableString.value
        .contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'))) {
      lastString = RegEx()
          .listMatch(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$', r.tableString.value)
          .first;
    }
  }
}
