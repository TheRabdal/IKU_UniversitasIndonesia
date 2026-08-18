import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier {
  int? _hoveredIndex;
  bool _searchHovered = false;
  bool _searchExpanded = false;
  final TextEditingController searchController = TextEditingController();

  int? get hoveredIndex => _hoveredIndex;
  bool get searchHovered => _searchHovered;
  bool get searchExpanded => _searchExpanded;

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }

  void setSearchHovered(bool value) {
    _searchHovered = value;
    notifyListeners();
  }

  void expandSearch() {
    _searchExpanded = true;
    notifyListeners();
  }

  void collapseSearch() {
    _searchExpanded = false;
    searchController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
