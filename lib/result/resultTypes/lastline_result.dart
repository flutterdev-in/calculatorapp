import 'package:calculator_04/result/formats/indian_style.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/resultTypes/sub_result.dart';
import 'package:calculator_04/result/try_catch.dart';

class LLR {
  String lastLineResult(String nValue) {
    if (nValue.contains("\n")) {
      List<String> splitNvalue = nValue.split("\n");
      if (splitNvalue.length < 3 && splitNvalue.last == "") {
        return "  ";
      } else {
        String newLastNvalue = Modifications().modifications(splitNvalue.last);
        num finalResult0 = TryCatches().tc(newLastNvalue);
        if (finalResult0 == 0.000001) {
          return "  ";
        } else {

          String finalResult = IndianStyle().indianStyle(finalResult0);
          return finalResult;
        }
      }
    } else {
      return "  ";
    }
  }
}
