import 'package:calculator_04/ac_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';

class ResultW extends StatelessWidget {
  ResultW({Key? key}) : super(key: key);
  ButtonsController b = Get.put(ButtonsController());

  @override
  Widget build(BuildContext context) {
    Resultfunctios rf = Resultfunctios();
    return Container(
      width: double.infinity,
      color: Colors.green,
      height: Get.height / 8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Text(
                  rf.finalSubResult(b.n.value),
                  textScaleFactor: 2,
                );
              }),
              // Obx(() {
              //   return b.isModified.value
              //       ? Icon(
              //           Icons.block,
              //           color: Colors.red,
              //         )
              //       : Text("");
              // }),
            ],
          ),
          Align(
              child: Obx(() {
                return Text(
                  rf.finalMainResult(b.n.value),
                  textScaleFactor: 3,
                );
              }),
              alignment: Alignment.bottomRight),
        ],
      ),
    );
  }
}

class Resultfunctios {
  // Final result
  String finalMainResult(String nValue) {
    if (nValue.isNotEmpty) {
      String newNvalue = modifications(nValue);
      String finalResult = tryChatches(newNvalue).toStringAsFixed(2);
      return finalResult;
    } else {
      return "0";
    }
  }

  String finalSubResult(String nValue) {
    if (nValue.contains("\n")) {
      List<String> splitNvalue = nValue.split("\n");
      String newLastNvalue = modifications(splitNvalue.last);
      if (newLastNvalue == "") {
        newLastNvalue =
            modifications(splitNvalue.elementAt(splitNvalue.length - 2));
      }
      String finalResult = tryChatches(newLastNvalue).toStringAsFixed(2);
      return finalResult;
    } else {
      return "";
    }
  }

  String modifications(String nValue) {
    String modifiedValue = nValue.replaceAll("\n", '+');
    modifiedValue = modifiedValue.replaceAll("*-", '*(-1)*');
    // modifiedValue = modifiedValue.replaceAll("++", '+');
    // "+-" will automatically interpret() so no need to write extra coding for this
    if (modifiedValue.contains("%")) {
      modifiedValue = replacePercentage(modifiedValue);
    }

    return modifiedValue;
  }

  num tryChatches(String newNvalue) {
    try {
      return newNvalue.interpret();
    } catch (e) {
      try {
        String kk = newNvalue.substring(0, newNvalue.length - 1);
        return kk.interpret();
      } catch (e) {
        String kk = handleBrackets(newNvalue);
        try {
          return kk.interpret();
        } catch (e) {
          return 0;
        }
      }
    }
  }

  String replacePercentage(String nValue) {
    List<String> l = nValue.split("%");
    String lastValue = l.last;
    List newList = [];
    l.removeLast();

    for (String i in l) {
      var k = i.split('').reversed.join();

      List kList = k.split('');
      int findIndex = 0;
      for (String j in kList) {
        findIndex++;
        if (j == '+' || j == '-') {
          break;
        }
      }

      String kRemaining = k.substring(findIndex, k.length);

      String ksubNumber = k.substring(0, findIndex - 1);

      if (k[findIndex - 1] == "+") {
        String modifiedReverseI = "001/)" + ksubNumber + "+001(*" + kRemaining;
        String knew = modifiedReverseI.split('').reversed.join();
        newList.add(knew);
      } else {
        String modifiedReverseI = "001/)" + ksubNumber + "-001(*" + kRemaining;
        String knew = modifiedReverseI.split('').reversed.join();
        newList.add(knew);
      }
    }
    return newList.join() + lastValue;
  }

  String handleBrackets(value) {
    int openBra = 0;
    int closedBra = 0;
    String lastString = value.split("\n").last;

    if (lastString.contains("(")) {
      String lastDigitOfLastString = lastString.split('').last;

      lastString.split('').forEach((element) {
        if (element == "(") {
          openBra++;
        } else if (element == ")") {
          closedBra++;
        }
      });

      if (openBra != closedBra) {
        if (lastDigitOfLastString.contains(RegExp(r"[\d)]"))) {
          String modifiedString = value + ")" * (openBra - closedBra);
          return modifiedString;
        } else {
          String modifiedString = value.substring(0, value.length - 1) +
              ")" * (openBra - closedBra);
          return modifiedString;
        }
      } else {
        return value;
      }
    } else {
      return value;
    }
  }
}
