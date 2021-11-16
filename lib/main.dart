import 'package:flutter/material.dart';
import 'package:luncha/screens/login.dart';
import 'package:luncha/themes/luncha_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = LunchaTheme.dark();
    return MaterialApp(
      title: 'Luncha',
      theme: theme,
      home: LoginScreen(),
    );
  }
}
