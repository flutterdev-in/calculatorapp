import 'package:calculator_04/result/final_result.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryBox {

  List listHistory() {
    return Hive.box("history").values.toList().reversed.toList();
  }

  void addItemToHistoryBox(String nValue) {
    String finalResult = FR().finalMainResult(nValue);
    DateTime time = DateTime.now();
    Map map = {"nValue": nValue, "finalResult": finalResult, "time": time};
    // int key = listHistory().length + 1;
    Hive.box("history").add(map);
  }
}
