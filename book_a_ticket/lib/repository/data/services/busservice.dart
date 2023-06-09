import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:book_a_ticket/models/bus.dart';

class BusService {
  // ignore: non_constant_identifier_names
  static Future<List<Bus>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/buses.json');
    final list = json.decode(jsondata) as List<dynamic>;
    int id = -1;
    var newlist = list.map((e) {
      id = id + 1;
      return Bus.fromJson(e, id);
    });
    return newlist.toList();
  }
}
