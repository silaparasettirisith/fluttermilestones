import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String age;
  String gender;
  String email;
  String phoneno;
  String seatnumber;

  User(
      {required this.name,
      required this.age,
      required this.gender,
      required this.email,
      required this.phoneno,
      required this.seatnumber});

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json["name"],
      age: json["age"],
      gender: json["gender"],
      email: json["email"],
      phoneno: json["phoneno"],
      seatnumber: json["seatnumber"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "email": email,
        "phoneno": phoneno,
        "seatnumber": seatnumber
      };
  @override
  String toString() {
    return "name : $name , age : $age,gender: $gender,email : $email,phoneno : $phoneno,seatnumber:$seatnumber";
  }
}
