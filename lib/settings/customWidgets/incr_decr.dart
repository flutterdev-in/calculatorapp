import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget incrDecrCard({
  bool isDotRequired = false,
  required String cardString,
  required num initialvalue,
  required void Function() decrFunction,
  required void Function() incrFunction,
}) {
  return Card(
    color: Get.isDarkMode ? Colors.white12 : Colors.white70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(cardString),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => decrFunction(),
              icon: Icon(MdiIcons.minus),
              splashColor: Colors.purple.shade100,
            ),
            Text(
              isDotRequired
                  ? initialvalue.toStringAsFixed(1)
                  : initialvalue.toString().replaceAll(RegExp(r'\..*'), ""),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => incrFunction(),
              icon: Icon(MdiIcons.plus),
            ),
          ],
        ),
      ],
    ),
  );
}
