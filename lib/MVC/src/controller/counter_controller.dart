import 'package:flutter/material.dart';

import '../model/counter_model.dart';
import '../view/counter_view.dart';

class CounterController extends StatefulWidget {
  const CounterController({super.key});

  @override
  State<CounterController> createState() => _CounterControllerState();
}

class _CounterControllerState extends State<CounterController> {
  final CounterModel _model = CounterModel();
  @override
  Widget build(BuildContext context) {
    return CounterView(model: _model);
  }
}
