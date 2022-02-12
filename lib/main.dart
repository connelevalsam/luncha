import 'package:flutter/material.dart';
import 'package:luncha/providers/user_provider.dart';
import 'package:luncha/screens/login.dart';
import 'package:luncha/screens/lunchi/home.dart';
import 'package:luncha/screens/lunchi/orders.dart';
import 'package:luncha/screens/user/home.dart';
import 'package:luncha/themes/luncha_theme.dart';
import 'package:provider/provider.dart';

import "./navigation.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = LunchaTheme.dark();
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Luncha',
        theme: theme,
        home: LoginScreen(),
        routes: {
          login: (context) => LoginScreen(),
          userHome: (context) => UserHomePage(),
          lunchiHome: (context) => LunchiHomePage(),
          ordersPage: (context) => Orders(),
          // successPage: (context) => LunchiHomePage(),
        },
      ),
    );
  }
}
