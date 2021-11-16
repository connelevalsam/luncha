import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:luncha/screens/lunchi/home.dart';
import 'package:luncha/screens/user/home.dart';
import 'package:luncha/themes/luncha_theme.dart';
import 'package:luncha/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtID = TextEditingController();
  var err = 0, errText = "";

  void loginCheck() {
    String id = txtID.text;
    setState(() {
      err = 0;
      errText = "";
    });
    if (id == "test") {
      print("user successfully logged in");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => UserHomePage()));
    } else if (id == "next") {
      print("lunchi successfully logged in");
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LunchiHomePage()));
    } else
      print("invalid details");
    setState(() {
      err = 1;
      errText = "invalid details";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WELCOME',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      'TO',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      'Luncha',
                      style: LunchaTheme.orangeText.headline1,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: entryField(
                        context,
                        "Enter your ID",
                        txtID,
                        hasLabel: true,
                        txtColor: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: loginCheck,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange, onPrimary: Colors.green),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    (err == 0)
                        ? Container()
                        : Text(
                            errText,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Colors.orange, onPrimary: Colors.green),
                    //   child: Text(
                    //     'Lunchi',
                    //     style: Theme.of(context).textTheme.headline6,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
