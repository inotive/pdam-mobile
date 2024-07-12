import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/app.dart';
import 'package:pdam_inventory/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(const MyApp());
}
