import 'package:calculator_04/_input.dart';
import 'package:calculator_04/_result.dart';
import 'package:calculator_04/_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  var box = await Hive.openBox('testBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                InputW(),
                ResultW(),
                ButtonsW(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
