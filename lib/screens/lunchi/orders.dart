import 'package:flutter/material.dart';
import 'package:luncha/themes/luncha_theme.dart';
import 'package:luncha/widgets/order_tile.dart';

class Orders extends StatelessWidget {
  DateTime todaysDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Center(
                    child: Text(
                      ' $todaysDate ',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                OrderTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
