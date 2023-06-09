import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view/widgets/bottomsheet.dart';

// ignore: must_be_immutable
class SeatWidget extends StatefulWidget {
  int seatNum;
  String seatAlphabet;
  String seatType;
  SeatWidget(this.seatNum, this.seatAlphabet, this.seatType, {super.key});

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  var visibleBottomSheet = true;

  @override
  Widget build(BuildContext context) {
    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    return Consumer<SelectSeatProvider>(
      builder: (context, data, child) {
        return Expanded(
          flex: 1,
          child: Container(
            height: 90,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: selectSeatProvider.busSelected.seatNumbers[widget.seatNum],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    if (selectSeatProvider
                                .busSelected.seatNumbers[widget.seatNum] ==
                            Colors.white ||
                        selectSeatProvider
                                .busSelected.seatNumbers[widget.seatNum] ==
                            Colors.green) {
                      Scaffold.of(context).showBottomSheet<void>(
                          (BuildContext context) {
                        return BottomSheets(visibleBottomSheet,
                            data.discountFare, data.seatCount, 1);
                      },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)));
                    }

                    setState(() {
                      if (selectSeatProvider.seatsSelected.length <= 3) {
                        if (selectSeatProvider
                                .busSelected.seatNumbers[widget.seatNum] ==
                            Colors.white) {
                          var seatNumber =
                              "${widget.seatAlphabet.toUpperCase()}-${widget.seatNum}${widget.seatType}";
                          selectSeatProvider.addSelectedSeat(
                              seatNumber, int.parse(data.busSelected.price));

                          visibleBottomSheet = true;

                          selectSeatProvider.busSelected
                              .seatNumbers[widget.seatNum] = Colors.green;
                        } else if (selectSeatProvider
                                .busSelected.seatNumbers[widget.seatNum] ==
                            Colors.green) {
                          var seatNumber =
                              "${widget.seatAlphabet.toUpperCase()}-${widget.seatNum}${widget.seatType}";
                          selectSeatProvider.removeSelectedSeat(
                              seatNumber, int.parse(data.busSelected.price));

                          selectSeatProvider.busSelected
                              .seatNumbers[widget.seatNum] = Colors.white;

                          if (data.seatCount == 0) {
                            visibleBottomSheet = false;
                          }
                        }
                      } else {
                        var seatNumber =
                            "${widget.seatAlphabet.toUpperCase()}-${widget.seatNum}${widget.seatType}";
                        if (selectSeatProvider.seatsSelected
                            .contains(seatNumber)) {
                          selectSeatProvider.removeSelectedSeat(
                              seatNumber, int.parse(data.busSelected.price));

                          selectSeatProvider.busSelected
                              .seatNumbers[widget.seatNum] = Colors.white;

                          visibleBottomSheet = true;
                        }
                        if (selectSeatProvider.seatsSelected.length > 3) {
                          visibleBottomSheet = true;
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                    "Maximum Seats Selected",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  )));
                        } else {
                          visibleBottomSheet = true;
                        }
                      }
                    });
                  },
                  child: Center(
                    child: Text(
                      (widget.seatNum < 9 ? '0' : '') +
                          widget.seatNum.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
