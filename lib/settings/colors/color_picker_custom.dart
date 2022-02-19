import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Rx<String> selectedString = "".obs;

class ColorPickerWd extends StatelessWidget {
  String text;
  int colorInt;
  void Function(Color) onColorChange;
  String colorKeyToPut;

  ColorPickerWd({
    Key? key,
    required this.text,
    required this.colorInt,
    required this.onColorChange,
    required this.colorKeyToPut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      child: ListTile(
        selectedColor: Colors.green,
        title: Text(text),
        trailing: Flexible(
          child: Obx(() => Wrap(
                children: [
                  (selectedString.value == colorKeyToPut)
                      ? Icon(
                          MdiIcons.circleSmall,
                        )
                      : SizedBox(),
                  Container(
                    width: 35,
                    height: 35,
                    color: Color(colorInt),
                  ),
                ],
              )),
        ),
        onTap: () {
          selectedString.value = colorKeyToPut;
          colorPicker(context);
        },
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
          height: 500,
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
                          labelTypes: [],
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
                          child: Text(
                              isFavPick.value ? "Disk view" : "My Colors")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            putFavColor(pickedColorInt.value);
                            sbox.put(colorKeyToPut, pickedColorInt.value);
                          },
                          child: Text("Pick color")),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
