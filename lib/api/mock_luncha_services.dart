import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/user.dart';

class MockLunchaServices {
  Future<List<User>> getUserData() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString = await _loadAsset('assets/sample_data/users_data.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to ExploreRecipe object.
    if (json['users'] != null) {
      final recipes = <User>[];
      json['users'].forEach((v) {
        recipes.add(User.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
