
import 'package:calculator_04/ac_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:text_selection_controls/text_selection_controls.dart';

class InputW extends StatelessWidget {
  const InputW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonsController b = Get.put(ButtonsController());

    return Container(
      height: Get.height / 4,
      child: Obx(() {
        b.tc!.text = b.n.value;
        if (b.p.value > b.n.value.length) {
          b.p.value = b.n.value.length;
        }
        b.tc!.selection =
            TextSelection.fromPosition(TextPosition(offset: b.p.value));

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: Get.height / 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: TextField(
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              decoration: InputDecoration(),
              style: TextStyle(fontSize: 30),
              readOnly: true,
              autofocus: true,
              showCursor: true,
              controller: b.tc,
              // enableInteractiveSelection: false,
              // selectionControls: FlutterSelectionControls(toolBarItems: [
              //   ToolBarItem(
              //       item: Icon(Icons.cut), itemControl: ToolBarItemControl.cut),
              // ]),
              onTap: () {
                b.isTapped.value = true;
                int selection = b.tc!.selection.base.offset;
                if (selection < b.n.value.length) {
                  b.p.value = selection;
                } else {
                  b.p.value = b.n.value.length;
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
