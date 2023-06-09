import 'package:book_a_ticket/view-models/busprovider.dart';
import 'package:book_a_ticket/view-models/pick_drop_provider.dart';
import 'package:book_a_ticket/view-models/review_booking_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view/screens/bus_search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<BusProvider>(create: (_) => BusProvider()),
        ChangeNotifierProvider<SelectSeatProvider>(
            create: (_) => SelectSeatProvider()),
        ChangeNotifierProvider<PickupDropProvider>(
            create: (_) => PickupDropProvider()),
        ChangeNotifierProvider<ReviewBookingProvider>(
            create: (_) => ReviewBookingProvider()),
        ChangeNotifierProvider<MyTripProvider>(create: (_) => MyTripProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData().copyWith(
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                titleLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
          home: const BusSearch())));
}
