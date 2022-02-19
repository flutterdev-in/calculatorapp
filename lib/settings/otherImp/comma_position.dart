import 'package:calculator_04/controllers/result_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';

class CommaPosition extends StatelessWidget {
  const CommaPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white12,
        child: ExpansionTile(title: const Text("Result format"), children: [
          Obx(
            () => Column(
              children: [
                commaPosition(),
                commaSymbol(),
              ],
            ),
          ),
        ]));
  }

  Widget commaPosition() {
    int _primaryCommaPosition = sbox.get(bm.primaryCommaPosition) ?? 33;
    int _secondaryCommaPosition = sbox.get(bm.secondaryCommaPosition) ?? 0;
    Rx<int> primaryCommaPosition = _primaryCommaPosition.obs;
    Rx<int> secondaryCommaPosition = _secondaryCommaPosition.obs;
    return Column(
      children: [
        Text("Comma position"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Primary",
                  style: TextStyle(color: Colors.green),
                ),
                GFButton(
                  onPressed: () {
                    primaryCommaPosition.value = 33;
                    if (rc.isPrimaryComma.value) {
                      rc.nf.value = 33;
                    }
                    sbox.put(bm.primaryCommaPosition, 33);
                  },
                  text: "ddd,ddd,ddd",
                  type: GFButtonType.outline,
                  color: primaryCommaPosition.value == 33
                      ? Colors.green
                      : Colors.white,
                ),
                GFButton(
                  onPressed: () {
                    primaryCommaPosition.value = 23;
                    if (rc.isPrimaryComma.value) {
                      rc.nf.value = 23;
                    }
                    sbox.put(bm.primaryCommaPosition, 23);
                  },
                  text: "dd,dd,ddd",
                  type: GFButtonType.outline,
                  color: primaryCommaPosition.value == 23
                      ? Colors.green
                      : Colors.white,
                ),
                GFButton(
                  onPressed: () {
                    primaryCommaPosition.value = 0;
                    if (rc.isPrimaryComma.value) {
                      rc.nf.value = 0;
                    }

                    sbox.put(bm.primaryCommaPosition, 0);
                  },
                  text: "dddddddd",
                  type: GFButtonType.outline,
                  color: (primaryCommaPosition.value != 33 &&
                          primaryCommaPosition.value != 23)
                      ? Colors.green
                      : Colors.white,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Secondary",
                  style: TextStyle(color: Colors.orange),
                ),
                GFButton(
                  onPressed: () {
                    secondaryCommaPosition.value = 33;
                    if (!rc.isPrimaryComma.value) {
                      rc.nf.value = 33;
                    }
                    sbox.put(bm.secondaryCommaPosition, 33);
                  },
                  text: "ddd,ddd,ddd",
                  type: GFButtonType.outline,
                  color: secondaryCommaPosition.value == 33
                      ? Colors.orange
                      : Colors.white,
                ),
                GFButton(
                  onPressed: () {
                    secondaryCommaPosition.value = 23;
                    if (!rc.isPrimaryComma.value) {
                      rc.nf.value = 23;
                    }
                    sbox.put(bm.secondaryCommaPosition, 23);
                  },
                  text: "dd,dd,ddd",
                  type: GFButtonType.outline,
                  color: secondaryCommaPosition.value == 23
                      ? Colors.orange
                      : Colors.white,
                ),
                GFButton(
                  onPressed: () {
                    secondaryCommaPosition.value = 0;
                    if (!rc.isPrimaryComma.value) {
                      rc.nf.value = 0;
                    }
                    sbox.put(bm.secondaryCommaPosition, 0);
                  },
                  text: "dddddddd",
                  type: GFButtonType.outline,
                  color: (secondaryCommaPosition.value != 33 &&
                          secondaryCommaPosition.value != 23)
                      ? Colors.orange
                      : Colors.white,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget commaSymbol() {
    return Card(
      color: Colors.black12,
      child: ListTile(
        title: const Text("Comma symbol"),
        trailing: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Text(
                  "d,d",
                  style: TextStyle(
                    color: rc.commaSymbol.value == ","
                        ? Colors.green
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
    );
  }
}
