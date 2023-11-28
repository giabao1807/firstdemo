import 'package:firstdemo/MVC/src/controller/counter_controller.dart';
import 'package:flutter/material.dart';

class MVCScreen extends StatelessWidget {
  const MVCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('MVC'),
        ),
      ),
      body: const CounterController(),
    );
  }
}
