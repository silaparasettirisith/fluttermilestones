import 'package:book_a_ticket/view-models/busprovider.dart';
import 'package:book_a_ticket/view-models/my_trip_provider.dart';
import 'package:book_a_ticket/view/screens/travel_buses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:intl/intl.dart';

class BusSearch extends StatefulWidget {
  const BusSearch({Key? key}) : super(key: key);

  @override
  State<BusSearch> createState() => _BusSearchState();
}

class _BusSearchState extends State<BusSearch> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController travelling_from = TextEditingController();
  TextEditingController travelling_to = TextEditingController();

  // ignore: non_constant_identifier_names
  final _form_key = GlobalKey<FormState>();
  var cities = [
    "Ahmedabad",
    "Bangalore",
    "Chennai",
    "Coimbatore",
    "Delhi",
    "Hyderabad",
    "Indore",
    "Jaipur",
    "Kolkata",
    "Lucknow",
    "Mumbai",
    "Pune",
    "Surat",
    "Vadodara",
    "Visakhapatnam",
    "Bhopal",
    "Chandigarh",
    "Kochi",
    "Thiruvananthapuram",
    "Guwahati",
    "Ludhiana",
    "Agra",
    "Nashik",
    "Faridabad",
    "Meerut",
    "Rajkot",
    "Kalyan-Dombivali",
    "Vasai-Virar",
    "Pimpri-Chinchwad",
    "Thane",
    "Patna",
    "Ghaziabad"
  ];

  final focus = FocusNode();
  final focus2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    MyTripProvider myTripProvider =
        Provider.of<MyTripProvider>(context, listen: false);

    BusProvider busProvider = Provider.of<BusProvider>(context, listen: false);
    final suggestions = List.generate(cities.length, (index) => cities[index]);
    return GestureDetector(
      onTap: () {
        focus.unfocus();
        focus2.unfocus();
        if (false == _form_key.currentState?.validate()) {
          return;
        }
      },
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
              leading: const Icon(
                Icons.bus_alert,
                color: Colors.black,
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 241, 249, 255)
                    ],
                  ),
                ),
              ),
              title: Text(
                'Bus Search',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _form_key,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchField(
                          validator: (p0) {
                            if (p0?.length == 0) {
                              return "Travelling From Required";
                            } else if (travelling_from.text ==
                                travelling_to.text) {
                              return "Travelling From and Travelling To Should be Distinct";
                            }
                            return null;
                          },
                          controller: travelling_from,
                          searchInputDecoration: InputDecoration(
                            icon: const Icon(
                              Icons.travel_explore,
                              size: 25,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onSearchTextChanged: (query) {
                            _form_key.currentState?.validate();
                            final filter = suggestions
                                .where((element) => element
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                            return filter
                                .map((e) => SearchFieldListItem<String>(e,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(e,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                    )))
                                .toList();
                          },
                          key: const Key('searchfield1'),
                          hint: 'Travelling From',
                          itemHeight: 50,
                          suggestionsDecoration: SuggestionDecoration(
                              padding: const EdgeInsets.all(10),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          suggestions: suggestions
                              .map((e) => SearchFieldListItem<String>(e,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(e,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black)),
                                  )))
                              .toList(),
                          focusNode: focus,
                          suggestionState: Suggestion.expand,
                          onSuggestionTap: (SearchFieldListItem<String> x) {
                            focus.unfocus();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SearchField(
                          validator: (p0) {
                            if (p0?.length == 0) {
                              return "Travelling To Required";
                            } else if (travelling_from.text ==
                                travelling_to.text) {
                              return "Travelling From and Travelling To Should be Distinct";
                            }

                            return null;
                          },
                          controller: travelling_to,
                          searchInputDecoration: InputDecoration(
                            icon: const Icon(
                              Icons.travel_explore,
                              size: 25,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onSearchTextChanged: (query) {
                            _form_key.currentState?.validate();
                            final filter = suggestions
                                .where((element) => element
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                            return filter
                                .map((e) => SearchFieldListItem<String>(e,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(e,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)),
                                    )))
                                .toList();
                          },
                          key: const Key('searchfield2'),
                          hint: 'Travelling To',
                          itemHeight: 50,
                          suggestionsDecoration: SuggestionDecoration(
                              padding: const EdgeInsets.all(10),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          suggestions: suggestions
                              .map((e) => SearchFieldListItem<String>(e,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(e,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black)),
                                  )))
                              .toList(),
                          focusNode: focus2,
                          suggestionState: Suggestion.expand,
                          onSuggestionTap: (SearchFieldListItem<String> x) {
                            focus2.unfocus();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            onChanged: (value) {
                              _form_key.currentState?.validate();
                            },
                            readOnly: true,
                            controller: dateCtl,
                            validator: (p0) {
                              if (p0?.length == 0) {
                                return "Date is Required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.date_range,
                                  size: 25,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "Date",
                                labelStyle: const TextStyle(fontSize: 17)),
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  dateCtl.text = DateFormat('dd MMM EEE yyyy')
                                      .format(selectedDate);
                                }
                              });
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        FilledButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              var validation =
                                  _form_key.currentState?.validate();
                              _form_key.currentState?.save();
                              if (validation == true &&
                                  travelling_from.text != travelling_to.text) {
                                myTripProvider.setMyTripProvider(
                                    travelling_from.text,
                                    travelling_to.text,
                                    dateCtl.text);
                                busProvider.filterBuses(
                                    travelling_from.text, travelling_to.text);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    var from = myTripProvider.travelling_from;
                                    var to = myTripProvider.travelling_to;
                                    return TravelBuses(from, to);
                                  },
                                ));
                              }
                            },
                            child: Text(
                              "Search Buses",
                              style: Theme.of(context).textTheme.titleMedium,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
