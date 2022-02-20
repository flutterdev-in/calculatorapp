import 'package:calculator_04/-input_with_ad.dart';
import 'package:calculator_04/controllers/settings_controller.dart';
import 'package:calculator_04/history/history_container.dart';
import 'package:calculator_04/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  await Hive.openBox("history");
  await Hive.openBox("settings");
  await Hive.openBox("favhistory");
  // await Hive.box("settings").clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AI Calculator',
      theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          )),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
                    InputWithAdWidget(),
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

// class MyHomePage0 extends StatelessWidget {
//   const MyHomePage0({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size md = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: 500,
//           height: 500,
//           color: Colors.black,
//           child: Align(
//             alignment: Alignment.center,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   width: 340,
//                   height: 340,
//                   decoration: BoxDecoration(
//                     border:
//                         //Border.all(color: Colors.pink.shade900, width: 15),
//                         Border.all(color: Colors.purple.shade500, width: 15),
//                     borderRadius: BorderRadius.circular(68),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("AI",
//                               textScaleFactor: 7 * 1.1,
//                               style: TextStyle(color: Colors.white)),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Icon(MdiIcons.playlistPlus,
//                               color: Colors.green, size: 100 * 1.1),
//                         ],
//                       ),
//                       Text("Calculator",
//                           textScaleFactor: 3.5 * 1.3,
//                           style: TextStyle(
//                             color: Colors.yellow.shade800,
//                             fontWeight: FontWeight.bold,
//                           )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
