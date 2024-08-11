import 'package:flutter/material.dart';

class Eventsprovider with ChangeNotifier {

  bool isLoading = true;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}