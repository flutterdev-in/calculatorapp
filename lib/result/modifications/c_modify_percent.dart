import 'package:calculator_04/useful/regex.dart';

class ModifyPercent {
  String handlePercent(String value) {
    if (value.contains("%")) {
      return handlePercent0(value);
    } else {
      return value;
    }
  }

  String handlePercent0(String value) {
    String mdValue = value;
    Iterable<String> regex(String pattern, String mdValue) {
      return RegEx().listMatch(pattern, mdValue);
    }

    for (String matchedString in regex(r'(^|^\-)(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "/100"));
    }
    for (String matchedString in regex(r'\n(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "pt"));
    }
    for (String matchedString in regex(r'\*' r'(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "/100"));
    }

    for (String matchedString in regex(r'/' r'(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "*100"));
    }

    if (mdValue.contains("%")) {
      List<String> splitMd = mdValue.split('');
      List<int> ptIndexes = [];
      int index = -1;
      for (String i in splitMd) {
        index++;
        if (i == "%") {
          ptIndexes.add(index);
        }
      }
      List<String> listOriginalSubStrings = [];
      Map<String, String> listSubStringsMaps = {};

      for (int i in ptIndexes.reversed.toList()) {
        List<String> listPtr =
            mdValue.substring(0, i).split('').reversed.toList();

        List<int> indexsPM = [];
        List<String> listSigns = [];
        int countIndex = -1;
        int countC = 0;
        for (String j in listPtr) {
          countIndex++;

          if (j == ")") {
            countC++;
          }
          if (j == "(") {
            countC--;
          }

          if (countC == 0 && (j == "+" || j == "-")) {
            indexsPM.add(countIndex);
            listSigns.add(j);
          }
          if (countC == -1 && j == "(") {
            indexsPM.add(countIndex);
            listSigns.add(j);
          }
          if (indexsPM.length == 2) {
            break;
          }
        }
        String rightString =
            listPtr.join().substring(0, indexsPM[0]).split('').reversed.join();
        String leftString = "";
        if (indexsPM.length == 2) {
          leftString = listPtr
              .join()
              .substring(indexsPM[0] + 1, indexsPM[1])
              .split('')
              .reversed
              .join();
        } else if (indexsPM.length == 1) {
          leftString = listPtr
              .join()
              .substring(indexsPM[0] + 1, listPtr.length)
              .split('')
              .reversed
              .join();
        }
        String originalString = leftString + listSigns[0] + rightString + "%";
        String replaceString =
            leftString + listSigns[0] + "(($leftString)*$rightString/100)";
        listOriginalSubStrings.add(originalString);
        listSubStringsMaps.addAll({originalString: replaceString});
      }
      listOriginalSubStrings.sort((a, b) => b.length.compareTo(a.length));

      if (listOriginalSubStrings.isNotEmpty) {
        for (String i in listOriginalSubStrings) {
          mdValue = mdValue.replaceAll(i, listSubStringsMaps[i] ?? i);
        }
      }
    }
    return mdValue;
  }
}
