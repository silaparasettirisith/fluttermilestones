import 'package:flutter/material.dart';

class MyTripProvider extends ChangeNotifier {
  String travelling_from = "";
  String travelling_to = "";
  String dateofJourney = "";

  var upcomingTrips = [];

  var completedTrips = [
    {
      "travelling_from": "Banglore",
      "travelling_to": "Chennai",
      "dateofJourney": "03 March 2023",
      "usersList": [
        {"name": "Ravi", "age": "22", "Gender": "Male"}
      ],
      "startTime": "23:20",
      "endTime": "7:00"
    }
  ];

  setMyTripProvider(String from, String to, String date) {
    travelling_from = from;
    travelling_to = to;
    dateofJourney = date;
    notifyListeners();
  }

  resetMyTripProvider() {
    travelling_from = "";
    travelling_to = "";
    dateofJourney = "";
    notifyListeners();
  }

  addUpcomingTrip(usersList, startTime, endTime, transactionId, busname) {
    upcomingTrips.add({
      "travelling_from": travelling_from,
      "travelling_to": travelling_to,
      "dateofJourney": dateofJourney,
      "usersList": usersList,
      "startTime": startTime["time"],
      "endTime": endTime["time"],
      "transaction_id": transactionId,
      "busname": busname,
    });

    notifyListeners();
  }
}
