import 'package:flutter/material.dart';
import 'package:milestone4/view-models/usersprovider.dart';
import 'package:milestone4/view/userslist.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home:  ChangeNotifierProvider(create: (context) => UsersProvider(),child:const UsersList())));
}
