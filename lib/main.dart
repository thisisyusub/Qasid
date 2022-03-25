import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}
