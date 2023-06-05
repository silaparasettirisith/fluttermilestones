import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentIndex = 0;

  var profileview = const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 1,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 2,
          color: Color.fromARGB(255, 180, 221, 0),
          child: SizedBox(
            width: 300,
            height: 150,
            child: Center(
                child: Text(
              "I'm Looking for a Teacher",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(
          width: 100,
          height: 10,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 2,
          /* color:Color.fromARGB(255, 180, 221, 0), */
          child: SizedBox(
            width: 300,
            height: 150,
            child: Center(
                child: Text(
              "I'm Looking for a Teacher",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(
          width: 100,
          height: 10,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 2,
          /* color:Color.fromARGB(255, 180, 221, 0), */
          child: SizedBox(
            width: 300,
            height: 150,
            child: Center(
                child: Text(
              "I'm Looking for a Teacher",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    ),
  );

  var profileappbar = AppBar(
    title: const Text("Sign Up"),
    backgroundColor: const Color.fromARGB(255, 180, 221, 0),
    centerTitle: true,
    toolbarHeight: 100,
    actions: [
      PopupMenuButton(itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(child: Text("Profile")),
          PopupMenuItem(child: Text("Search"))
        ];
      })
    ],
  );

  var searchappbar = AppBar(
    backgroundColor: const Color.fromARGB(255, 180, 221, 0),
    title: Column(
      children: [
        const Text("Search Result"),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Search..',
            hintText: "Search..",
            prefixIcon: const Icon(Icons.arrow_back),
            suffixIcon: Container(
                child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.filter_list),
                Icon(Icons.search),
                Icon(Icons.more_vert_outlined)
              ],
            )),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
        )
      ],
    ),
    centerTitle: true,
    toolbarHeight: 123,
  );

  var searchview = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 300,
              height: 185,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("images/person1.jpg"),
                    title: const Text("Lorem ipsum"),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                            "A professional profile is an introductory section on your resume that highlights "),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            (RatingBar.builder(
                                glowColor: Colors.black,
                                initialRating: 4.5,
                                itemSize: 20,
                                itemBuilder: (context, index) {
                                  return const Icon(Icons.star);
                                },
                                onRatingUpdate: (rationg) {})),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text("4.5"),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text("Rating")
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(184, 225, 208, 110)),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30))),
                          child: const Text("PROFILE",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 180, 221, 0)),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40)),
                            ),
                            child: const Text("HIRE",
                                style: TextStyle(
                                  fontSize: 15,
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 300,
              height: 185,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("images/person1.jpg"),
                    title: const Text("Lorem ipsum"),
                    isThreeLine: true,
                    subtitle: Column(
                      children: [
                        const Text(
                            "A professional profile is an introductory section on your resume that highlights "),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            (RatingBar.builder(
                                glowColor: Colors.black,
                                initialRating: 4,
                                itemSize: 20,
                                itemBuilder: (context, index) {
                                  return const Icon(Icons.star);
                                },
                                onRatingUpdate: (rationg) {})),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text("4"),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text("Rating")
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(184, 225, 208, 110)),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30))),
                          child: const Text("PROFILE",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 180, 221, 0)),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40)),
                            ),
                            child: const Text("HIRE",
                                style: TextStyle(
                                  fontSize: 15,
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

  var view;
  var viewappbar;

  @override
  initState() {
    view = profileview;
    viewappbar = profileappbar;
  }

  onClickNavigation(value) {
    setState(() {
      currentIndex = value;
      if (currentIndex == 0) {
        view = profileview;
        viewappbar = profileappbar;
      } else if (currentIndex == 1) {
        view = searchview;
        viewappbar = searchappbar;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: viewappbar,
        body: view,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            onTap: (value) {
              onClickNavigation(value);
            },
            currentIndex: currentIndex,
            backgroundColor: const Color.fromARGB(255, 180, 221, 0),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.supervised_user_circle_sharp,
                    size: 30,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined, size: 30),
                  label: "")
            ]),
      ),
    );
  }
}
