import 'package:book_a_ticket/models/user.dart';
import 'package:book_a_ticket/view-models/review_booking_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/screens/pickup_drop.dart';
import 'package:book_a_ticket/view/screens/review_booking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view/screens/payment_mode.dart';

class BottomSheets extends StatefulWidget {
  var visibleBottomSheet;
  var totalFare;
  var seatCount;
  var nextRoute;
  BottomSheets(
      this.visibleBottomSheet, this.totalFare, this.seatCount, this.nextRoute,
      {super.key});

  @override
  State<BottomSheets> createState() => _BottomSheetsState();
}

class _BottomSheetsState extends State<BottomSheets> {
  @override
  Widget build(BuildContext context) {
    ReviewBookingProvider reviewBookingProvider =
        Provider.of<ReviewBookingProvider>(context, listen: false);

    final selectSeatProvider = context.read<SelectSeatProvider>();

    return (Visibility(
      visible: widget.visibleBottomSheet,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: 60,
        color: Colors.transparent,
        child: Center(
          child: Consumer<ReviewBookingProvider>(
            builder: (context, data, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "\u{20B9}${widget.totalFare}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "For ${widget.seatCount} Seat",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      if (widget.nextRoute == 1) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return PickUpDrop();
                          },
                        )).then((value) {
                          setState(() {
                            widget.totalFare = selectSeatProvider.discountFare;
                          });
                        });
                      } else if (widget.nextRoute == 2) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ReviewBooking();
                          },
                        )).then((value) {
                          setState(() {
                            widget.totalFare = selectSeatProvider.discountFare;
                          });
                        });
                      } else if (widget.nextRoute == 3) {
                        if (data.userValidate == false) {
                          reviewBookingProvider
                              .validateFields(reviewBookingProvider.users);
                          return;
                        } else {
                          FocusScope.of(context).unfocus();

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              List<User> f = [];
                              for (int i = 0;
                                  i < reviewBookingProvider.users.length;
                                  i++) {
                                if (reviewBookingProvider.users[i].name
                                        .trim()
                                        .length !=
                                    0) {
                                  f.add(reviewBookingProvider.users[i]);
                                }
                              }
                              for (int i = 0;
                                  i < selectSeatProvider.seatsSelected.length;
                                  i++) {
                                f[i].seatnumber =
                                    selectSeatProvider.seatsSelected[i];
                              }
                              reviewBookingProvider.users = f;

                              return const PaymentMode();
                            },
                          ));
                        }
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
