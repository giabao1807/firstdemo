import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text('New Screen'),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/1.svg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
                const Text(
                  'This is a SVG Picture',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text('Counter: $counter',
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                      key: ValueKey(counter)),
                ),
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
                          counter--;
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
                          counter++;
                        });
                      },
                      child: const Text('Increment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}