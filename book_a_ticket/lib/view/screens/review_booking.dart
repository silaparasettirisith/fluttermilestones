import 'package:book_a_ticket/models/user.dart';
import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view-models/review_booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:provider/provider.dart';

import 'package:book_a_ticket/view-models/pick_drop_provider.dart';
import 'package:book_a_ticket/view-models/selectprovider.dart';
import 'package:book_a_ticket/view/widgets/bottomsheet.dart';
import 'package:intl/intl.dart';

class ReviewBooking extends StatefulWidget {
  const ReviewBooking({super.key});

  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {
  var gender;

  var emailPhoneNo = {};

  checkTwo(String startTime, String endTime) {
    var format = DateFormat("HH:mm");
    var start = format.parse(startTime);
    var end = format.parse(endTime);

    end = end.add(const Duration(days: 1));
    Duration diff = end.difference(start).abs();
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    return ('$hours::$minutes');
  }

  @override
  Widget build(BuildContext context) {
    SelectSeatProvider selectSeatProvider =
        Provider.of<SelectSeatProvider>(context, listen: false);

    PickupDropProvider pickupDropProvider =
        Provider.of<PickupDropProvider>(context, listen: false);

    ReviewBookingProvider reviewBookingProvider =
        Provider.of<ReviewBookingProvider>(context, listen: false);

    List<User> user = selectSeatProvider.user;

    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);
    List<TextEditingController> name = selectSeatProvider.name;
    List<TextEditingController> age = selectSeatProvider.age;
    TextEditingController email_controller =
        selectSeatProvider.email_controller;
    TextEditingController phonenumber_controller =
        selectSeatProvider.phonenumber_controller;
    var coupouns = selectSeatProvider.coupouns;
    var discount = 0;

    return Scaffold(
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
            title: Consumer<MyTripProvider>(
              builder: (context, data, child) {
                return ListTile(
                  title: const Text(
                    "Review Booking",
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    "${data.travelling_from} to ${data.travelling_to} |  ${data.dateofJourney}",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 113, 107, 107)),
                  ),
                );
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(selectSeatProvider.busSelected.name),
                        subtitle: Text(selectSeatProvider.busSelected.fulltype),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text(
                              "${selectSeatProvider.busSelected.startTime} ${myTripProvider.dateofJourney}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              checkTwo(selectSeatProvider.busSelected.startTime,
                                  selectSeatProvider.busSelected.endTime),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        subtitle: Text(
                            "${pickupDropProvider.selectedPickUpPoint['pointAddress']}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 113, 107, 107),
                            )),
                        isThreeLine: true,
                        trailing: Column(
                          children: [
                            Text(
                                "${selectSeatProvider.busSelected.endTime}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            Text(
                                "${pickupDropProvider.selectedDropPoint['pointAddress']}")
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, top: 1),
                            child: Text(
                                "Selected Seats : ${selectSeatProvider.seatsSelected.join(',')}",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      onChanged: () {
                        reviewBookingProvider.validateFields(user);
                      },
                      key: reviewBookingProvider.form_key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Traveller Details",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          for (int i = 0;
                              i < selectSeatProvider.seatCount;
                              i++) ...[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Name"),
                                  Text(
                                      "Seat ${selectSeatProvider.seatsSelected[i]}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                onSaved: (newValue) {
                                  user[i].name = newValue!;
                                },
                                validator: (value) {
                                  if (value?.length == 0) {
                                    return "Name is Required";
                                  } else if (value!.length < 5) {
                                    return "Name Should be minimum of Length 5";
                                  } else if (value.length > 10) {
                                    return "Name Should be Less than Length 10";
                                  }
                                  return null;
                                },
                                controller: name[i],
                                decoration: const InputDecoration(
                                    label: Text("Name"),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.person)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onSaved: (newValue) {
                                        user[i].age = newValue!;
                                      },
                                      validator: (value) {
                                        if (value?.length == 0) {
                                          return "Age is Requried";
                                        } else if (int.parse(value!) <= 0 ||
                                            (int.parse(value) > 120)) {
                                          return "Invalid Age";
                                        }
                                        return null;
                                      },
                                      controller: age[i],
                                      decoration: const InputDecoration(
                                          label: Text("Age"),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(Icons.person)),
                                    ),
                                  ),
                                  Expanded(
                                      child: GenderPickerWithImage(
                                    linearGradient: const LinearGradient(
                                        colors: [Colors.white, Colors.grey]),
                                    maleText: "Male",
                                    selectedGender: user[i].gender == "Male"
                                        ? Gender.Male
                                        : Gender.Female,
                                    verticalAlignedText: false,

                                    selectedGenderTextStyle: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                    unSelectedGenderTextStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                    onChanged: (value) {
                                      var index = (value?.index);
                                      if (index == 0) {
                                        user[i].gender = "Male";
                                      } else {
                                        user[i].gender = "Female";
                                      }
                                    },
                                    equallyAligned: true,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    isCircular: true,
                                    // default : true,

                                    padding: const EdgeInsets.all(3),
                                    size: 80, //default : 40
                                  ))
                                ],
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      onChanged: () {
                        reviewBookingProvider.validateFields(user);
                      },
                      key: reviewBookingProvider.emailform_key,
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                    "Enter Contact Details to Receive Your e-ticket and updates",
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Icon(Icons.mobile_friendly_outlined)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email_controller,
                            onChanged: (value) {
                              for (int i = 0; i < user.length; i++) {
                                user[i].email = value;
                              }
                            },
                            validator: (value) {
                              RegExp regExp = RegExp(r"^[a-z]*@gmail.com");
                              if (value?.length == 0) {
                                return "Email is Required";
                              } else if (!regExp.hasMatch(value.toString())) {
                                return "Email is Invalid";
                              }
                              return null;
                            },
                            cursorHeight: 3,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your Email Address',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                                child: TextFormField(
                                  enabled: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '+91',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                    for (int i = 0; i < user.length; i++) {
                                      user[i].phoneno = value;
                                    }
                                  },
                                  controller: phonenumber_controller,
                                  validator: (value) {
                                    if (value?.length == 0) {
                                      return "Phonenumber is Requried";
                                    } else if ((value?.length != 10)) {
                                      return "Invalid Phonenumber";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your Phone Number',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Offers & Discounts",
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.price_change_rounded),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Coupons Codes",
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RadioListTile(
                            title: const Text("MEGABUS"),
                            subtitle: const Text(
                                "Get upto . Rs 500 off.Save Rs 25 on this Booking.",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 113, 107, 107),
                                )),
                            value: "MEGABUS",
                            groupValue: coupouns,
                            onChanged: (value) {
                              setState(() {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          "Coupoun is Applied Successfully",
                                        )));

                                discount = 25;
                                selectSeatProvider.applyDiscount(discount);

                                selectSeatProvider.coupouns = value;
                              });
                            }),
                        RadioListTile(
                            title: const Text("FIRST BOOKING"),
                            subtitle: const Text(
                                "Get upto . Rs 1000 off.Save Rs 100 on this Booking."),
                            value: "FIRST",
                            groupValue: coupouns,
                            onChanged: (value) {
                              setState(() {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          "Coupoun is Applied Successfully",
                                        )));

                                discount = 100;
                                selectSeatProvider.applyDiscount(discount);

                                selectSeatProvider.coupouns = value;
                              });
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomSheets(true, selectSeatProvider.discountFare,
            selectSeatProvider.seatCount, 3));
  }
}
