import 'dart:convert';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:num_utilities/src/num_utilities.dart'; // do not delete, roundToPrecision using this
import 'package:function_tree/function_tree.dart';

final ResultController rc = Get.put(
  ResultController(),
  permanent: true,
);

class ResultController extends GetxController {
  Box sbox = Hive.box("settings");
  Rx<String> gr = "0".obs;
  Rx<String> sr = "".obs;
  Rx<String> llr = "".obs;
  Rx<String> tableString = "".obs;
  Rx<String> tsr = "".obs;
  Rx<String> tgr = "".obs;
  Rx<int> nf = 33.obs;
  Rx<int> precision = 2.obs;
  Rx<String> commaSymbol = ",".obs;
  Rx<bool> isPrimaryComma = true.obs;
  Rx<int> primaryCommaPosition = 33.obs;
  Rx<int> secondaryCommaPosition = 0.obs;

  @override
  void onInit() async {
    await init();

    super.onInit();
  }

  @override
  void onClose() {
    HistoryBox hb = HistoryBox();
    if (!mc.n.value.contains(RegExp(r'^[^\d]*$'))) {
      hb.addItemToHistoryBox(mc.n.value);
      hc.isFavPressed.value = false;
    }
    super.onClose();
  }

  void allResults(String nValue) {
    grossResult(nValue);
    subResult(nValue);
    lastLineResult(nValue);
  }

  void subResult(String nValue) {
    if (nValue.contains("\n")) {
      nValue = nValue.replaceAll(RegExp(r'\n[^\n]*$'), "");
      String newNvalue = Modifications().modifications(nValue);
      num finalResult0 = TryCatches().tc(newNvalue);
      if (finalResult0 == 0.1921465) {
        sr.value = "invalid";
      } else {
        sr.value = resultString(finalResult0);
      }
    } else {
      sr.value = "";
    }
  }

  void lastLineResult(String nValue) {
    if (nValue.contains("\n")) {
      List<String> splitNvalue = nValue.split("\n");
      if (splitNvalue.length < 3 && splitNvalue.last == "") {
        llr.value = "";
      } else if (nValue.contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*'))) {
        llr.value = "";
      } else {
        String newLastNvalue = Modifications().modifications(splitNvalue.last);
        num finalResult0 = TryCatches().tc(newLastNvalue);
        if (finalResult0 == 0.1921465) {
          llr.value = "";
        } else {
          llr.value = resultString(finalResult0);
        }
      }
    } else {
      llr.value = "";
    }
  }

  void grossResult(String nValue) {
    String nValue0 = "";
    if (nValue.contains(RegExp(r'\n(\u00D7|/|\d+(\.\d*)?%)[^\n]*$'))) {
      nValue0 = sr.value + "\n" + nValue.split("\n").last;
    } else {
      nValue0 = nValue;
    }

    String newLastNvalue = Modifications().modifications(nValue0);
    num resultNum = TryCatches().tc(newLastNvalue);

    if (resultNum == 0.1921465) {
      gr.value = "";
    } else {
      gr.value = resultString(resultNum);
    }
  }

  String resultString(num resultNum) {
    if (resultNum.toString().contains("nfinity")) {
      return resultNum.toString();
    } else if (resultNum.toString().contains("e+")) {
      return resultIfE(resultNum);
    } else if (resultNum.abs() < 1000000000) {
      String precisionS = roundNum(resultNum);
      return numFormat(precisionS);
    } else {
      return manageDigitForLargeNumber(resultNum);
    }
  }

