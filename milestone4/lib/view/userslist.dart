import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:milestone4/view-models/usersprovider.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  var currentidex = 0;
  bool loader = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UsersProvider user_provider =
        Provider.of<UsersProvider>(context, listen: false);

    late Users u = Users(
        id: 17,
        name: "name",
        email: "email",
        phoneno: "phoneno",
        companyName: "companyName");

    var form_key = GlobalKey<FormState>();

    var userview = Consumer<UsersProvider>(
      builder: (context, data, child) {
        loader = data.loader;

        return loader
            ? Center(child: CircularProgressIndicator())
            : (data.users.length == 0
                ? Center(
                  child: Text(
                      "Empty List",
                      textScaleFactor: 1,
                    ),
                )
                : ListView.builder(
                    itemCount: data.users.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          user_provider.removeuser(index);
                        },
                        background: Container(color: Colors.red),
                        key: ValueKey(data.users[index].id),
                        child: ListTile(
                          leading: Image.asset("images/person1.jpg"),
                          title: Text("${data.users[index].name}"),
                          subtitle: Text("${data.users[index].companyName}"),
                        ),
                      );
                    },
                  ));
      },
    );
    var formview = Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
            key: form_key,
            child: Column(children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: RequiredValidator(errorText: 'name is required'),
                onSaved: (value) {
                  u.name = value.toString();
                },
                decoration: const InputDecoration(
                    labelText: 'Enter name',
                    hintText: 'Enter name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: RequiredValidator(errorText: 'email is required'),
                onSaved: (value) {
                  u.email = value.toString();
                },
                decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: RequiredValidator(errorText: 'phoneno is required'),
                onSaved: (value) {
                  u.phoneno = value.toString();
                },
                decoration: const InputDecoration(
                    labelText: 'Enter phoneno',
                    hintText: 'Enter phoneno',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    RequiredValidator(errorText: 'companyname is required'),
                onSaved: (value) {
                  u.companyName = value.toString();
                },
                decoration: const InputDecoration(
                    labelText: 'Enter CompanyName',
                    hintText: 'Enter CompanyName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                  if (!form_key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Invalid Form'),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Added Successfully'),
                    ));
                    form_key.currentState!.save();
                    user_provider.adduser(u);
                    form_key.currentState!.reset();
                  }
                },
              )
            ])),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: currentidex == 0
              ? const Text("Employees List")
              : const Text("Add Employee"),
        ),
        body: currentidex == 0 ? userview : formview,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentidex,
            onTap: (value) {
              setState(() {
                currentidex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home Page"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: "Add Person")
            ]));
  }
}
