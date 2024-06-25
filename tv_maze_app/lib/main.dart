import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'core/configuration/di/injectable_config.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tvMazeBox');
  await initializeDateFormatting();
  configureDependencies();

  runApp(const App());
}
