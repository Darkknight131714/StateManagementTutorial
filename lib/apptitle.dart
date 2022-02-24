import 'package:flutter/cupertino.dart';

class MyAppBarTitle extends ChangeNotifier {
  String title;
  MyAppBarTitle({required this.title});
  void changeTitle(String value) {
    title = value;
    notifyListeners();
  }
}
