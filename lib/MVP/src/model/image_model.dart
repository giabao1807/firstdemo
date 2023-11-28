import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageModel {
  Future<String> loadJsonData() async {
    // Load JSON data from an asset file
    // You can use the 'rootBundle' to load assets in Flutter
    return await rootBundle.loadString('assets/file.json');
  }

  AssetImage loadImage(String imagePath) {
    // Load asset image
    return AssetImage(imagePath);
  }
}
