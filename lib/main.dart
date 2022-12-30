import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:flutter/foundation.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3XJW2w4uaK4fmTTA3jlrgO9wzxlFiL0w",
          appId: "1:552177819617:web:c1d3306cd6c8112756bca0",
          messagingSenderId: "552177819617",
          storageBucket: "form-d3585.appspot.com",
          projectId: "form-d3585"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
