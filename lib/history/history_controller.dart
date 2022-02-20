import 'package:get/get.dart';
import 'package:hive/hive.dart';

final HistoryController hc = Get.put(HistoryController());

class HistoryController extends GetxController {
  Rx<bool> isHistoryOpen = false.obs;
  Rx<bool> isHistoryEmpty = false.obs;
  Rx<bool> isFavHistoryEmpty = false.obs;
  Rx<bool> isFavPressed = false.obs;

  @override
  void onInit() {
    manageRecycle();
    super.onInit();
  }

  void manageRecycle() {
    List hList = Hive.box("history").keys.toList();
    if (hList.length > 100) {
      List itemsToDelete = hList.sublist(0, hList.length - 100);
      Hive.box("history").deleteAll(itemsToDelete);
    }
  }
}
