import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../model/orders.dart';
import '../navigation.dart';
import '../provider/user_provider.dart';
import '../screens/user/home.dart';
import '../themes/luncha_theme.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtID = TextEditingController();
  var err = 0, errText = "";

  List orders = [];
  OrdersDao anOrder;
  var details;

  // final mockService = MockLunchaServices();

  void loginCheck() async {
    String id = txtID.text;
    // var result = await mockService.getUserData();
    // var r = result.firstWhere((element) => element.id == 1);
    var users = FirebaseFirestore.instance.collection("users");
    var user = await users.where("u_id", isEqualTo: id).get();
    var currentUser = Provider.of<UserProvider>(context, listen: false);
    // print("The user - ${user.docs.first.data().toString()}");
    // print("The user - ${user.docs.first.data()["name"]}");

    setState(() {
      err = 0;
      errText = "";
    });
    if (id.isEmpty) {
      setState(() {
        err = 1;
        errText = "please input your details";
      });
      print("please no input your details");
    }
    try {
      if (user.docs.isNotEmpty && user.docs.first.data()["user_type"] == 11) {
        print("user successfully logged in");
        currentUser.setUser(
          user.docs.first.data()["name"],
          user.docs.first.data()["u_id"],
          user.docs.first.data()["profile_picture"],
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => UserHomePage(),
            ));
      } else if (user.docs.first.data()["user_type"] == 0) {
        print("lunchi successfully logged in");
        currentUser.setUser(
          user.docs.first.data()["name"],
          user.docs.first.data()["u_id"],
          user.docs.first.data()["profile_picture"],
        );
        Navigator.pushReplacementNamed(
          context,
          lunchiHome,
        );
      } else {
        print("invalid details");
        setState(() {
          err = 1;
          errText = "invalid details";
        });
      }
    } catch(e) {
      print("========= error - $e---");
      setState(() {
        err = 1;
        errText = "invalid details";
      });
    }
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
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: LinearProgressIndicator());
                  }

                  orders.add(snapshot.data.docs);
                  print("Length - ${snapshot.data.docs.length} ======");
                  print("Details - ${snapshot.data.docs} ======");
                  return Center(
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
                                primary: Colors.orange,
                                onPrimary: Colors.green),
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          err == 0
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
                  );
                }),
          ],
        ),
      ),
    );
  }
}
