import 'package:calculator_04/ac_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';
import 'package:intl/intl.dart';
import 'package:num_utilities/num_utilities.dart';

class ResultW extends StatelessWidget {
  ResultW({Key? key}) : super(key: key);
  ButtonsController b = Get.put(ButtonsController());

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    Resultfunctios rf = Resultfunctios();
    return Container(
      width: double.infinity,
      color: Colors.green,
      height: md.height / 8,
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
      num finalResult0 = tryChatches(newNvalue);
      String finalResult = indianStyle(finalResult0);
      return finalResult;
    } else {
      return "0";
    }
  }

  // Final sub result
  String finalSubResult(String nValue) {
    if (nValue.contains("\n")) {
      List<String> splitNvalue = nValue.split("\n");
      String newLastNvalue = modifications(splitNvalue.last);
      if (newLastNvalue == "") {
        newLastNvalue =
            modifications(splitNvalue.elementAt(splitNvalue.length - 2));
      }
      num finalResult0 = tryChatches(newLastNvalue);
      String finalResult = indianStyle(finalResult0);
      return finalResult;
    } else {
      return "";
    }
  }

  String modifications(String nValue) {
    String modifiedValue = nValue.replaceAll("\n", '+');
    modifiedValue = modifiedValue.replaceAll("*-", '*(-1)*');
    modifiedValue = modifiedValue.replaceAll("+-", '-');
    // modifiedValue = modifiedValue.replaceAll("++", '+');
    // "+-" will automatically interpret() so no need to write extra coding for this
    if (modifiedValue.contains("%")) {
      modifiedValue = replacePercentage(modifiedValue);
      modifiedValue = modifiedValue.replaceAll("+*", '*');
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

  String indianStyle(num finalResultValue) {
    //
    // convert powers to unicodes
    String tenPowerInUnicode(String power) {
      String tenPowerInUnicode = '';
      List<String> unicodes = [
        "\u2070",
        "\u00B9",
        "\u00B2",
        "\u00B3",
        "\u2074",
        "\u2075",
        "\u2076",
        "\u2077",
        "\u2078",
        "\u2079"
      ]; // from 0-9
      List<String> eachDigit = power.toString().split('');

      for (String i in eachDigit) {
        int digit = int.parse(i);
        tenPowerInUnicode = tenPowerInUnicode + unicodes[digit];
      }
      return tenPowerInUnicode;
    }

    String forPositive(num finalResult) {
      if (finalResult.toString().contains("nfinity")) {
        return finalResult.toString();
      } else if (finalResult.toString().contains("e+")) {
        print(finalResult.toString());
        String power = finalResult.toString().split("+").last;
        String first = "";
        try {
          first = num.parse(
                  finalResult.toString().split("e+").first.substring(0, 5))
              .roundToPrecision(2)
              .toString();
        } catch (e) {
          try {
            first = num.parse(
                    finalResult.toString().split("e+").first.substring(0, 4))
                .roundToPrecision(1)
                .toString();
          } catch (e) {
            first = finalResult.toString().split("e+").first;
          }
        }

        String finalString = first + " x10" + tenPowerInUnicode(power);
        return finalString;
      } else {
        if (finalResult < 1000000000) {
          String beforeDot = finalResult.toString().split(".").first;
          String afterDot =
              finalResult.roundToPrecision(2).toString().split(".").last;
          num beforeDotNum = int.parse(beforeDot);
          NumberFormat indFormat = NumberFormat.currency(locale: 'HI');
          beforeDot = indFormat.format(beforeDotNum);
          beforeDot = beforeDot.replaceAll("INR", "");
          beforeDot = beforeDot.split('.').first;
          return beforeDot + "." + afterDot;
        } else if (finalResult >= 1000000000 && finalResult < 100000000000) {
          num croreValue = finalResult / 10000000;
          String finalString =
              croreValue.roundToPrecision(2).toString() + " x10\u2077";
          return finalString;
        } else {
          String first7 = finalResult.toString().substring(0, 5);

          first7 = (int.parse(first7) / 1000).roundToPrecision(2).toString();

          int after7length =
              finalResult.toString().split(".").first.substring(1).length - 1;

          String finalString =
              first7 + " x10" + tenPowerInUnicode(after7length.toString());
          return finalString;
        }
      }
    }

    if (finalResultValue < 0) {
      num converttoPositive = -1 * finalResultValue;
      return "-" + forPositive(converttoPositive);
    } else {
      return forPositive(finalResultValue);
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
