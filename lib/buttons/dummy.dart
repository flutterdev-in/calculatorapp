import 'package:calculator_04/_buttons.dart';
import 'package:calculator_04/buttons/customButton/gfbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:calculator_04/controller/controller.dart';
class Dummy extends StatelessWidget {
  Dummy({Key? key}) : super(key: key);
  final MainController b = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GFButtonC.all(
      ontap: () => null,
      iconData: null,
    );
  }
}
