import 'package:flutter/material.dart';

class DeveloperView extends StatelessWidget {
  const DeveloperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 161, 161),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Google LLC'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      "images/g.jpg",
                      width: 140,
                      height: 100,
                    ),
                    const Text(
                      "Product Designer",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                    const Text(
                      "San Francisco,California",
                      style: TextStyle(
                          color: Color.fromARGB(255, 166, 161, 161),
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 166, 161, 161),
                              foregroundColor: Colors.black,
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40)),
                          onPressed: () {},
                          child: const Text(
                            "Part-Time",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          "\$60/h",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19,
                        ),
                        Text(
                          "Requirements",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        Text(
                          "- Various widgets add one to change the default text theme, such as Scaffold, Dialog, AppBar, ListTile,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontSize: 13,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "- Various widgets add one to change the default text theme, such as Scaffold, Dialog, AppBar, ListTile,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontSize: 13,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "- Various widgets add one to change the default text theme, such as Scaffold, Dialog, AppBar, ListTile,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontSize: 13,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "- Various widgets add one to change the default text theme, such as Scaffold, Dialog, AppBar, ListTile,",
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 161, 161),
                              fontSize: 13,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            const Icon(
                              color: Colors.red,
                              Icons.favorite,
                              size: 50,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 60, top: 20, bottom: 20),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Apply Now",
                                  style: TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
