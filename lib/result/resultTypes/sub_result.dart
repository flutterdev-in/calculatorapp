import 'package:calculator_04/result/formats/indian_style.dart';
import 'package:calculator_04/result/modifications/_modifications.dart';
import 'package:calculator_04/result/try_catch.dart';

class SR{
  
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
      return "  ";
    }
  }
}