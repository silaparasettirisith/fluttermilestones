import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view/widgets/seat_widget.dart';

class BusSelection extends StatefulWidget {
  const BusSelection({super.key});

  @override
  State<BusSelection> createState() => _BusSelectionState();
}

class _BusSelectionState extends State<BusSelection> {
  var listOfSeatsSelected = [];
  var visibleBottomSheet = true;
  var totalFare = 0;
  var seatCount = 0;
  var data = "hello";

  @override
  Widget build(BuildContext context) {
    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);

    selectSeatProvider.busSelected.resetSeatNumber();

    // ignore: prefer_is_empty
    if (myTripProvider.upcomingTrips.length > 0) {
      for (int i = 0; i < myTripProvider.upcomingTrips.length; i++) {
        if (myTripProvider.upcomingTrips[i]["dateofJourney"] ==
                myTripProvider.dateofJourney &&
            selectSeatProvider.busSelected.name ==
                myTripProvider.upcomingTrips[i]["busname"] &&
            selectSeatProvider.busSelected.startLocation ==
                myTripProvider.travelling_from &&
            selectSeatProvider.busSelected.endLocation ==
                myTripProvider.travelling_to) {
          var userSeats = myTripProvider.upcomingTrips[i]["usersList"];

          for (int j = 0; j < userSeats.length; j++) {
            var number =
                userSeats[j].seatnumber.replaceAll(RegExp('[a-zA-z-]'), '');

            setState(() {
              selectSeatProvider.busSelected.seatNumbers[int.parse(number)] =
                  Colors.red;
            });
          }
        }
      }
    }

    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 115, 211, 255),
              Color.fromARGB(255, 255, 173, 173),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Select Seats",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Consumer<SelectSeatProvider>(
            builder: (context, data, child) {
              return Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: const Text(
                          "  Hurry! Buses on this route are filling up fast ",
                          style: TextStyle(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 213, 152),
                              fontSize: 15))),
                  ListTile(
                      // ignore: unnecessary_string_interpolations
                      title: Text("${data.busSelected.name}",
                          style: Theme.of(context).textTheme.titleMedium),
                           // ignore: unnecessary_string_interpolations
                      subtitle: Text("${data.busSelected.fulltype}",
                          style: const TextStyle(
                              fontSize: 15,
                              color:  Color.fromARGB(255, 113, 107, 107))),
                      trailing: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.star,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                text: data.busSelected.review,
                              ),
                            ],
                          ),
                        ),
                      )),
                  const Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    (Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: const Offset(1,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text("Available"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.green,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: const Offset(1,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text("Selected"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.red,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: const Offset(1,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text("NotAvailable"),
                                      ],
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("U"),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("L"),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Text("U"),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("L"),
                                    ],
                                  ),
                                ),
                                for (var i = 1, seatAlphabet = 65;
                                    i < 24;
                                    i = i + 4,
                                    seatAlphabet = seatAlphabet + 1) ...[
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(String.fromCharCodes(
                                            [seatAlphabet])),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SeatWidget(
                                            i,
                                            String.fromCharCodes(
                                                [seatAlphabet]),
                                            'U'),
                                        SeatWidget(
                                            i + 1,
                                            String.fromCharCodes(
                                                [seatAlphabet]),
                                            'L'),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        SeatWidget(
                                            i + 2,
                                            String.fromCharCodes(
                                                [seatAlphabet]),
                                            'U'),
                                        SeatWidget(
                                            i + 3,
                                            String.fromCharCodes(
                                                [seatAlphabet]),
                                            'L'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ]),
                            ),
                          ),
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
