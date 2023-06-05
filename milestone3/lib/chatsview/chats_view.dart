import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import 'chats_model.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  List<Chats> chats = [
    Chats("images/person1.jpg", "Kriss Benwat", "Good to Know", "Today"),
    Chats("images/person1.jpg", "Kriss Benwat", "Good to Know", "Today"),
    Chats("images/person1.jpg", "Kriss Benwat", "Good to Know", "Today"),
    Chats("images/person1.jpg", "Kriss Benwat", "Good to Know", "Today")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Conversations",
          textScaleFactor: 1,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton.icon(
            label: const Text("Add New"),
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SearchBar(leading: Icon(Icons.search), hintText: "Search.."),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                var chat = chats[index];
                return Dismissible(
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    chats.removeAt(index);
                  },
                  key: ValueKey<Chats>(chat),
                  child: ListTile(
                    onTap: () {
                      print("show chats");
                    },
                    trailing: Text("${chat.status}"),
                    leading: InkWell(
                      onTap: () {
                        print("show person details");

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 10),
                                  InkWell(
                                    child: Image.asset("${chat.image}"),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog.fullscreen(
                                              child:
                                                  Image.asset("${chat.image}"),
                                            );
                                          });
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Text("${chat.heading}"),
                                  const SizedBox(height: 15),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  )
                                ]),
                          ),
                        );
                      },
                      child: Image.asset("${chat.image}"),
                    ),
                    title: Text("${chat.heading}"),
                    subtitle: Text("${chat.subheading}"),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
