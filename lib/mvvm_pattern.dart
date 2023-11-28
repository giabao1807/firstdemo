import 'package:firstdemo/MVVM/src/view/user_view.dart';
import 'package:firstdemo/MVVM/src/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MVVMScreen extends StatelessWidget {
  const MVVMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MVVM'),
        ),
        body: UserView(),
      ),
    );
  }
}
