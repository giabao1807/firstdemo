import 'package:firstdemo/MVVM/src/model/user_model.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserData _userData = UserData(username: "John Doe", age: 25);

  UserData get userData => _userData;

  void updateUsername(String newUsername) {
    _userData = UserData(username: newUsername, age: _userData.age);
    notifyListeners();
  }

  void updateAge(int newAge) {
    _userData = UserData(username: _userData.username, age: newAge);
    notifyListeners();
  }
}
