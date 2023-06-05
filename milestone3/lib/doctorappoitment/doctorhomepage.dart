import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:milestone3/doctorappoitment/doctorprofile.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              title: Text("Hello ,"),
              titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
              subtitleTextStyle: TextStyle(fontSize: 35, color: Colors.black),
              subtitle: Text("Cybdom"),
              trailing: Icon(Icons.all_inbox_rounded),
            ),
            const SizedBox(
              height: 10,
            ),
            const SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search",
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(children: [
              Image.asset(
                "images/d3.jpg",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const Text(
                      "Do you have Symptons of Covid-19?",
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Contact A Doctor")),
                    )
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Categories",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/person1.jpg",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("General Practitioner")
                      ],
                    )),
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/person1.jpg",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("Dental Surgery")
                      ],
                    )),
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    child: Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/person1.jpg",
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("General Practitioner")
                      ],
                    )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Top Doctors",
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 180,
                  height: 10,
                ),
                Container(
                  child: const Text(
                    "See All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  trailing: Column(
                    children: [
                      /*          Icon(Icons.abc,size: 3,), */
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DoctorProfile();
                            }));
                          },
                          child: const Text("Open")),
                    ],
                  ),
                  leading: Image.asset("images/person1.jpg"),
                  title: const Text(
                    "Dr Cybdom Tech",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("General Practitioner")),
                      Row(
                        children: [
                          (RatingBar.builder(
                              initialRating: 4,
                              itemSize: 20,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                );
                              },
                              onRatingUpdate: (rationg) {})),
                          const Text("(1300)"),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  trailing: Column(
                    children: [
                      /* Icon(Icons.abc,size: 10,), */
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DoctorProfile();
                            }));
                          },
                          child: const Text("Open"))
                    ],
                  ),
                  leading: Image.asset("images/person1.jpg"),
                  title: const Text(
                    "Dr Cybdom Tech",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("General Practitioner")),
                      Row(
                        children: [
                          (RatingBar.builder(
                              initialRating: 4,
                              itemSize: 20,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 191, 0),
                                );
                              },
                              onRatingUpdate: (rationg) {})),
                          const Text("(1300)"),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
