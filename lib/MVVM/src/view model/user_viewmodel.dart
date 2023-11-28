
import 'package:firstdemo/MVVM/src/model/user_model.dart';
import 'package:flutter/material.dart';


class UserViewModel extends ChangeNotifier {
  late User _user;

  User get user => _user;

  UserViewModel() {
    
    _user = User(name: '', age: 0);
  }

  void updateUser(String name, int age) {
    _user = User(name: name, age: age);
    notifyListeners();
  }
}
