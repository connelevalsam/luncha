import 'package:flutter/material.dart';
import 'package:luncha/screens/user/home.dart';
import 'package:provider/provider.dart';

import '../navigation.dart';
import '../provider/user_provider.dart';
import 'icon_tile.dart';

Widget drawer(BuildContext context) {
  var currentUser = Provider.of<UserProvider>(context, listen: false);
  return Drawer(
    child: ListView(
      children: [
        SizedBox(
          height: 200.0,
          child: DrawerHeader(
            decoration: const BoxDecoration(color: Colors.orangeAccent),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: (currentUser.username != null)
                            ? NetworkImage(currentUser.dp)
                            : AssetImage("assets/images/avatar.jpg"),
                      ),
                    ),
                  ],
                ),
                Text(
                  currentUser.username ?? 'John Doe',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ),
        iconTile(
          context,
          "Home",
          Icons.home,
          const UserHomePage(),
        ),
        ListTile(
          title: Text(
            "Logout",
            style: Theme.of(context).textTheme.headline5,
          ),
          leading: const Icon(Icons.logout),
          onTap: () {
            currentUser.clearUser();
            Navigator.pushReplacementNamed(
              context,
              login,
            );
          },
        )
      ],
    ),
  );
}
