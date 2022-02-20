import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/result/resultTable/result_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryWidget extends StatelessWidget {
  HistoryWidget({Key? key}) : super(key: key);
  HistoryBox hb = HistoryBox();
  final MainController b = Get.put(MainController());
  final HistoryController hc = Get.put(HistoryController());
  final ResultController r = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    List hList = Hive.box("history").keys.toList().reversed.toList();

    return ListView.builder(
      itemCount: hList.length,
      itemBuilder: (context, index) {
        Map m = Hive.box("history").get(hList[index]);
        final DateFormat formatter = DateFormat("dd MMM yyyy, h:mm a");
        final String time = formatter.format(m["time"] ?? "");
        return Dismissible(
          background: Center(
            child: Text(
              "Item moved to favorites",
              style: TextStyle(color: Color(sc.actionButtonsColor.value)),
            ),
          ),
          secondaryBackground: Center(
            child: Text(
              "Item deleted",
              style: TextStyle(color: Color(sc.grossResultFontColor.value)),
            ),
          ),
          key: ObjectKey(time),
          onDismissed: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              await Hive.box("favhistory").add(m);
            }
            await Hive.box("history").delete(hList[index]);
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 1),
                    child: Text(time,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: Color(sc.actionButtonsColor.value),
                        )),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: Icon(
                        MdiIcons.tableArrowRight,
                        color: Color(sc.actionButtonsColor.value),
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      r.tableString.value = m["nValue"] ?? "";
                      r.tsr.value = m["srValue"] ?? "";
                      r.tgr.value = m["grValue"] ?? "";
                      Get.to(
                        TableResult(),
                        transition: Transition.leftToRightWithFade,
                        opaque: false,
                      );
                    },
                    highlightColor: Color(sc.onTapColor.value),
                    splashColor: Color(sc.onTapColor.value),
                    radius: 30,
                  ),
                ],
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 1),
                  child: InkWell(
                    onTap: () {
                      b.n.value = m["nValue"];
                      b.p.value = b.n.value.length;
                      r.precision.value = m["precision"];
                    },
                    child: ParsedText(
                      text: m["nValue"] ?? "",
                      textScaleFactor: 1.4,
                      style: TextStyle(
                        color: Color(sc.displayFontColor.value),
                      ),
                      parse: <MatchText>[
                        MatchText(
                          pattern: r"[/\+\-\u00D7\(\)%]",
                          style: TextStyle(
                            color: Color(sc.operatorsColor.value),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 1),
                  child: InkWell(
                    onTap: () {
                      b.n.value = b.n.value +
                          m["grValue"]
                              .replaceAll(",", "")
                              .replaceAll("'", "")
                              .replaceAll(" ", "");
                      b.p.value = b.n.value.length;
                    },
                    child: Text(m["grValue"] ?? "",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Color(sc.grossResultFontColor.value),
                        )),
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
              Divider(
                  thickness: 1,
                  color: Color(sc.screenBackgroundColor.value),
                  height: 10),
            ],
          ),
        );
      },
    );
  }
}
