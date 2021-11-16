import 'package:flutter/material.dart';
import 'package:luncha/themes/luncha_theme.dart';

class LunchiHomePage extends StatefulWidget {
  const LunchiHomePage({Key key}) : super(key: key);

  @override
  _LunchiHomePageState createState() => _LunchiHomePageState();
}

class _LunchiHomePageState extends State<LunchiHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Luncha',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: Center(child: Text('Lunchi')),
    );
  }
}
