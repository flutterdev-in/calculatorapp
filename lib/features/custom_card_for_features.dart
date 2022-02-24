import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';

Widget iconCard(
    {IconData? iconData,
    String? text,
    Widget? icon,
    Widget? textw,
    int iconFlex = 1}) {
  return Card(
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: iconFlex,
            child: Align(
              child: icon ?? Icon(iconData),
            ),
          ),
          Container(
            color: Get.isDarkMode ? Colors.black45 : Colors.black12,
            width: 2,
          ),
          textw ??
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ParsedText(
                      // selectable: true,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      textScaleFactor: 1.2,
                      text: text ?? "",
                      softWrap: true,
                      parse: <MatchText>[
                        MatchText(
                          pattern:
                              r"On tap : |\^|x10\^|\s\.\s|0.|x10\u2079|x10\u2077|Swipe right : |100",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        MatchText(
                          pattern: r"Long press : |Swipe left : ",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}
