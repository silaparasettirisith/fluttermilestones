import 'package:book_a_ticket/models/bus.dart';
import 'package:flutter/material.dart';

import 'package:book_a_ticket/repository/data/services/busservice.dart';

class BusProvider extends ChangeNotifier {
  List<Bus> buses = [];
  var filteredBuses = [];
  BusProvider() {
    getUsersList();
  }

  getUsersList() async {
    var f = await BusService.ReadJsonData();
    buses = f;
    notifyListeners();
  }

  filterBuses(travelling_from, travelling_to) {
    filteredBuses = [];
    for (int busIndex = 0; busIndex < buses.length; busIndex++) {
      if (buses[busIndex].startLocation == travelling_from &&
          buses[busIndex].endLocation == travelling_to) {
        filteredBuses.add(buses[busIndex]);
      }
    }

    notifyListeners();
  }
}
