import 'package:flutter/material.dart';
import 'package:workmanager_example/app.dart';
import 'package:workmanager_example/work_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WorkManagerService().init();

  runApp(const App());
}
