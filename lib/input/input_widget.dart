import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class InputW extends StatelessWidget {
  InputW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;

    return SizedBox(
      height: double.infinity,
      child: Obx(() {
        RichTextController rtc = RichTextController(
          onMatch: (List<String> matches) {},
          patternMatchMap: {
            RegExp(r"[/\+\-\u00D7\(\)%]"):
                TextStyle(color: Color(sc.operatorsColor.value)),
            RegExp(r"[^\d\./\+\-\u00D7\(\)%]"):
                TextStyle(color: Color(sc.powerValuesColor.value)),
          },
        );
        mc.rtc = rtc;
        mc.rtc!.text = mc.n.value;
        if (mc.p.value < 0) {
          mc.p.value = 0;
        } else if (mc.p.value > mc.n.value.length) {
          mc.p.value = mc.n.value.length;
        }
        mc.rtc!.selection =
            TextSelection.fromPosition(TextPosition(offset: mc.p.value));

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: md.height / 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextField(
              onTap: () {
                int selection = mc.rtc!.selection.base.offset;
                if (selection < mc.n.value.length) {
                  mc.p.value = selection;
                } else {
                  mc.p.value = mc.n.value.length;
                }
              },
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                             Color(sc.dividerLineColor.value))),
              ),
              style: TextStyle(
                  fontSize: sc.displayFontSize.value.toDouble(),
                  color: Color(sc.displayFontColor.value)),
              readOnly: true,
              autofocus: true,
              showCursor: true,
              cursorColor: Color(sc.cursorColor.value), // Colors.purple,
              controller: mc.rtc,
            ),
          ),
        );
      }),
    );
  }
}
