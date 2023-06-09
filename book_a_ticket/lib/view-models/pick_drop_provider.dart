import 'package:flutter/material.dart';

class PickupDropProvider extends ChangeNotifier {
  late Map<String, Object> selectedPickUpPoint = {};
  late Map<String, Object> selectedDropPoint = {};

  setPickUpPoint(Map<String, Object> pickUp) {
    selectedPickUpPoint = pickUp;
  }

  setDropPoint(Map<String, Object> dropPoint) {
    selectedDropPoint = dropPoint;
  }

  resetPickupDrop() {
    selectedDropPoint = {};
    selectedPickUpPoint = {};
  }
}
