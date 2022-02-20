import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GFButtonC extends StatelessWidget {
  GFButtonC({Key? key}) : super(key: key);

  void Function()? ontap;
  void Function()? onDoubleTap;
  void Function()? onLongPress;

  bool isIcon = true;
  String? text;
  double? textSize;
  Color? textColour = Colors.white;
  IconData? iconData;
  double iconSize = 30;
  Color iconColor = Colors.white;
  Color? buttonColor;
  bool wantChild = false;
  Widget? child;
  double padding = 0.6;
  bool isButtenEnter = false;

  GFButtonC.all({
    this.ontap,
    this.onDoubleTap,
    this.onLongPress,
    this.iconData,
    this.iconColor = Colors.white,
    this.isButtenEnter = false,
    this.buttonColor,
    this.textColour = Colors.white,
    this.isIcon = true,
    this.text,
    this.iconSize = 30,
    this.textSize = 30,
    this.wantChild = false,
    this.child,
    this.padding = 0.6,
  });
  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Obx(
        () => Material(
            color: isButtenEnter
                ? Color(sc.enterButtonBackgroundColor.value)
                : Color(sc.buttonsBackgroundColor.value),
            child: InkWell(
              onTap: ontap,
              onLongPress: onLongPress,
              child: Ink(
                width: (mw - 20) / 4,
                child: wantChild
                    ? Center(child: child)
                    : Center(
                        child: isIcon
                            ? Icon(
                                iconData,
                                color: iconColor,
                                size: iconSize,
                              )
                            : Text(
                                text!,
                                style: TextStyle(
                                  color: textColour,
                                  fontSize: textSize,
                                ),
                              ),
                      ),
              ),
              // highlightColor: Color(sc.onTapColor.value),
              splashColor: Color(sc.onTapColor.value),
              radius: 5000,
            )),
      ),
    );
  }
}
