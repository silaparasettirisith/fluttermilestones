import 'dart:convert';
  List<Users> usersFromJson(String str) 
  {
      return List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));
  }

class Users {
  int id;
  String name;
  String email;
  String phoneno;
  String companyName;

  Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneno,
      required this.companyName});


     

/*   String usersToJson(List<Users> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.usersToJson()))); */

  factory Users.fromJson(Map json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneno: json["phone"],
        companyName: json["company"]["name"],
      );
}
