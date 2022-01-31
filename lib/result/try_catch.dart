import 'package:function_tree/function_tree.dart';

class TryCatches {
  num tc(String modifiedN) {
    try {
      return modifiedN.interpret();
    } catch (e) {
      try {
        String kk = modifiedN.substring(0, modifiedN.length - 1);
        return kk.interpret();
      } catch (e) {
        String kk = handleBrackets(modifiedN);
        try {
          return kk.interpret();
        } catch (e) {
          return 0.000001;
        }
      }
    }
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
        if (lastDigitOfLastString.contains(RegExp(r"\d"))) {
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
