
import 'package:get/get.dart';
final HistoryController hc = Get.put(HistoryController());
class HistoryController extends GetxController {
  Rx<bool> isHistoryOpen = false.obs;
  Rx<bool> isHistoryEmpty = false.obs;
}