  String manageDigitForLargeNumber(num resultNum) {
    String newResultString;
    if (nf.value == 23 && resultNum < ("10^16").interpret()) {
      num newResultNum = resultNum / 10000000;
      String precisionS = roundNum(newResultNum);
      newResultString = numFormat(precisionS);
      return newResultString + " \u00D710" + tenPowerInUnicode("7");
    } else if (nf.value == 33 && resultNum < ("10^21").interpret()) {
      num newResultNum = resultNum / 1000000000;
      String precisionS = roundNum(newResultNum);
      newResultString = numFormat(precisionS);
      return newResultString + " \u00D710" + tenPowerInUnicode("9");
    } else {
      int length = resultNum.toString().split(".").first.length;
      int digit = length - 2;
      num arv = resultNum / ("10^$digit").interpret();
      if (precision.value < 2) {
        precision.value = 2;
      }
      arv = arv.roundToPrecision(precision.value);
      return arv.toString() + " \u00D710" + tenPowerInUnicode(digit.toString());
    }
  }

  String numFormat(String roundS) {
    String bfd = roundS.split(".").first;
    String afd = roundS.split(".").last;
    if (nf.value == 23) {
      NumberFormat nfm = NumberFormat.currency(locale: "hi");
      bfd = nfm.format(num.parse(bfd));
    } else if (nf.value == 33) {
      NumberFormat nfm = NumberFormat.currency(locale: "en_US");
      bfd = nfm.format(num.parse(bfd));
    }
    bfd = bfd.replaceAll(RegExp(r'[^\-\d\.\,]*'), "");
    bfd = bfd.split(".").first.replaceAll(",", commaSymbol.value);

    if (roundS.contains(".")) {
      return bfd + "." + afd;
    } else {
      return bfd;
    }
  }

  String roundNum(num num) {
    List rl =
        num.roundToPrecision(precision.value).toString().split(".").toList();
    String result = '';
    if (precision <= 0) {
      result = rl.first;
    } else if (rl.length == 1) {
      String afterDot = "0" * precision.value;
      result = rl.first + "." + afterDot;
    } else {
      String afterDot = rl.last + "0" * precision.value;
      afterDot = afterDot.substring(0, precision.value);
      result = rl.first + "." + afterDot;
    }
    return result;
  }

  String resultIfE(num resultNum) {
    List arEL = resultNum.toString().split("e+");
    String first = arEL.first;
    String last = arEL.last;
    int prsn = precision.value < 0 ? 2 : precision.value;

    if (first.contains(".")) {
      first = num.parse(first).roundToPrecision(prsn).toString();

      first = first + "0" * prsn;
      first = first.substring(0, prsn + 2);
    }
    return first + " \u00D710" + tenPowerInUnicode(last);
  }

  Future<void> init() async {
    commaSymbol.value = sbox.get(bm.commaSymbol) ?? ",";
    precision.value = sbox.get(bm.precision) ?? 2;
    secondaryCommaPosition.value = sbox.get(bm.secondaryCommaPosition) ?? 0;

    Future<int> primaryComma() async {
      int c = 33;
      try {
        await http.get(Uri.parse('http://ip-api.com/json')).then((value) {
          String countryCode =
              json.decode(value.body)['countryCode'].toString().toUpperCase();
          sbox.put("countryCode", countryCode);
          if (countryCode.contains(RegExp(r'IN|PK|NP|BD|LK'))) {
            c = 23;
          }
        });
      } catch (err) {}
      return c;
    }

    if (sbox.get(bm.primaryCommaPosition) == null) {
      await sbox.put(bm.primaryCommaPosition, await primaryComma());
    }
    primaryCommaPosition.value = sbox.get(bm.primaryCommaPosition) ?? 33;
    nf.value = primaryCommaPosition.value;
  }
}

// HelperFunctions
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


  


  // String manageDigitForLargeNumber(num resultNum) {
  //   int length = resultNum.toString().split(".").first.length;
  //   int digit = length - 2;
  //   if (nf.value == 223) {
  //     digit = length - length % 2 - 1;
  //   } else if (nf.value == 333) {
  //     digit = length - length % 3;
  //     if (length % 3 == 0) {
  //       digit = length - 3;
  //     }
  //   }

  //   num arv = resultNum / ("10^$digit").interpret();
  //   if (precision.value < 2) {
  //     precision.value = 2;
  //   }
  //   arv = arv.roundToPrecision(precision.value);
  //   return arv.toString() + " \u00D710" + tenPowerInUnicode(digit.toString());
  // }
