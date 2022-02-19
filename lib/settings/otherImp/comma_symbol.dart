import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CommaSymbol extends StatelessWidget {
  const CommaSymbol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rc.commaSymbol.value = sbox.get(bm.commaSymbol) ?? ",";
    return Card(
        color: Colors.white12,
        child: ListTile(
          title: const Text("Comma symbol"),
          trailing: SizedBox(
            width: 110,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Text(
                      "d,d",
                      style: TextStyle(
                        color: rc.commaSymbol.value == ","
                            ? Colors.purple
                            : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (rc.commaSymbol.value != ",") {
                        rc.commaSymbol.value = ",";
                      }
                      sbox.put(bm.commaSymbol, ",");
                    },
                  ),
                  IconButton(
                    icon: Text(
                      "d'd",
                      style: TextStyle(
                        color: rc.commaSymbol.value == "'"
                            ? Colors.purple
                            : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (rc.commaSymbol.value != "'") {
                        rc.commaSymbol.value = "'";
                      }
                      sbox.put(bm.commaSymbol, "'");
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
