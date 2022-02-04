import 'package:calculator_04/result/final_result.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HistoryController extends GetxController {
  Rx<bool> isHistoryOpen = false.obs;
  Rx<bool> isHistoryEmpty = false.obs;
  RxList rxLH = [0, "", null].obs;
  @override
  void onInit() {
    rxLH.value = Hive.box("history").values.toList().reversed.toList();
    super.onInit();
  }

  void addItemToHistoryBox(String nValue) {
    String finalResult = FR().finalMainResult(nValue);
    DateTime time = DateTime.now();
    Map map = {"nValue": nValue, "finalResult": finalResult, "time": time};
    Hive.box("history").add(map);
  }
}
