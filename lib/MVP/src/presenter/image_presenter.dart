import 'dart:convert';
import 'package:firstdemo/MVP/src/contracts/image_contract.dart';
import 'package:flutter/services.dart' show rootBundle;


class ImageItem {
  final String name;
  final String imagePath;

  ImageItem({required this.name, required this.imagePath});
}

class ImagePresenter {
  late ImageContract _view;
  List<ImageItem> _items = [];
  bool _isLoading = true;

  ImagePresenter(this._view);

  List<ImageItem> get items => _items;
  bool get isLoading => _isLoading;

  Future<String> _loadLocalJson() async {
    return await rootBundle.loadString('assets/file.json');
  }

  Future<List<ImageItem>> _parseJson(String jsonString) async {
    final jsonData = json.decode(jsonString) as List<dynamic>;
    return jsonData.map((item) {
      return ImageItem(
        name: item['name'],
        imagePath: item['imagePath'],
      );
    }).toList();
  }

  void loadData() async {
    try {
      String jsonString = await _loadLocalJson();
      _items = await _parseJson(jsonString);
    } catch (e) {
      print('Error loading data: $e');
    } finally {
      _isLoading = false;
      _view.onItemsLoaded();
    }
  }
}
