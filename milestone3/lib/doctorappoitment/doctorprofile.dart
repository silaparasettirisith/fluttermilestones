import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/doctor.jpg"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                      title: const Text("Dr Cybdom Tech"),
                      subtitle: const Text("General Practitioner"),
                      trailing: ElevatedButton(
                          onPressed: () {}, child: const Icon(Icons.email))),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Row(
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
                          width: 100,
                        ),
                        Container(
                          child: const Text(
                            "See All Reviews",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("About",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text(
                            "Check the advisories issued by the Ministry of Health and Family Welfare before visiting a medical facility."),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: const Text(
                            "See More",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text("Working Hours",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            const Text("Mon-Fri 09:00 - 17:00"),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Open"))
                          ],
                        ),
                        const Text(
                          "Stats",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: const Column(
                                children: [Text("385"), Text("Patient")],
                              ),
                            ),
                            Container(
                              child: const Column(
                                children: [Text("15"), Text("Experience")],
                              ),
                            ),
                            Container(
                              child: const Column(
                                children: [Text("10"), Text("Certifications")],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 80))),
                          onPressed: () {},
                          child: const Text(
                            "Make an Appointment",
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
