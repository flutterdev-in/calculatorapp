import 'package:calculator_04/result/controllers/result_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryBox {
  final ResultController r = Get.put(ResultController());
  List listHistory() {
    return Hive.box("history").values.toList().reversed.toList();
  }

  void addItemToHistoryBox(String nValue) {
    DateTime time = DateTime.now();
    Map map = {"time": time,"nValue": nValue,"srValue":r.sr.value, "grValue": r.gr.value,"precision" :r.precision.value};
    Hive.box("history").add(map);
  }
}
