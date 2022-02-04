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

    for (String matchedString
        in regex(r'[^|(^\()]'  r'(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "/100"));
    }

    for (String matchedString in regex(r'\*'  r'(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "/100"));
    }

    for (String matchedString in regex(r'/'  r'(\d+(\.\d+)?)%', mdValue)) {
      mdValue = mdValue.replaceAll(
          matchedString, matchedString.replaceAll("%", "*100"));
    }

    for (String matchedString
        in regex(r'(\d+(\.\d+)?)\+(\d+(\.\d+)?)%', mdValue)) {
      String beforePlus = matchedString.split("+").first;
      String afterPlus = matchedString.split("+").last.replaceAll("%", "");
      String mdString = beforePlus + "+" + "($beforePlus*$afterPlus/100)";
      mdValue = mdValue.replaceAll(matchedString, mdString);
    }

    for (String matchedString
        in regex(r'(\d+(\.\d+)?)\-(\d+(\.\d+)?)%', mdValue)) {
      String beforePlus = matchedString.split("-").first;
      String afterPlus = matchedString.split("-").last.replaceAll("%", "");
      String mdString = beforePlus + "-" + "($beforePlus*$afterPlus/100)";
      mdValue = mdValue.replaceAll(matchedString, mdString);
    }

    if (value.contains(RegExp(r'\)[\+\-](\d+(\.\d+)?)%'))) {
      List beforeSL = value.split(RegExp(r'\)[\+\-](\d+(\.\d+)?)%'));
      beforeSL.removeLast();
      List matchedStrings = [];
      for (String matchedS in regex(r'\)[\+\-](\d+(\.\d+)?)%', mdValue)) {
        matchedStrings.add(matchedS);
      }

      int index = 0;
      for (String bS in beforeSL) {
        String mS = matchedStrings[index];
        String sign = mS.substring(1, 2);
        index++;
        String braS = '';
        int findOpen = 1;
        List reverseS = bS.split('').reversed.join().split('');
        for (String i in reverseS) {
          braS = braS + i;
          if (i == ")") {
            findOpen++;
          } else if (i == "(") {
            findOpen--;
          }
          if (findOpen == 0) {
            break;
          }
        }
        String oldReplace = braS.split('').reversed.join() + mS;
        braS = braS.split('').reversed.join() + ")";
        mS = mS.replaceAll(")+", "");
        mS = mS.replaceAll(")-", "");
        mS = mS.replaceAll("%", "");
        String newReplace = braS + sign + "($braS*$mS/100)";
        mdValue = mdValue.replaceAll(oldReplace, newReplace);
      }
    }
    return mdValue;
  }
  // for (String matchedString in regex(
  //     r'^' + r'(/|\d|\.|\*|(\([^\(\)]+\)))+' + r'[\+\-]' + r'(\d+(\.\d+)?)%',
  //     mdValue)) {
  //   String startString =
  //       matchedString.split(RegExp(r'[\+\-](\d+(\.\d+)?)%')).first;

  //   String rightString =
  //       matchedString.replaceAll(startString, "").replaceAll("%", "");
  //   String middleSign = rightString.substring(0, 1);
  //   String percentageString = rightString.substring(1);
  //   String mdString =
  //       startString + middleSign + "(($startString)*$percentageString/100)";
  //   mdValue = mdValue.replaceAll(matchedString, mdString);
  // }

  // for (String matchedString in regex(
  //     r'[\+\-]' +
  //         r'(/|\d|\.|\*|(\([^\(\)]+\)))+' +
  //         r'[\+\-]' +
  //         r'(\d+(\.\d+)?)%',
  //     mdValue)) {
  //   String startSign = matchedString.substring(0, 1);
  //   String startString = matchedString
  //       .split(RegExp(r'[\+\-](\d+(\.\d+)?)%'))
  //       .first
  //       .substring(1);
  //   String rightString = matchedString
  //       .replaceAll(startSign + startString, "")
  //       .replaceAll("%", "");
  //   String middleSign = rightString.substring(0, 1);
  //   String percentageString = rightString.substring(1);
  //   String mdString = startSign +
  //       startString +
  //       middleSign +
  //       "(($startString)*$percentageString/100)";
  //   mdValue = mdValue.replaceAll(matchedString, mdString);
  // }

}
