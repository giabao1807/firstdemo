import 'package:flutter/material.dart';

import 'transform.dart';
import 'rxdart.dart';
import 'blocpattern.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Hero Animation Screen'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const RxDart()));
                },
                child: Hero(
                    tag: 'imageHero',
                    child: Image.asset('assets/images/4.jpg'))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransformScreen()));
                },
                child: const Text('Transform Button')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const BlocScreen()));
                },
                child: const Text('Bloc Button')),
          ],
        ),
      ),
    );
  }
}
