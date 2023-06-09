import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view-models/pick_drop_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/widgets/bottomsheet.dart';

class PickUpDrop extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PickUpDrop({super.key});

  @override
  State<PickUpDrop> createState() => _PickUpDropState();
}

class _PickUpDropState extends State<PickUpDrop>
    with SingleTickerProviderStateMixin {
  var pickUp = false;
  var drop = false;

  var listOfPickup = [
    {
      "index": 0,
      "time": "03:00",
      "point": "Vellore Highway",
      "pointAddress": "Vellore",
      "selected": false
    },
    {
      "index": 1,
      "time": "04:30",
      "point": "Srinagar",
      "pointAddress": "Srinagar Roads",
      "selected": false
    },
    {
      "index": 2,
      "time": "05:30",
      "point": "Afzal Gunj",
      "pointAddress": "S.R Nagar",
      "selected": false
    },
    {
      "index": 3,
      "time": "06:30",
      "point": "Chourasta Aramghath",
      "pointAddress": "Chourasta Aramghath Gate",
      "selected": false
    },
    {
      "index": 4,
      "time": "07:30",
      "point": "Srinivasa Colony",
      "pointAddress": "Srinivasa Colony",
      "selected": false
    },
  ];

  var dropPoint = [
    {
      "index": 0,
      "time": "03:00",
      "point": "NARAYANAGUDA",
      "pointAddress": "NARAYANAGUDA Nagar",
      "selected": false
    },
    {
      "index": 1,
      "time": "04:30",
      "point": "Vivekanand Colony",
      "pointAddress": "shivam temple Road",
      "selected": false
    },
    {
      "index": 2,
      "time": "05:30",
      "point": "Afzal Gunj",
      "pointAddress": "S.R Nagar",
      "selected": false
    },
    {
      "index": 3,
      "time": "06:30",
      "point": "CHANADANAGAR",
      "pointAddress": "Nanal Nagar",
      "selected": false
    },
    {
      "index": 4,
      "time": "07:30",
      "point": "OPP BAWACHI HOTEL",
      "pointAddress": "OPP BAWACHI HOTEL",
      "selected": false
    },
  ];

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

    PickupDropProvider pickupDropProvider =
        Provider.of<PickupDropProvider>(context, listen: false);

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
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            title: const Text(
              'Select Pickup & Drop Points',
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              controller: _tabController,
              onTap: (value) {},
              labelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  icon: pickUp
                      ? Icon(
                          Icons.beenhere,
                          color: pickUp ? Colors.blue : Colors.black,
                        )
                      : Icon(
                          Icons.beenhere_outlined,
                          color: pickUp ? Colors.blue : Colors.black,
                        ),
                  text: "PICKUP POINTS",
                ),
                Tab(
                  icon: drop
                      ? Icon(
                          Icons.beenhere,
                          color: drop ? Colors.blue : Colors.black,
                        )
                      : Icon(
                          Icons.beenhere_outlined,
                          color: drop ? Colors.blue : Colors.black,
                        ),
                  text: "DROP POINTS",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(children: [
                for (int i = 0; i < listOfPickup.length; i++) ...[
                  ListTile(
                      selected: listOfPickup[i]['selected'] == true,
                      selectedTileColor:
                          const Color.fromARGB(255, 200, 232, 255),
                      onTap: () {
                        setState(() {
                          pickupDropProvider.setPickUpPoint(listOfPickup[i]);
                          pickUp = true;
                          for (int j = 0; j < listOfPickup.length; j++) {
                            listOfPickup[j]['selected'] = false;
                          }
                          listOfPickup[i]['selected'] = true;

                          _tabController
                              .animateTo((_tabController.index + 1) % 2);
                        });
                      },
                      title: Text(
                        "${listOfPickup[i]['point']}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 5, 103, 184),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${listOfPickup[i]['pointAddress']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      leading: Text("${listOfPickup[i]['time']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500))),
                  const Divider(
                    height: 3,
                  ),
                ],
              ]),
              Column(children: [
                for (int i = 0; i < dropPoint.length; i++) ...[
                  ListTile(
                      selected: dropPoint[i]['selected'] == true,
                      selectedTileColor:
                          const Color.fromARGB(255, 200, 232, 255),
                      onTap: () {
                        setState(() {
                          pickupDropProvider.setDropPoint(dropPoint[i]);
                          drop = true;
                          for (int j = 0; j < dropPoint.length; j++) {
                            dropPoint[j]['selected'] = false;
                          }
                          dropPoint[i]['selected'] = true;
                        });
                      },
                      title: Text(
                        "${dropPoint[i]['point']}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 5, 103, 184),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${dropPoint[i]['pointAddress']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      leading: Text("${dropPoint[i]['time']}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500))),
                  const Divider(
                    height: 3,
                  ),
                ],
              ])
            ],
          ),
          bottomSheet: BottomSheets(true, selectSeatProvider.discountFare,
              selectSeatProvider.seatCount, 2),
        ),
      ),
    );
  }
}
