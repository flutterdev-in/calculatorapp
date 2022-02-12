import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:calculator_04/result/resultTypes/final_result.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryBox {
  final ResultController r = Get.put(ResultController());
  List listHistory() {
    return Hive.box("history").values.toList().reversed.toList();
  }

  void addItemToHistoryBox(String nValue) {
    String finalResult = r.gr.value;
    DateTime time = DateTime.now();
    Map map = {"nValue": nValue, "finalResult": finalResult, "time": time};
    // int key = listHistory().length + 1;
    Hive.box("history").add(map);
  }
}
