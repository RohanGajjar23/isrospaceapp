import 'package:flutter/material.dart';

class Newsloadingprovider with ChangeNotifier {
  bool isLoading = true;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

}