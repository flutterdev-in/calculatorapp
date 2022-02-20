import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/settings/settings_model.dart';
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
                            pickedColorInt.value =
                                int.parse(color.value.toString());
                          },
                        )
                      : ColorPicker(
                          labelTypes: [],
                          paletteType: PaletteType.hueWheel,
                          pickerColor: Color(colorInt),
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
                            isFavPick.value = !isFavPick.value;
                          },
                          child: Text(
                              isFavPick.value ? "Disk view" : "My Colors")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onColorPick();
                            List<int> lf = sbox.get(bm.favColors) ?? favColors0;
                            lf.add(pickedColorInt.value);
                            sbox.put(bm.favColors, lf);
                          },
                          child:const Text("Pick color")),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
