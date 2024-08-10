import 'package:flutter/material.dart';

class Loadingprovider extends ChangeNotifier {
  bool isLoading = true;

  bool isSignedIn = false;

  bool isPODLoaded = false;

  void updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void updateSignIn(bool value) {
    isSignedIn = value;
    notifyListeners();
  }

  void updatePOD(bool value) {
    isPODLoaded = value;
    notifyListeners();
  }
}
