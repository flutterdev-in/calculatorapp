import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ButtonsW extends StatelessWidget {
  ButtonsW({Key? key}) : super(key: key);
  ButtonsController b = Get.put(ButtonsController());
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: md.height * 3 / 5 - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstLeft(),
          secondLeft(),
          thirdLeft(),
          rigthColumn(),
        ],
      ),
    );
  }

  Widget rigthColumn() {
    return Column(
      children: [
        Expanded(child: b.operation("/", MdiIcons.slashForward), flex: 1),
        Expanded(child: b.operation("*", MdiIcons.close), flex: 1),
        Expanded(child: b.operation("-", MdiIcons.minus), flex: 1),
        Expanded(child: b.operation("+", MdiIcons.plus), flex: 1),
        Expanded(child: b.operation("\n", MdiIcons.playlistPlus), flex: 2),
      ],
    );
  }

  Widget leftGrossColumn() {
    return Column(children: [
      firstLeft(),
      secondLeft(),
      thirdLeft(),
    ]);
  }

  Widget firstLeft() {
    return Column(children: [
      Expanded(child: b.clear(), flex: 6),
      Expanded(child: b.number("7"), flex: 4),
      Expanded(child: b.number("4"), flex: 4),
      Expanded(child: b.number("1"), flex: 4),
      Expanded(child: b.number("00"), flex: 4),
    ]);
  }

  Widget secondLeft() {
    return Column(children: [
      Expanded(child: b.dummy(), flex: 3),
      Expanded(child: b.operation("%", MdiIcons.percentOutline), flex: 3),
      Expanded(child: b.number("8"), flex: 4),
      Expanded(child: b.number("5"), flex: 4),
      Expanded(child: b.number("2"), flex: 4),
      Expanded(child: b.number("0"), flex: 4),
    ]);
  }

  Widget thirdLeft() {
    return Column(children: [
      Expanded(child: b.clear(), flex: 3),
      Expanded(child: b.bracket(), flex: 3),
      Expanded(child: b.number("9"), flex: 4),
      Expanded(child: b.number("6"), flex: 4),
      Expanded(child: b.number("3"), flex: 4),
      Expanded(child: b.operation(".", MdiIcons.circleSmall), flex: 4),
    ]);
  }
}

class ButtonsController extends GetxController {
  late TextEditingController? tc;
  Rx<bool> isTapped = false.obs;
  Rx<int> p = 0.obs;
  Rx<String> n = "".obs;
  Rx<String> previousText = "".obs;
  String pftx = "";
  String sftx = "";
  Rx<bool> isModified = false.obs;

  @override
  void onInit() {
    tc = TextEditingController();
    super.onInit();
  }

