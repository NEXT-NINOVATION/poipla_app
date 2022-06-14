import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/screens/change_costume/change_costume_screen.dart';
import 'package:poipla_app/screens/home/home_screen.dart';
import 'package:poipla_app/screens/splash_screen.dart';
import 'package:poipla_app/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "LightNovelPOPv2",
        ),
        home: const StartScreen(),
      ),
    );
  }
}
