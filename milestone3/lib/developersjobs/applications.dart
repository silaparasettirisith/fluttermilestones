import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milestone3/developersjobs/developerview.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  "Your",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: const Text("application(3)",
                    textScaleFactor: 2,
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
                        borderRadius: BorderRadius.circular(20)),
                    child: CupertinoListTile(
                      leadingSize: 50,
                      leading: Image.asset(
                        "images/d1.jpg",
                        width: 100,
                        height: 100,
                      ),
                      title: const Text("Flutter UI/UX Designer"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("Nike Technologies"),
                              SizedBox(
                                width: 110,
                              ),
                              Icon(Icons.more_vert_outlined),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE0E0E0),
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40)),
                                /* padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30))), */
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const DeveloperView();
                                  }));
                                },
                                child: const Text("Open"),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "\$40/h",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
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
                        borderRadius: BorderRadius.circular(20)),
                    child: CupertinoListTile(
                      leadingSize: 50,
                      leading: Image.asset("images/d1.jpg"),
                      title: const Text("Flutter UI/UX Designer"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("Nike Technologies"),
                              SizedBox(
                                width: 110,
                              ),
                              Icon(Icons.more_vert_outlined),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE0E0E0),
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40)),
                                /* padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30))), */
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const DeveloperView();
                                  }));
                                },
                                child: const Text("Open"),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "\$40/h",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
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
                        borderRadius: BorderRadius.circular(20)),
                    child: CupertinoListTile(
                      leadingSize: 50,
                      leading: Image.asset("images/g.jpg"),
                      title: const Text("Flutter UI/UX Designer"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("Nike Technologies"),
                              SizedBox(
                                width: 110,
                              ),
                              Icon(Icons.more_vert_outlined),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE0E0E0),
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40)),
                                /* padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30))), */
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const DeveloperView();
                                  }));
                                },
                                child: const Text("Open"),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "\$40/h",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
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
  }
}
