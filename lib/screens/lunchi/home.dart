import 'package:flutter/material.dart';
import 'package:luncha/navigation.dart';
import 'package:luncha/screens/login.dart';
import 'package:luncha/themes/luncha_theme.dart';

class LunchiHomePage extends StatefulWidget {
  const LunchiHomePage({Key key}) : super(key: key);

  @override
  _LunchiHomePageState createState() => _LunchiHomePageState();
}

class _LunchiHomePageState extends State<LunchiHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Luncha',
          style: LunchaTheme.orangeText.headline1,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Container(
              color: Colors.black54,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, ordersPage);
                    },
                    child: SizedBox(
                      child: Center(
                          child: Text(
                        'Orders',
                        style: Theme.of(context).textTheme.headline2,
                      )),
                      width: 150,
                      height: size.height * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: SizedBox(
                      child: Center(
                          child: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.headline2,
                      )),
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
