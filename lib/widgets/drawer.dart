import 'package:flutter/material.dart';
import 'package:luncha/model/user.dart';
import 'package:luncha/providers/user_provider.dart';
import 'package:luncha/screens/user/home.dart';
import 'package:provider/provider.dart';

import 'icon_tile.dart';

Widget drawer(BuildContext context) {
  List<User> getUser = Provider.of<UserProvider>(context).users;
  var name = getUser.first.profile.first["name"];
  var image = getUser.first.profile[0]["image_url"];
  print(name);
  return Drawer(
    child: ListView(
      children: [
        SizedBox(
          height: 200.0,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.orangeAccent),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(image),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 1,
                      child: IconButton(
                        onPressed: () {
                          print("Change image");
                        },
                        icon: Icon(
                          Icons.camera,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  name ?? 'John Doe',
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
        )
      ],
    ),
  );
}
