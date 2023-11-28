// counter_view.dart
import 'package:flutter/material.dart';
import '../model/counter_model.dart';

class CounterView extends StatefulWidget {
  final CounterModel model;

  const CounterView({Key? key, required this.model}) : super(key: key);

  set counter(int counter) {}

  set onPressed(void Function() onPressed) {}

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Counter: ${widget.model.counter}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.blue.shade900,
                ),
                onPressed: () {
                  setState(() {
                    widget.model.decrement();
                  });
                },
                child: const Text('Decrement'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.blue.shade900,
                ),
                onPressed: () {
                  setState(() {
                    widget.model.increment();
                  });
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
