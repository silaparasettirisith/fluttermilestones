import 'dart:convert';
import 'dart:io';

import 'package:milestone4/models/users.dart';
import 'package:http/http.dart' as http;

class UserService {

  static Future<List<Users>> getUserList() async {
    List<Users> users = [];
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");

      var response = await http.get(url);
      

      users = usersFromJson(response.body);
    } on HttpException {
      print("Invalid HttpException");
    } on FormatException {
      print("Invalid Format");
    } catch (e) {
      print(e);
    }

    return users;
  }
}
