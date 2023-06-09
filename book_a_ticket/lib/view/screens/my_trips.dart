import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/screens/travel_buses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/models/user.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    late List<User> f;
    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);

    showfilterModal(data) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (builder) {
            return Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                      Color.fromARGB(255, 115, 211, 255),
                      Color.fromARGB(255, 255, 173, 173),
                    ])),
                height: 1000,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/qrcode.jpeg",
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${data["travelling_from"]} to ${data["travelling_to"]} #${data["transaction_id"]} ( ${selectSeatProvider.busSelected.name})",
                            textScaleFactor: 1,
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      /*             Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${data["travelling_from"]} to ${data["travelling_to"]}",
                            textScaleFactor: 1.4,
                          )), */
                      const SizedBox(
                        height: 13,
                      ),
                      const Divider(
                        thickness: 2,
                        height: 2,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Travellers",
                            textScaleFactor: 1,
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      for (int index = 0; index < f.length; index++) ...[
                        ListTile(
                          title: Text(
                            "Name : ${f[index].name.toUpperCase()} ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            "Age : ${f[index].age} ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: Text(
                            "SeatNumber : ${f[index].seatnumber} ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Close"))
                    ],
                  ),
                ));
          });
    }
    
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  var from = myTripProvider.travelling_from;
                  var to = myTripProvider.travelling_to;
                  return TravelBuses(from, to);
                }), (route) => false);
              },
            ),
            backgroundColor: Colors.white,
            title: const Text(
              'MyTrips',
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              controller: _tabController,
              onTap: (value) {},
              labelColor: Colors.black,
              tabs: const <Widget>[
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Completed",
                ),
              ],
            ),
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            Consumer<MyTripProvider>(
              builder: (context, data, child) {
                // ignore: prefer_is_empty
                if (data.upcomingTrips.length == 0) {
                  return const Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 100,
                          ),
                          Text(
                            "No UpComing Trips",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ]),
                  );
                }
                return ListView.builder(
                  itemCount: data.upcomingTrips.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      selected: true,
                      selectedTileColor:
                          const Color.fromARGB(255, 200, 232, 255),
                      onTap: () {},
                      title: Text(
                        "${data.upcomingTrips[index]["travelling_from"]} -> ${data.upcomingTrips[index]["travelling_to"]}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 5, 103, 184),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "${data.upcomingTrips[index]["dateofJourney"]} (${data.upcomingTrips[index]["usersList"].length}) Passengers",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      leading: const Icon(Icons.bus_alert),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_sharp),
                        onPressed: () {
                          f = [];
                          for (int i = 0;
                              i < data.upcomingTrips[index]["usersList"].length;
                              i++) {
                            if (data.upcomingTrips[index]["usersList"][i]
                                    .name !=
                                "") {
                              f.add(data.upcomingTrips[index]["usersList"][i]);
                            }
                          }

                          showfilterModal(data.upcomingTrips[index]);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Column(children: [
              ListTile(
                selected: true,
                selectedTileColor: const Color.fromARGB(255, 200, 232, 255),
                onTap: () {},
                title: const Text(
                  "Goa(Goa) -> Banglore(BLR)",
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 103, 184),
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("29 Jan (5) Passengers",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                leading: const Icon(Icons
                    .bus_alert), /*   trailing: Icon(Icons.arrow_forward_ios_sharp)) */
              ),
              const Divider(
                height: 3,
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
