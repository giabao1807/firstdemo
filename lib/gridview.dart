import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detailscreen.dart';


class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  
List<MyData> _data = [];
 @override
  void initState() {
    super.initState();
    loadData().then((data) {
      setState(() {
        _data = data;
      });
    });
  }
  void _handleImageTap(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailScreen(imageName:_data[index].name,),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Align(
            alignment: Alignment.center,
            child: Text('Grid View Screen'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: _data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 300),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/${_data[index].imagePath}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _data[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        _handleImageTap(index);
                      },
                      child: const Text('Detail'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyData {
  final String name;
  final String imagePath;

  MyData({required this.name, required this.imagePath});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }
}

Future<List<MyData>> loadData() async {
  final String jsonString = await rootBundle.loadString("assets/file.json");
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => MyData.fromJson(json)).toList();
}