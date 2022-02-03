import 'package:calculator_04/history/history_box.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  Rx<bool> isHistoryOpen = false.obs;
  RxList historyList = HistoryBox().listHistory().obs;
}
