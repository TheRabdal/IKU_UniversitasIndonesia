import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarProvider extends ChangeNotifier {
  bool _isCollapsed = false;
  bool _isHidden = false;
  int _selectedIndex = 0;
  int _previousIndex = 0;
  int? _hoveredIndex;

  bool get isCollapsed => _isCollapsed;
  bool get isHidden => _isHidden;
  int get selectedIndex => _selectedIndex;
  int get previousIndex => _previousIndex;
  bool get isSlidingUp => _selectedIndex >= _previousIndex;
  int? get hoveredIndex => _hoveredIndex;

  void toggleCollapse() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }

  void setCollapsed(bool value) {
    _isCollapsed = value;
    notifyListeners();
  }

  void toggleHidden() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  void setHidden(bool value) {
    _isHidden = value;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _previousIndex = _selectedIndex;
    _selectedIndex = index;
    notifyListeners();
  }

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }
}
