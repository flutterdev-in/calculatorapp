import 'package:calculator_04/result/modifications/c_modify_percent.dart';
import 'package:calculator_04/result/modifications/d_modify_powers.dart';

class Modifications {
  //
  String modifications(String nValue) {
    String modifiedValue = nValue
        // .replaceAll(" ", '')
        .replaceAll("\u00D7", '*')
        .replaceAll("\n+", '+')
        .replaceAll("\n-", '-')
        .replaceAll("\n*", '*')
        .replaceAll("\n/", '/')
        .replaceAll("\n", '+')
        .replaceAll("*-", '*(-1)*')
        .replaceAll("+-", '-')
        .replaceAll("+*", '*')
        .replaceAll("+/", '/');

    modifiedValue = ModifyPowers().handlePowers(modifiedValue);

    modifiedValue = ModifyPercent().handlePercent(modifiedValue);

    return modifiedValue;
  }
}
