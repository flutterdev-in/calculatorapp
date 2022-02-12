import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';
import 'package:calculator_04/useful/regex.dart';
import 'package:flutter/material.dart';
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
          child: Column(
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
                child: Text(
                  "Total  =  " + r.gr.value,
                  textScaleFactor: 1.3,
                  softWrap: true,
                ),
                alignment: Alignment.topRight,
              ),
            )),
      );
    } else {
      if (lastString.contains(RegExp(r'^\n?[\u00D7/]'))) {
    lastString=  lastString.replaceAll("\n", " ");
    }
      else{
      lastString=  lastString.replaceAll("\n", " + ");
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
                  child: Text(
                    "Total  =  " + r.sr.value,
                    textScaleFactor: 1.3,
                    softWrap: true,
                  ),
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
                    child: Text(
                      "Total " +
                          lastString +
                          "  =  " +
                          r.gr.value,
                      textScaleFactor: 1.3,
                    ),
                  )),
            ),
          ),
        ],
      );
    }
  }

  Widget listBuilder() {
    return ListView.builder(
        shrinkWrap: true,
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
                    flex: 3,
                    child: Container(
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          rowString,
                          softWrap: true,
                          textScaleFactor: 1.3,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      color: Colors.white12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          child: Text(
                            rowResult,
                            softWrap: true,
                            textScaleFactor: 1.3,
                            style: TextStyle(color: Colors.white),
                          ),
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
        .replaceAll(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'), "").replaceAll(RegExp(r'\n[^\d]*$'), "");
    listStrings = subString.split("\n");

    if (r.tableString.value
        .contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'))) {
      lastString = RegEx()
          .listMatch(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$', r.tableString.value)
          .first;
    }
  }
}
