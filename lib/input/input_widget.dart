import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator_04/controller/main_controller.dart';

class InputW extends StatelessWidget {
  InputW({Key? key}) : super(key: key);

  MainController b = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      height: md.height / 4,
      child: Obx(() {
        // b.tc!.text = b.n.value;
        b.rtc!.text = b.n.value;
        if (b.p.value < 0) {
          b.p.value = 0;
        } else if (b.p.value > b.n.value.length) {
          b.p.value = b.n.value.length;
        }
        b.rtc!.selection =
            TextSelection.fromPosition(TextPosition(offset: b.p.value));

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height / 5),
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
              maxLines: null,
              // wrapWords: false,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
              ),
              style: TextStyle(fontSize: 20, color: Colors.white),
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
