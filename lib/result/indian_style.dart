import 'package:intl/intl.dart';
import 'package:num_utilities/src/num_utilities.dart';

class IndianStyle {
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
}
