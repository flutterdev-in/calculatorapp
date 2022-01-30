import 'package:calculator_04/buttons/brackets.dart';
import 'package:calculator_04/buttons/clear.dart';
import 'package:calculator_04/buttons/dot.dart';
import 'package:calculator_04/buttons/numbers.dart';
import 'package:calculator_04/buttons/percentage.dart';
import 'package:calculator_04/buttons/plus.dart';
import 'package:calculator_04/buttons/power.dart';
import 'package:calculator_04/buttons/zero_zero.dart';
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
        SizedBox(
          height: 3,
        ),
        Expanded(child: b.operation("\u00D7", MdiIcons.close), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: b.operation("-", MdiIcons.minus), flex: 1),
        SizedBox(
          height: 3,
        ),
        Expanded(child: Plus(), flex: 1),
        SizedBox(
          height: 3,
        ),
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
      Expanded(child: Clear(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Power(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(7), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(4), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(1), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: ZeroZero(), flex: 4),
    ]);
  }

  Widget secondLeft() {
    return Column(children: [
      Expanded(child: b.dummy(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Percentage(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(8), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(5), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(4), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(0), flex: 4),
    ]);
  }

  Widget thirdLeft() {
    return Column(children: [
      Expanded(child: b.backspace(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Brackets(), flex: 3),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(9), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(6), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Numbers.select(3), flex: 4),
      SizedBox(
        height: 3,
      ),
      Expanded(child: Dot(), flex: 4),
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
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
      // padding: const EdgeInsets.symmetric(horizontal: 0),
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
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
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
      child: Icon(
        Icons.backspace_outlined,
        size: 25,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  Widget redDot() {
    return isModified.value
        ? Icon(
            Icons.block,
            color: Colors.red,
            size: 25,
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
        textScaleFactor: 2,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
      padding: EdgeInsets.all(10),
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
      child: Icon(
        icon,
        size: 30,
      ),
      size: GFSize.LARGE,
      type: GFButtonType.outline2x,
    );
  }

  void attach(String symbol) {
    if (n.value.isEmpty || p.value == 0) {
      n.value = symbol;
    } else if (p.value >= n.value.length) {
      n.value = n.value + symbol;
    } else {
      pftx = n.value.substring(0, p.value);
      sftx = n.value.substring(p.value);
      n.value = pftx + symbol + sftx;
    }
    p.value++;
  }

  Widget percentage() {
    return GFButton(
      onPressed: () {
        attach("%");
        //// Modifications
        if (n.value.length == 1) {
          n.value = "";
        }
        // Replace .% to .0%
        if (n.value.contains(".%")) {
          n.value = n.value.replaceAll(".%", ".0%");
          p.value = p.value + 2;
        }
        // invalid with left neibours
        RegExp r1 = RegExp(r'[\+\-\/\*]%'); // + - / *
        Iterable<String> l1 = r1.allMatches(n.value).map((Match m) {
          return m.input.substring(m.start, m.end);
        });

        l1.forEach((matchedString) {
          n.value = n.value.replaceAll(matchedString, matchedString[0]);
        });

        // when middle in number
        RegExp r2 = RegExp(r'\d%\d'); //
        Iterable<String> l2 = r2.allMatches(n.value).map((Match m) {
          return m.input.substring(m.start, m.end);
        });

        for (String matchedString in l2) {
          n.value = n.value
              .replaceAll(matchedString, matchedString.replaceAll("&", ''));
        }
      },
      child: const Text(
        "%",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
      ),
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
        textScaleFactor: 2,
        style: TextStyle(color: Colors.black),
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
