import 'package:flutter/material.dart';



class DetailScreen extends StatelessWidget {
  final String imageName;

  const DetailScreen({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName),
          ],
        ),
      ),
    );
  }
}