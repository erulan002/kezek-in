import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kezek_in/firebase_options.dart';

import 'features/app/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}
