import 'package:book_a_ticket/view-models/busprovider.dart';
import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/screens/bus_search.dart';
import 'package:book_a_ticket/view/screens/bus_selection.dart';
import 'package:book_a_ticket/view/screens/my_trips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class TravelBuses extends StatefulWidget {
  String from;
  String to;
  TravelBuses(this.from, this.to, {super.key});

  @override
  State<TravelBuses> createState() => _TravelBusesState();
}

class _TravelBusesState extends State<TravelBuses> {
  var bottomnavindex = 0;
  bool rating = false, price = false;

  @override
  Widget build(BuildContext context) {
    BusProvider busProvider = Provider.of<BusProvider>(context, listen: false);

    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);

    checkTimes(String startTime, String endTime) {
      var format = DateFormat("HH:mm");
      var start = format.parse(startTime);
      var end = format.parse(endTime);

      end = end.add(const Duration(days: 1));
      Duration diff = end.difference(start).abs();
      final hours = diff.inHours;
      final minutes = diff.inMinutes % 60;
      return (' --$hours::$minutes-- ');
    }

    for (int i = 0; i < busProvider.buses.length; i++) {
      if (busProvider.buses[i].startLocation ==
              myTripProvider.travelling_from &&
          busProvider.buses[i].endLocation == myTripProvider.travelling_to) {
        busProvider.buses[i].seatsleft = '24';
        for (int j = 0; j < myTripProvider.upcomingTrips.length; j++) {
          if (myTripProvider.upcomingTrips[j]["busname"] ==
              busProvider.buses[i].name) {
            setState(() {
              var userSeats = myTripProvider.upcomingTrips[j]["usersList"];
              if (myTripProvider.dateofJourney ==
                  myTripProvider.upcomingTrips[j]["dateofJourney"]) {
                busProvider.buses[i].seatsleft =
                    (int.parse(busProvider.buses[i].seatsleft) -
                            userSeats.length)
                        .toString();
              }
            });
          }
        }
      }
    }

    return Container(
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
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const BusSearch();
                  }), (route) => false);
                },
              ),
              title: Consumer<MyTripProvider>(
                builder: (context, data, child) {
                  return ListTile(
                    title: Text(
                      "${data.travelling_from} to ${data.travelling_to}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      data.dateofJourney,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              )),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<BusProvider>(
              builder: (context, data, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.filteredBuses.length == 0)
                        const Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Icon(
                                  Icons.search_off_rounded,
                                  size: 100,
                                ),
                                Text(
                                  "No Buse Found on this route",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Sorry,Please try Searching for different cities",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 128, 112, 112)),
                                )
                              ]),
                        ),
                      for (int busIndex = 0;
                          busIndex < data.filteredBuses.length;
                          busIndex++) ...[
                        GestureDetector(
                          onTap: () {
                            if (int.parse(
                                    data.filteredBuses[busIndex].seatsleft) >
                                0) {
                              selectSeatProvider.SetUsersSelectedBus(
                                  data.filteredBuses[busIndex]);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const BusSelection();
                                },
                              ));
                            }
                          },
                          child: Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.filteredBuses[busIndex].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                                  text: data
                                                      .filteredBuses[busIndex]
                                                      .review,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            data.filteredBuses[busIndex]
                                                .fulltype,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 113, 107, 107))),
                                        Text(
                                            "${data.filteredBuses[busIndex].ratings} Ratings",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 113, 107, 107),
                                                fontSize: 15))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                                child: Text(
                                              "${data.filteredBuses[busIndex].startTime} - ",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            )),
                                            TextSpan(
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 113, 107, 107)),
                                              text: checkTimes(
                                                  data.filteredBuses[busIndex]
                                                      .startTime,
                                                  data.filteredBuses[busIndex]
                                                      .endTime),
                                            ),
                                            TextSpan(
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                              text: data.filteredBuses[busIndex]
                                                  .endTime,
                                            ),
                                          ],
                                        )),
                                        Text(
                                          "\u{20B9}${data.filteredBuses[busIndex].price}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        if (int.parse(data.filteredBuses[busIndex].seatsleft) > 0)
                                          Text("${data.filteredBuses[busIndex].seatsleft}  Seats Left",
                                              style: int.parse(data.filteredBuses[busIndex].seatsleft) < 10
                                                  ? const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 255, 233, 230),
                                                      color: Color.fromARGB(
                                                          255, 247, 37, 22))
                                                  : const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 255, 255, 255),
                                                      color: Colors.grey))
                                        else
                                          (const Text("Not Available",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  backgroundColor: Colors.white,
                                                  color: Color.fromARGB(255, 247, 37, 22))))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomnavindex,
              onTap: (value) {
                setState(() {
                  bottomnavindex = value;
                  if (bottomnavindex == 1) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MyTrips();
                      },
                    ));
                    bottomnavindex = 0;
                  }
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.luggage_rounded,
                    ),
                    label: "MyTrip")
              ])),
    );
  }
}
