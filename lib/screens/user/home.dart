import 'package:flutter/material.dart';
import 'package:luncha/themes/luncha_theme.dart';
import 'package:luncha/widgets/drawer.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: Text(
          'Luncha',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add a order",
        child: const Icon(Icons.add),
      ),
    );
  }
}
