import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Rx<String> selectedString = "".obs;
Rx<int> pickedColorInt = 0xFFFFFFFF.obs;

class ColorPickerWd extends StatelessWidget {
  String text;
  int colorInt;
  void Function() onColorPick;
  String colorKeyToPut;

  ColorPickerWd({
    Key? key,
    required this.text,
    required this.colorInt,
    required this.onColorPick,
    required this.colorKeyToPut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Get.isDarkMode ? Colors.white12 : Colors.white70,
      child: Obx(
        () => ListTile(
          selectedColor: Colors.green,
          title: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  child: (selectedString.value == colorKeyToPut)
                      ? Icon(
                          MdiIcons.circleSmall,
                        )
                      : SizedBox(),
                ),
              ),
            ],
          ),
          trailing: Container(
            width: 35,
            height: 35,
            color: Color(colorInt),
          ),
          onTap: () {
            selectedString.value = colorKeyToPut;
            colorPicker(context);
          },
        ),
      ),
    );
  }

  void colorPicker(BuildContext context) {
    Rx<bool> isFavPick = false.obs;
    int currentColorInt = colorInt;
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
                          availableColors:
                              listFavColors(sc.favColors).toSet().toList(),
                          pickerColor: Color(colorInt),
                          onColorChanged: (color) {
                            pickedColorInt.value =
                                int.parse(color.value.toString());
                          },
                        )
                      : ColorPicker(
                          labelTypes: [],
                          paletteType: PaletteType.hsv,
                          hexInputBar: true,
                          pickerColor: Color(currentColorInt),
                          onColorChanged: (color) {
                            pickedColorInt.value =
                                int.parse(color.value.toString());
                          },
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            currentColorInt = pickedColorInt.value;
                            isFavPick.value = !isFavPick.value;
                          },
                          child: Text(
                              isFavPick.value ? "Multi Colors" : "My Colors")),
                      ElevatedButton(
                          onPressed: () {
                            onColorPick();
                            Navigator.of(context).pop();
                            sc.favColors.add(pickedColorInt.value);

                            sbox.put(colorKeyToPut, pickedColorInt.value);
                            putFavColor(pickedColorInt.value);
                          },
                          child: const Text("Pick color")),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