  Widget dummy() {
    return GFButton(
      onPressed: () {},
      child: const Text(
        "=",
        textScaleFactor: 1.4,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  Widget clear() {
    return GFButton(
      onPressed: () {
        n.value = "";
        p.value = 0;
        isTapped.value = false;
      },
      child: const Text(
        "C",
        textScaleFactor: 1.4,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  Widget backspace() {
    return GFButton(
      onPressed: () {
        if (n.value.isEmpty || p.value == 0) {
          n.value = n.value;
        } else if (p.value >= n.value.length) {
          n.value = n.value.substring(0, n.value.length - 1);
          p.value--;
        } else {
          pftx = n.value.substring(0, p.value - 1);
          sftx = n.value.substring(p.value);
          n.value = pftx + sftx;
          p.value--;
        }
      },
      child: Icon(Icons.backspace_outlined),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  Widget redDot() {
    return isModified.value
        ? Icon(
            Icons.block,
            color: Colors.red,
          )
        : Text("");
  }

  Widget number(String digit) {
    return GFButton(
      onPressed: () {
        if (n.value.isEmpty) {
          n.value = digit;
        } else if (p.value == 0) {
          n.value = digit + n.value;
        } else if (p.value >= n.value.length) {
          if (n.value[n.value.length - 1] == "%" ||
              n.value[n.value.length - 1] == ")") {
            n.value = n.value;
            p.value--;
            isModified.value = true;
            isModified.value = false;
          } else {
            n.value = n.value + digit;
          }
        } else {
          pftx = n.value.substring(0, p.value);
          sftx = n.value.substring(p.value);
          if (pftx[pftx.length - 1] == "%" || pftx[pftx.length - 1] == ")") {
            n.value = pftx + sftx;
            p.value--;
            isModified.value = true;
            isModified.value = false;
          } else {
            n.value = pftx + digit + sftx;
          }
        }
        if (digit == "00") {
          p.value = p.value + 2;
        } else {
          p.value++;
        }
      },
      child: Text(
        digit,
        textScaleFactor: 1.4,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  Widget operation(String symbol, IconData icon) {
    return GFButton(
      onPressed: () {
        if (n.value.isEmpty || p.value == 0) {
          if (symbol == "-") {
            n.value = "-" + n.value;
            p.value++;
          }
        } else {
          if (p.value >= n.value.length) {
            pftx = n.value;
            sftx = "";
          } else {
            pftx = n.value.substring(0, p.value);
            sftx = n.value.substring(p.value);
          }

          n.value = pftx + symbol + sftx;

          List<String> listNotAllowed = [];
          //only %+ , %- , *- , *. allowed
          for (String i in ["/", "+", "-", ".", "*", "%", "\n", ")", "("]) {
            for (String j in ["/", "+", "-", ".", "*", "%", "\n"]) {
              List<String> listAllowed = [
                // "/\n",
                // "+\n",
                // "-\n",
                // "*\n",
                "%\n",
                ")\n",
                "\n-",
                "++",
                "%+",
                "%-",
                "*-",
                "*.",
                ")+",
                ")*",
                ")-",
                ")/",
                "(-"
              ];
              String ss = i + j;
              if (!listAllowed.contains(ss)) {
                listNotAllowed.add(i + j);
              }
            }
          }
          // listNotAllowed.addAll([
          //   "*-\n",
          //   "%-\n",
          //   "%+\n",
          // ]);
          // listNotAllowed.remove("\n-");
          int countIfNotValid = 0;
          for (String i in listNotAllowed) {
            if (n.value.contains(i)) {
              countIfNotValid++;
              n.value = pftx + sftx;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          }

          if (symbol == "\n" && n.value.contains("(")) {
            int openBra = 0;
            int closedBra = 0;
            n.value.split('').forEach((element) {
              if (element == "(") {
                openBra++;
              } else if (element == ")") {
                closedBra++;
              }
            });

            if (closedBra < openBra) {
              int diffrence = openBra - closedBra;
              String closedBras = ")" * diffrence;
              n.value = pftx + closedBras + "\n" + sftx;
              p.value = p.value + diffrence + 1;
            }
          }

          if (countIfNotValid == 0) {
            if (symbol == "." && dotNotValid(n.value)) {
              n.value = pftx + sftx;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }

            if (symbol == "%" &&
                (ifPercentNotValid1(n.value) || ifPercentNotValid2(n.value))) {
              n.value = pftx + sftx;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          }

          p.value++;
        }
      },
      child: Icon(icon),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  bool dotNotValid(nValue) {
    bool notValid = false;
    List l = nValue.split(".");
    if (l.length > 2) {
      int count = 0;
      l[l.length - 2].split('').forEach((element) {
        if (["/", "+", "*", "-", "%", "\n", ""].contains(element)) {
          count++;
        }
      });
      if (count == 0) {
        notValid = true;
      }
    }

    return notValid;
  }

  bool ifPercentNotValid1(String nValue) {
    bool notValid = false;

    List l = nValue.split("%");

    String checkString = l[l.length - 2];

    [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      ".",
    ].forEach((v) {
      checkString = checkString.replaceAll(v, '');
    });
    if (checkString.isEmpty) {
      notValid = true;
    } else if (checkString.isNotEmpty) {
      String nearerString = checkString.substring(checkString.length - 1);
      int count = 0;
      if (["+", "-", "\n"].contains(nearerString)) {
      } else {
        notValid = true;
      }
    }

    return notValid;
  }

  bool ifPercentNotValid2(String nValue) {
    //Case 2
    int count = 0;
    for (String i in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]) {
      for (String j in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]) {
        String inValidString = i + "%" + j;
        if (nValue.contains(inValidString)) {
          count++;
        }
      }
    }
    if (count != 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget bracket() {
    return GFButton(
      onPressed: () {
        if (n.value.isEmpty || p.value == 0) {
          n.value = "(";
        } else if (p.value >= n.value.length) {
          int openBra = ocb(n.value)[0];
          int closedBra = ocb(n.value)[1];

          String lastDigit = n.value[n.value.length - 1];

          if (["/", "+", "-", "*", "\n", "("].contains(lastDigit)) {
            if (openBra - closedBra <= 2) {
              n.value = n.value + "(";
            } else {
              n.value = n.value;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          } else {
            if (closedBra < openBra) {
              n.value = n.value + ")";
            } else {
              n.value = n.value;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          }
        } else {
          pftx = n.value.substring(0, p.value);
          sftx = n.value.substring(p.value);

          int openBra = ocb(n.value)[0];
          int closedBra = ocb(n.value)[0];

          String lastPositionDigit = pftx[pftx.length - 1];

          if (["/", "+", "-", "*", "\n", ")"].contains(lastPositionDigit)) {
            if (openBra - closedBra <= 2) {
              n.value = pftx + "(" + sftx;
            } else {
              n.value = n.value;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          } else {
            if (closedBra < openBra) {
              n.value = n.value + ")";
            } else {
              n.value = n.value;
              p.value--;
              isModified.value = true;
              isModified.value = false;
            }
          }
        }
        p.value++;
      },
      child: Text(
        "( )",
        textScaleFactor: 1.4,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  List<int> ocb(String nValue) {
    int openBra = 0;
    int closedBra = 0;
    if (nValue.split('').contains("\n")) {
      List k = nValue.split("\n");
      String lastString = k[k.length - 1];

      lastString.split('').forEach((element) {
        if (element == "(") {
          openBra++;
        } else if (element == ")") {
          closedBra++;
        }
      });
    } else {
      nValue.split('').forEach((element) {
        if (element == "(") {
          openBra++;
        } else if (element == ")") {
          closedBra++;
        }
      });
    }
    return [openBra, closedBra];
  }

  List<int> dotPercent(String nValue) {
    int openBra = 0;
    int closedBra = 0;
    if (nValue.split('').contains("\n")) {
      List k = nValue.split("\n");
      String lastString = k[k.length - 1];

      lastString.split('').forEach((element) {
        if (element == "(") {
          openBra++;
        } else if (element == ")") {
          closedBra++;
        }
      });
    } else {
      nValue.split('').forEach((element) {
        if (element == "(") {
          openBra++;
        } else if (element == ")") {
          closedBra++;
        }
      });
    }
    return [openBra, closedBra];
  }
}
