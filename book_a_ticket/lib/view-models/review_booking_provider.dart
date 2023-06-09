import 'package:book_a_ticket/models/user.dart';
import 'package:flutter/material.dart';

class ReviewBookingProvider extends ChangeNotifier {
  final form_key = GlobalKey<FormState>();
  final emailform_key = GlobalKey<FormState>();
  List<User> users = [];
  var userValidate = false;

  validateFields(List<User> usersparam) {
    var valide = form_key.currentState?.validate();

    var emailvalidate = emailform_key.currentState?.validate();
    users = usersparam;

    if (valide! && emailvalidate!) {
      form_key.currentState?.save();
      setUserValidate(true);
      return;
    }
    notifyListeners();
  }

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  setUserValidate(bool validatevalue) {
    userValidate = validatevalue;
    notifyListeners();
  }

  resetReviewBookingProvider() {
    users = [];
    userValidate = false;
    form_key.currentState?.reset();
    emailform_key.currentState?.reset();
    notifyListeners();
  }

  removeLastSeat() {
    notifyListeners();
  }
}
