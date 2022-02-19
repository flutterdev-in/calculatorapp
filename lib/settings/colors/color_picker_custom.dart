import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ColorPickerWd extends StatelessWidget {
  int colorInt;
  String text;
  void Function(Color) onColorChange;

  ColorPickerWd({
    Key? key,
    required this.text,
    required this.colorInt,
    required this.onColorChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        title: Text(text),
        trailing: Padding(
          padding: const EdgeInsets.fromLTRB(2, 12, 2, 12),
          child: InkWell(
            child: Container(
              width: 35,
              color: Color(colorInt),
            ),
            onTap: () => colorPicker(context),
          ),
        ),
      ),
    );
  }

  void colorPicker(BuildContext context) {
    Rx<bool> isFavPick = false.obs;
    Rx<int> pickedColorInt = 0xFFFFFFFF.obs;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        actionsAlignment: MainAxisAlignment.start,
        content: SizedBox(
          height: 550,
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFavPick.value
                      ? BlockPicker(
                          availableColors: listFavColors(
                              sbox.get(bm.favColors) ?? favColors0),
                          pickerColor: Color(colorInt),
                          onColorChanged: (color) {
                            onColorChange(color);
                            pickedColorInt.value =
                                int.parse(color.value.toString());
                          },
                        )
                      : ColorPicker(
                          labelTypes: [ColorLabelType.rgb],
                          paletteType: PaletteType.hueWheel,
                          pickerColor: Color(colorInt),
                          onColorChanged: (color) {
                            onColorChange(color);
                            pickedColorInt.value =
                                int.parse(color.value.toString());
                          },
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            isFavPick.value = !isFavPick.value;
                          },
                          child:
                              Text(isFavPick.value ? "Template" : "My Colors")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            putFavColor(pickedColorInt.value);
                          },
                          child: Text("Pick colour")),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
