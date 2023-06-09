import 'package:book_a_ticket/models/bus.dart';
import 'package:book_a_ticket/models/user.dart';
import 'package:book_a_ticket/view-models/review_booking_provider.dart';
import 'package:flutter/material.dart';

class SelectSeatProvider extends ChangeNotifier {
  late Bus busSelected;
  late int busSelectedIndex;
  List<String> seatsSelected = [];
  var totalFare = 0;
  var seatCount = 0;
  var discountFare = 0;

  List<User> user = [];
  List<TextEditingController> name = [];
  List<TextEditingController> age = [];
  List<TextEditingController> genders = [];
  // ignore: non_constant_identifier_names
  TextEditingController email_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController phonenumber_controller = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var coupouns;

// ignore: non_constant_identifier_names
  SetUsersSelectedBus(Bus SelectedBus) {
    busSelected = SelectedBus;

    notifyListeners();
  }

  addSelectedSeat(String selectedSeat, int price) {
    seatsSelected.add(selectedSeat);
    totalFare = totalFare + price;
    discountFare = discountFare + price;
    seatCount = seatCount + 1;

    name.add(TextEditingController());
    age.add(TextEditingController());
    genders.add(TextEditingController());
    user.add(User(
        name: "",
        age: "",
        gender: "Male",
        email: "",
        phoneno: "",
        seatnumber: selectedSeat));

    notifyListeners();
  }

  removeSelectedSeat(String selectedSeat, int price) {
    seatsSelected.remove(selectedSeat);
    ReviewBookingProvider().removeLastSeat();
    totalFare = totalFare - price;
    discountFare = discountFare - price;
    seatCount = seatCount - 1;

    name.remove(TextEditingController());
    age.remove(TextEditingController());
    genders.remove(TextEditingController());
    user.remove(User(
        name: "",
        age: "",
        gender: "Male",
        email: "",
        phoneno: "",
        seatnumber: ""));

    notifyListeners();
  }

  resetSelectedProvider() {
    seatsSelected = [];
    totalFare = 0;
    discountFare = 0;
    seatCount = 0;
    name = [];
    age = [];
    genders = [];
    user = [];

    email_controller = TextEditingController();
    phonenumber_controller = TextEditingController();
    coupouns = "";

    notifyListeners();
  }

  applyDiscount(int discount) {
    discountFare = totalFare - discount;
    notifyListeners();
  }
}
