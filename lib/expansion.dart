import 'package:flutter/material.dart';

import 'gridview/gridview.dart';
import 'listview.dart';
import 'curvedanimation/curvedanimation.dart';



class ExpansionScreen extends StatefulWidget {
  const ExpansionScreen({super.key});

  @override
  State<ExpansionScreen> createState() => _ExpansionScreenState();
}

class _ExpansionScreenState extends State<ExpansionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Expansion Screen'),
        ),
      ),
      body: ExpansionTile(
        title: const Text('Screens'),
        children: [
          ListTile(
            textColor: Colors.red,
            title: const Text('Grid View'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GridViewScreen(),
              ));
            },
          ),
          ListTile(
            textColor: Colors.orange,
            title: const Text('List View'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListViewScreen(),
              ));
            },
          ),
          ListTile(
            textColor: Colors.green,
            title: const Text('Curved Animation'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CurvedAnimationScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}