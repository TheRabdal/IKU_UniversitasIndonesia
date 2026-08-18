import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String _query = '';
  bool _isSearchExpanded = false;

  String get query => _query;
  bool get isSearchExpanded => _isSearchExpanded;

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void expandSearch() {
    _isSearchExpanded = true;
    notifyListeners();
  }

  void collapseSearch() {
    _isSearchExpanded = false;
    searchController.clear();
    _query = '';
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    _query = '';
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
