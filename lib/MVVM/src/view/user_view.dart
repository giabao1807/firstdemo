// main.dart
import 'package:firstdemo/MVVM/src/view%20model/user_viewmodel.dart';
import 'package:flutter/material.dart';




class MVVMScreen extends StatelessWidget {
  final UserViewModel _userViewModel = UserViewModel();

   MVVMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MVVM Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${_userViewModel.user.name}'),
              Text('Age: ${_userViewModel.user.age}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _userViewModel.updateUser('John Doe', 30);
                },
                child: const Text('Update User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
