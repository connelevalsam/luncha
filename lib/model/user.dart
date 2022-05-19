class User {
  int id;
  String uId;
  String name;
  String image;

  User({this.id, this.uId, this.name, this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["u_id"] ?? "",
      name: json["name"] ?? "",
      image: json["profile_picture"] ?? [],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'u_id': uId,
        'name': name,
        'profile_picture': image,
      };
}
