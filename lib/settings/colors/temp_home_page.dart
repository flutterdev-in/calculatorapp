import 'package:calculator_04/-input_with_ad.dart';
import 'package:calculator_04/controllers/main_controller.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_container.dart';
import 'package:calculator_04/hive_boxes.dart';
import 'package:calculator_04/input/input_stack.dart';
import 'package:calculator_04/result/result_screen.dart';
import 'package:calculator_04/settings/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePagefromSettings extends StatefulWidget {
  const HomePagefromSettings({Key? key}) : super(key: key);

  @override
  State<HomePagefromSettings> createState() => _HomePagefromSettingsState();
}

class _HomePagefromSettingsState extends State<HomePagefromSettings>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      sbox.put(bm.stateNvalue, mc.n.value);
      sbox.put(bm.statePvalue, mc.p.value);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => Container(
              color: Color(sc.screenBackgroundColor.value),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    inputStack(context),
                    ResultW(),
                    ButtonsWd(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget inputStack(BuildContext context) {
  Size md = MediaQuery.of(context).size;
  return Obx(() {
    double heightx = md.height -
        (md.height * 3 / 5 - 50) -
        (md.height / 8) -
        44 -
        (sc.bottomPadding.value.toDouble());
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      height: heightx,
      child: InputStack(),
    );
  });
}
