import 'dart:math';

import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view-models/pick_drop_provider.dart';
import 'package:book_a_ticket/view-models/review_booking_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/screens/my_trips.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({super.key});

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  var loader = false;
  var visibleAlert = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);

    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    PickupDropProvider pickupDropProvider =
        Provider.of<PickupDropProvider>(context, listen: false);

    ReviewBookingProvider reviewBookingProvider =
        Provider.of<ReviewBookingProvider>(context, listen: false);

    Future<void> getloader() async {
      for (int i = 0; i < reviewBookingProvider.users.length; i++) {
        var number = reviewBookingProvider.users[i].seatnumber
            .replaceAll(RegExp('[a-zA-z-]'), '');

        selectSeatProvider.busSelected.seatNumbers[int.parse(number)] =
            Colors.red;
      }

      myTripProvider.addUpcomingTrip(
          reviewBookingProvider.users,
          pickupDropProvider.selectedPickUpPoint,
          pickupDropProvider.selectedDropPoint,
          Random().nextInt(100) + 1000,
          selectSeatProvider.busSelected.name);
      await Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          loader = false;
          visibleAlert = true;
          selectSeatProvider.resetSelectedProvider();
          reviewBookingProvider.resetReviewBookingProvider();
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Select Payment Mode",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Due Now",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "\u{20B9}${selectSeatProvider.discountFare}",
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Consumer<MyTripProvider>(
                            builder: (context, data, child) {
                          return ListTile(
                            leading: const Icon(Icons.bus_alert),
                            title: Text(
                                "${data.travelling_from} --> ${data.travelling_to} ( ${selectSeatProvider.busSelected.name})"),
                            subtitle: Text("Starting:${data.dateofJourney}"),
                          );
                        }),
                        const Divider(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                    "${reviewBookingProvider.users[0].name.toUpperCase()}  (${reviewBookingProvider.users[0].gender}) ${reviewBookingProvider.users[0].age} yrs"),
                                reviewBookingProvider.users.length == 1
                                    ? const Text("")
                                    : Text(
                                        "+ ${reviewBookingProvider.users.length - 1} more ")
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      // border color
                      color: Colors.blue.shade200,
                      // border thickness
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Medical Treatment",
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Divider(
                          height: 1,
                        ),
                        const ListTile(
                          leading: Icon(Icons.bus_alert),
                          isThreeLine: true,
                          title: Text("Over 3 lac customers insured"),
                          subtitle: Text(
                              "Covers diagnosis,medicine and prescription cost for 15 days of trip and upto Rs 25k T&C"),
                          trailing: Icon(
                            Icons.health_and_safety,
                            size: 50,
                          ),
                        ),
                        const Divider(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                onPressed: () {
                                  return;
                                },
                                child: const Text("Add @49")))
                      ],
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Other Pay Options",
                              style: Theme.of(context).textTheme.titleLarge,
                            )),
                        const SizedBox(
                          height: 2,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            child: Image.asset("assets/images/phonepay.png"),
                          ),
                          title: const Text("PhonePay"),
                          subtitle: const Text("Pay With Phone Pay"),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                            onPressed: () {
                              setState(() {
                                loader = true;
                                getloader();
                              });
                            },
                          ),
                        ),
                        const Divider(
                          height: 3,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              child:
                                  Image.asset("assets/images/googlepay.png")),
                          title: const Text("GooglePay"),
                          subtitle: const Text("Pay With GooglePay"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              child: Image.asset("assets/images/paytm.jpeg")),
                          title: const Text("Paytm"),
                          subtitle: const Text("Pay With Paytm"),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        if (loader)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (loader)
          const Center(
            child: CircularProgressIndicator(),
          ),
        Visibility(
          visible: visibleAlert,
          child: Stack(children: [
            const Opacity(
              opacity: 0.5,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
            AlertDialog(
              icon: const Icon(Icons.done, color: Colors.green, size: 50),
              title: const Text(
                'Payment Successful',
                textScaleFactor: 1,
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Align(
                      alignment: Alignment.center, child: Text('Ok')),
                  onPressed: () {
                    /*  reviewBookingProvider.resetReviewBookingProvider(); */
                    /* pickupDropProvider.resetPickupDrop(); */
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const MyTrips();
                      },
                    ));
                  },
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
