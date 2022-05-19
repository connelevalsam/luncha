import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "./navigation.dart";
import 'provider/user_provider.dart';
import 'screens/screens.dart';
import 'themes/luncha_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = LunchaTheme.dark();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Luncha',
        theme: theme,
        home: LoginScreen(),
        routes: {
          login: (context) => LoginScreen(),
          userHome: (context) => UserHomePage(),
          lunchiHome: (context) => LunchiHomePage(),
          ordersPage: (context) => Orders(),
          successPage: (_) => ConfirmScreen(),
        },
      ),
    );
  }
}
