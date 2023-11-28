import 'package:firstdemo/MVP/src/view/image_view.dart';
import 'package:flutter/material.dart';

class MVPScreen extends StatelessWidget {
  const MVPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('MVP'),
        ),
      ),
      body: const ImageView(),
    );
  }
}
