class User {
  int id;
  String passCode;
  List profile;

  User({
    this.id,
    this.passCode,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      passCode: json["pass_code"] ?? "",
      profile: json["profile"] ?? [],
    );
  }
}
