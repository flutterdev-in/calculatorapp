import 'package:calculator_04/useful/regex.dart';

class ModifyPowers {
  Map map = {
    "\u2070": "0",
    "\u00B9": "1",
    "\u00B2": "2",
    "\u00B3": "3",
    "\u2074": "4",
    "\u2075": "5",
    "\u2076": "6",
    "\u2077": "7",
    "\u2078": "8",
    "\u2079": "9",
    "\u22C5": ".",
    "\u207A": "+",
    "\u207B": "-",
    "\u02E3": "*",
    "\u141F": "/",
    "\u207D": "(",
    "\u207E": ")"
  };

  String handlePowers(String modifiedValue) {
    String newModifiedValue = modifiedValue;
    Iterable<String> regex(String pattern) {
      return RegEx().listMatch(pattern, newModifiedValue);
    }

    for (String matchedString in regex(
        r'[\u2070\u00B9\u00B2\u00B3\u2074\u2075\u2076\u2077\u2078\u2079\u22C5\u207A\u207B\u02E3\u141F\u207D\u207E]+')) {
      String modifiedV = '';
      for (String i in matchedString.split('')) {
        modifiedV = modifiedV + map[i];
      }
      modifiedV = "^(" + modifiedV + ")";
      newModifiedValue = newModifiedValue.replaceAll(matchedString, modifiedV);
    }

    return newModifiedValue;
  }
}
