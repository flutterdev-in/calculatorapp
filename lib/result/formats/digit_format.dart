import 'package:intl/intl.dart';
import 'package:num_utilities/src/num_utilities.dart';

class DF {
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

  String commaFormat(num finalResult, String type) {
    String beforeDot = finalResult.toString().split(".").first;
    String afterDot = finalResult.toString().split(".").last + "0000";
    num beforeDotNum = int.parse(beforeDot);
    if (int.parse(afterDot.substring(0, 3)) >= 995) {
      afterDot = "00";
      beforeDotNum = beforeDotNum + 1;
    } else {
      afterDot = finalResult.roundToPrecision(2).toString().split(".").last;
    }

    if (type == "23") {
      beforeDot = beforeDot.replaceAll("USD", "");
      beforeDot = beforeDot.split('.').first;
      return beforeDot + "." + afterDot;
    } else if (type == "33") {
      beforeDot = beforeDot.replaceAll("USD", "");
      beforeDot = beforeDot.split('.').first;
      return beforeDot + "." + afterDot;
    } else {
      return beforeDot + "." + afterDot;
    }
  }

  String digitFormat(num finalResultValue, String type) {
    //
    // convert powers to unicodes

    String forPositive(num finalResult) {
      if (finalResult.toString().contains("nfinity")) {
        return finalResult.toString();
      } else if (finalResult.toString().contains("e+")) {
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
          return commaFormat(finalResult, type);
          // String beforeDot = finalResult.toString().split(".").first;
          // String afterDot = finalResult.toString().split(".").last + "0000";
          // num beforeDotNum = int.parse(beforeDot);
          // if (int.parse(afterDot.substring(0, 3)) >= 995) {
          //   afterDot = "00";
          //   beforeDotNum = beforeDotNum + 1;
          // } else {
          //   afterDot =
          //       finalResult.roundToPrecision(2).toString().split(".").last;
          // }

          // NumberFormat indFormat = NumberFormat.currency(locale: 'en_US');
          // beforeDot = indFormat.format(beforeDotNum);
          // beforeDot = beforeDot.replaceAll("USD", "");
          // beforeDot = beforeDot.split('.').first;
          // return beforeDot + "." + afterDot;
        } else if (finalResult >= 1000000000 && finalResult < 1000000000000) {
          num croreValue = finalResult / 1000000000;
          String finalString =
              croreValue.roundToPrecision(2).toString() + " x10\u2079";
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

    if (finalResultValue <= -1) {
      num converttoPositive = -1 * finalResultValue;
      return "-" + forPositive(converttoPositive);
    }
    if (finalResultValue < 1 && finalResultValue > -1) {
      if (finalResultValue == 0) {
        return "0";
      } else {
        String sign = finalResultValue.isNegative ? "-" : "";

        finalResultValue = finalResultValue.isNegative
            ? -1 * finalResultValue
            : finalResultValue;
        if (finalResultValue >= 0.01) {
          return sign + forPositive(finalResultValue);
        } else if (finalResultValue.toString().contains("e-")) {
          String f0 = "${finalResultValue}000".substring(0, 4);
          String f1 = finalResultValue.toString().split("e-").last;
          f1 = tenPowerInUnicode(f1.toString());

          return sign + f0 + "\u00D710\u207B" + f1;
        } else {
          String afterZeros = finalResultValue
              .toString()
              .replaceAll(RegExp(r'0\.0+'), "")
              .replaceAll("e-", "");

          int countZeros = finalResultValue
                  .toString()
                  .replaceAll(afterZeros, "")
                  .replaceAll("0.", "")
                  .length +
              1;
          afterZeros = afterZeros + "00000";

          String f0 =
              afterZeros.substring(0, 1) + "." + afterZeros.substring(1, 3);
          String f1 = tenPowerInUnicode(countZeros.toString());
          return sign + f0 + "\u00D710\u207B" + f1;
        }
      }
    } else {
      return forPositive(finalResultValue);
    }
  }
}
