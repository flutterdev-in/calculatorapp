import 'package:calculator_04/history/history_box.dart';
import 'package:flutter/material.dart';

class HistoryBroadView extends StatelessWidget {
  HistoryBroadView({Key? key}) : super(key: key);
  HistoryBox hb = HistoryBox();

  @override
  Widget build(BuildContext context) {
    List hl = hb.listHistory();
    return Scaffold(
      body: ListView.builder(
        itemCount: hl.length,
        itemBuilder: (context, index) {
          Map m = hl[index];
          return Flexible(
              child: Column(
            children: [
              Text(m["nValue"]),
              Text(m["finalResult"]),
              Text(m["time"].toString()),
            ],
          ));
        },
      ),
    );
  }
}
