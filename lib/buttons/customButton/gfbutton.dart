import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class GFButtonC extends StatelessWidget {
  GFButtonC({Key? key}) : super(key: key);
  void Function()? ontap;
  void Function()? onLongPress;
  bool isIcon = true;
  String? text;
  double textScaleFactor = 3;
  Color? textColour = Colors.white;
  IconData? iconData;
  double iconSize = 30;
  Color iconColor = Colors.white;
  Color buttonColor = Colors.grey;
  bool wantChild = false;
  Widget? child;
  double padding = 0.6;

  GFButtonC.all({
    this.ontap,
    this.onLongPress,
    this.iconData,
    this.iconColor = Colors.white,
    this.buttonColor = Colors.white10,
    this.textColour = Colors.white,
    this.isIcon = true,
    this.text,
    this.iconSize = 30,
    this.textScaleFactor = 3,
    this.wantChild = false,
    this.child,
    this.padding = 0.6,
  });
  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Material(
        color: buttonColor,
        // type: MaterialType.button,
        child: InkWell(
          onTap: ontap,
          onLongPress: onLongPress,
          child: Ink(
            width: (mw - 20) / 4,
            child: wantChild
                ? child
                : Center(
                    child: isIcon
                        ? Icon(
                            iconData,
                            color: iconColor,
                            size: iconSize,
                          )
                        : Text(
                            text!,
                            textScaleFactor: textScaleFactor,
                            style: TextStyle(color: textColour),
                          ),
                  ),
          ),
          highlightColor: Colors.purple.shade800,
          splashColor: Colors.pink.shade900,
          radius: 60,
        ),
      ),
    );
  }
}
