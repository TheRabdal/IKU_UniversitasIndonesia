import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier {
  String _title = 'Indikator Kinerja Utama';

  String get title => _title;

  void setTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}
