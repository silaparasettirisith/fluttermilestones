import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'applications.dart';

class JobsView extends StatefulWidget {
  JobsView({super.key});

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  var current_index = 0;
  var view;
  var f = const ApplicationView();
  var screen1 = SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Developer",
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: const Text("Jobs",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text("Recommended For You",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        deleteIcon: const Icon(
                          Icons.close,
                        ),
                        onDeleted: () {},
                        deleteIconColor: Colors.black,
                        elevation: 20,
                        padding: const EdgeInsets.all(10),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.black,
                        //CircleAvatar
                        label: const Text(
                          'Developers',
                          style: TextStyle(fontSize: 15),
                        ), //Text
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                        deleteIcon: const Icon(
                          Icons.close,
                        ),
                        onDeleted: () {},
                        deleteIconColor: Colors.black,
                        elevation: 20,
                        padding: const EdgeInsets.all(10),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.black,
                        //CircleAvatar
                        label: const Text(
                          'San -Francisco',
                          style: TextStyle(fontSize: 15),
                        ), //Text
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Chip(
                        deleteIcon: const Icon(
                          Icons.close,
                        ),
                        onDeleted: () {},
                        deleteIconColor: Colors.black,
                        elevation: 20,
                        padding: const EdgeInsets.all(10),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.black,
                        //CircleAvatar
                        label: const Text(
                          '\$10 - 50h',
                          style: TextStyle(fontSize: 15),
                        ), //Text
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                        deleteIcon: const Icon(
                          Icons.close,
                        ),
                        onDeleted: () {},
                        deleteIconColor: Colors.black,
                        elevation: 20,
                        padding: const EdgeInsets.all(10),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.black,
                        //CircleAvatar
                        label: const Text(
                          'Part-Time',
                          style: TextStyle(fontSize: 15),
                        ), //Text
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/g.jpg",
                                width: 100,
                                height: 100,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE0E0E0),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Part-Time",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          const Text("Flutter UI/UX Designer"),
                          const Text(
                            "\$40/h",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/g.jpg",
                                width: 100,
                                height: 100,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE0E0E0),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Part-Time",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          const Text("Flutter UI/UX Designer"),
                          const Text(
                            "\$40/h",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "images/g.jpg",
                                width: 100,
                                height: 100,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE0E0E0),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Part-Time",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          const Text("Flutter UI/UX Designer"),
                          const Text(
                            "\$40/h",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text("Recently Added",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoListTile(
                    leadingSize: 50,
                    leading: Image.asset(
                      "images/g.jpg",
                      width: 100,
                      height: 100,
                    ),
                    title: const Text("Flutter UI/UX Designer"),
                    subtitle: const Text("Nike Technologies"),
                    trailing: const Text(
                      "\$40/h",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoListTile(
                    leadingSize: 50,
                    leading: Image.asset(
                      "images/g.jpg",
                      width: 100,
                      height: 100,
                    ),
                    title: const Text("Flutter UI/UX Designer"),
                    subtitle: const Text("Nike Technologies"),
                    trailing: const Text(
                      "\$40/h",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoListTile(
                    leadingSize: 50,
                    leading: Image.asset(
                      "images/g.jpg",
                      width: 100,
                      height: 100,
                    ),
                    title: const Text("Flutter UI/UX Designer"),
                    subtitle: const Text("Nike Technologies"),
                    trailing: const Text(
                      "\$40/h",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );

  @override
  initState() {
    super.initState();
    view = screen1;
  }

  @override
  Widget build(BuildContext context) {
    var screen2 = const ApplicationView();

    change(value) {
      setState(() {
        current_index = value;
        if (current_index == 1) {
          view = screen2;
        } else {
          view = screen1;
        }
      });
    }

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        leading: Icon(Icons.format_list_bulleted),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search),
            Icon(Icons.filter_list_sharp),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE0E0E0),
      body: view,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: current_index,
        onTap: (value) {
          change(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.star_fill,
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Apllications',
          )
        ],
      ),
    );
  }
}
