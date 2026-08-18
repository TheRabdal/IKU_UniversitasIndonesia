import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AuditProvider extends ChangeNotifier {
  int _selectedFilterIndex = 0;

  int get selectedFilterIndex => _selectedFilterIndex;

  void setFilterIndex(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }
}
