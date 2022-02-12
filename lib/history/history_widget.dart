import 'package:calculator_04/history/history_box.dart';
import 'package:calculator_04/controller/main_controller.dart';
import 'package:calculator_04/history/history_controller.dart';
import 'package:calculator_04/result/controllers/result_controller.dart';
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
              "item deleted",
              style: TextStyle(color: Colors.red),
            ),
          ),
          key: ObjectKey(time),
          onDismissed: (direction) async {
            await Hive.box("history").delete(hList[index]);
          },
          child: InkWell(
            onTap: () {
              b.n.value = m["nValue"];
              b.p.value = b.n.value.length;
              r.precision.value = m["precision"];
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
                            color: Colors.brown,
                          )),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                        child: Row(
                          children: [
                            Text("R(" + m["precision"].toString() + ")  ",style: TextStyle(color: Colors.brown,
                              fontSize: 10,),),
                            Icon(
                              MdiIcons.tableArrowRight,
                              color: Colors.brown,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        r.tableString.value = m["nValue"] ?? "";
                        r.tsr.value = m["srValue"] ?? "";
                        r.tgr.value = m["grValue"] ?? "";
                        Get.to(TableResult());
                      },
                      highlightColor: Colors.pink.shade900,
                      splashColor: Colors.pink.shade900,
                      radius: 30,
                    ),
                  ],
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 1),
                    child: ParsedText(
                      text: m["nValue"] ?? "",
                      textScaleFactor: 1.4,
                      style: TextStyle(color: Colors.white70),
                      parse: <MatchText>[
                        MatchText(
                          pattern: r"[/\+\-\u00D7\(\)%]",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
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
                    child: Text(m["grValue"] ?? "",
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.yellow.shade300)),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                Divider(color: Colors.white24, height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
