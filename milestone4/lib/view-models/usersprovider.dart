import 'package:flutter/material.dart';
import 'package:milestone4/models/users.dart';
import 'package:milestone4/repository/userservice.dart';

class UsersProvider extends ChangeNotifier {
  var statusmess="";
  var loader=true;

  UsersProvider() {
    
    getUsersList();
  }

  List<Users> users = [];
  getUsersList() async {
    
    var response = await UserService.getUserList();
    print(response);
    if(response==[])
    {
      users=[];
      statusmess="Empty List";
    }
    else
    {
      users=response as List<Users>;
      statusmess="Empty List";
    }
  
    loader=false;
   
    notifyListeners();
  }
  removeuser(index)
  {
    users.removeAt(index);
    print(users);
    notifyListeners();
  }

  adduser(data)
  {
    print(data);
    users.add(data);
    
  }


}
