import 'package:firstdemo/MVVM/src/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username: ${userViewModel.userData.username}\nAge: ${userViewModel.userData.age}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Enter Username'),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Enter Age'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    userViewModel.updateUsername(_usernameController.text);
                  },
                  child: const Text('Update Username'),
                ),
                ElevatedButton(
                  onPressed: () {
                    userViewModel.updateAge(int.parse(_ageController.text));
                  },
                  child: const Text('Update Age'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
