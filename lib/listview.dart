import 'package:flutter/material.dart';
import 'detailpage.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> imageList = [
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '7.jpg',
    '8.jpg',
    '9.jpg',
    '10.png'
  ];

  List<String> customImageNames = [
    'Con thỏ1',
    'Con mèo1',
    'Con cáo',
    'Con gấu',
    'Con mèo 2',
    'Con thỏ 2',
    'Con mèo 3',
    'Con khủng long',
    'Con panda'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment.center,
          child: Text('List View Screen'),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${imageList[index]}',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(customImageNames[index]),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blue.shade900,
                          ),
                          onPressed: () {
                            if (index == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    imageName: customImageNames[index]),
                              ));
                            } else {}
                          },
                          child: const Text('Detail'))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}