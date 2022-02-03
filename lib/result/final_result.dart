import 'package:calculator_04/useful/regex.dart';
import 'package:calculator_04/result/indian_style.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';

class FR {
  String finalMainResult(String nValue) {
    // return subResult(nValue) + lastLineResult(nValue);
    if (nValue.isEmpty) {
      return "";
    } else if (!nValue.contains("\n")) {
      String newNvalue = Modifications().modifications(nValue);

      num finalResult0 = TryCatches().tc(newNvalue);

      if (finalResult0 == 0.000001) {
        return "invalid";
      } else {
        String finalResult = IndianStyle().indianStyle(finalResult0);

        return finalResult;
      }
    } else if (nValue.contains("\n")) {
      String first = nValue.split(RegExp(r'\n[^\n]*$')).first;
      String last = '';
      for (String matchedString in RegEx().listMatch(r'\n[^\n]*$', nValue)) {
        last = matchedString;
      }
      first = progress(first);
      first =
          first.replaceAll("x", "*").replaceAll(",", "").replaceAll(" ", "");
      String finalS = first + last;
      return progress(finalS);
    } else {
      return "";
    }
  }

  String progress(String value) {
    String newNvalue = Modifications().modifications(value);
    num finalResult0 = TryCatches().tc(newNvalue);
    if (finalResult0 == 0.000001) {
      return "invalid";
    } else {
      String finalResult = IndianStyle().indianStyle(finalResult0);
      return finalResult;
    }
  }

  String subResult(String nValue) {
    if (nValue.contains("\n")) {
      nValue = nValue.replaceAll(RegExp(r'\n[^\n]*$'), "");

      String newNvalue = Modifications().modifications(nValue);
      num finalResult0 = TryCatches().tc(newNvalue);
      if (finalResult0 == 0.000001) {
        return "invalid";
      } else {
        String finalResult = IndianStyle().indianStyle(finalResult0);
        return finalResult;
      }
    } else {
      return "";
    }
  }

  String lastLineResult(String nValue) {
    if (nValue.contains("\n")) {
      List<String> splitNvalue = nValue.split("\n");
      if (splitNvalue.length < 3 && splitNvalue.last == "") {
        return "";
      } else {
        String newLastNvalue = Modifications().modifications(splitNvalue.last);
        // if (newLastNvalue == "") {
        //   newLastNvalue = Modifications()
        //       .modifications(splitNvalue.elementAt(splitNvalue.length - 2));
        // }
        num finalResult0 = TryCatches().tc(newLastNvalue);
        if (finalResult0 == 0.000001) {
          return "";
        } else {
          String finalResult = IndianStyle().indianStyle(finalResult0);
          return finalResult;
        }
      }
    } else {
      return "";
    }
  }
}
