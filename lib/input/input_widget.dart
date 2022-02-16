import 'package:calculator_04/settings/input_settings_controller.dart';
import 'package:calculator_04/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';

class InputW extends StatelessWidget {
  InputW({Key? key}) : super(key: key);

  MainController b = Get.put(MainController());
  final SettingsController sc = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;

    return SizedBox(
      height: double.infinity,
      child: Obx(() {
        b.rtc!.text = b.n.value;
        if (b.p.value < 0) {
          b.p.value = 0;
        } else if (b.p.value > b.n.value.length) {
          b.p.value = b.n.value.length;
        }
        b.rtc!.selection =
            TextSelection.fromPosition(TextPosition(offset: b.p.value));

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: md.height / 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextField(
              onTap: () {
                int selection = b.rtc!.selection.base.offset;
                if (selection < b.n.value.length) {
                  b.p.value = selection;
                } else {
                  b.p.value = b.n.value.length;
                }
              },
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              // scrollPadding: EdgeInsets.all(1.0),
              maxLines: null,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
              ),
              style: TextStyle(
                  fontSize: sc.inputFontSize.value, color: Colors.white),
              readOnly: true,
              autofocus: true,
              showCursor: true,
              cursorColor: Colors.purple,
              controller: b.rtc,
            ),
          ),
        );
      }),
    );
  }
}
