import 'dart:convert';

import 'package:flutter/material.dart';

Bus busFromJson(String str, id) {
  return Bus.fromJson(json.decode(str), id);
}

String busToJson(Bus data) => json.encode(data.toJson());

class Bus {
  int id;
  String name;
  String type;
  String startLocation;
  String endLocation;
  String fulltype;
  String seattype;
  String seatsleft;
  String startTime;
  String endTime;
  String price;
  String review;
  String ratings;
  String peopleChoice;
  Map<int, Color> seatNumbers;

  Bus(
      {required this.id,
      required this.name,
      required this.type,
      required this.startLocation,
      required this.endLocation,
      required this.fulltype,
      required this.seattype,
      required this.seatsleft,
      required this.startTime,
      required this.endTime,
      required this.price,
      required this.review,
      required this.ratings,
      required this.peopleChoice,
      required this.seatNumbers});

  factory Bus.fromJson(Map<String, dynamic> json, id) {
    return Bus(
        id: id,
        name: json["name"],
        type: json["type"],
        startLocation: json["start_location"],
        endLocation: json["end_location"],
        fulltype: json["fulltype"],
        seattype: json["seattype"].toString(),
        seatsleft: json["seatsleft"].toString(),
        startTime: json["startTime"],
        endTime: json["endTime"],
        price: json["price"].toString(),
        review: json["review"].toString(),
        ratings: json["ratings"].toString(),
        peopleChoice: json["peopleChoice"].toString(),
        seatNumbers: {
          1: Colors.white,
          2: Colors.white,
          3: Colors.white,
          4: Colors.white,
          5: Colors.white,
          6: Colors.white,
          7: Colors.white,
          8: Colors.white,
          9: Colors.white,
          10: Colors.white,
          11: Colors.white,
          12: Colors.white,
          13: Colors.white,
          14: Colors.white,
          15: Colors.white,
          16: Colors.white,
          17: Colors.white,
          18: Colors.white,
          19: Colors.white,
          20: Colors.white,
          21: Colors.white,
          22: Colors.white,
          23: Colors.white,
          24: Colors.white
        });
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "start_location": startLocation,
        "end_location": endLocation,
        "fulltype": fulltype,
        "seattype": seattype,
        // ignore: unnecessary_cast
        "seatsleft": seatsleft as String,
        "startTime": startTime,
        "endTime": endTime,
        // ignore: unnecessary_cast
        "price": price as String,
        // ignore: unnecessary_cast
        "review": review as String,
        // ignore: unnecessary_cast
        "ratings": ratings as String,
        // ignore: unnecessary_cast
        "peopleChoice": peopleChoice as String,
      };

  resetSeatNumber() {
    seatNumbers = {
      1: Colors.white,
      2: Colors.white,
      3: Colors.white,
      4: Colors.white,
      5: Colors.white,
      6: Colors.white,
      7: Colors.white,
      8: Colors.white,
      9: Colors.white,
      10: Colors.white,
      11: Colors.white,
      12: Colors.white,
      13: Colors.white,
      14: Colors.white,
      15: Colors.white,
      16: Colors.white,
      17: Colors.white,
      18: Colors.white,
      19: Colors.white,
      20: Colors.white,
      21: Colors.white,
      22: Colors.white,
      23: Colors.white,
      24: Colors.white
    };
  }
}
