import 'package:calculator_04/settings/settings_model.dart';
import 'package:hive/hive.dart';

final Box sbox = Hive.box(bm.settings);
final Box hbox = Hive.box("history");
