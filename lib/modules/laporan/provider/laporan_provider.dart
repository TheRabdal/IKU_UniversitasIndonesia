import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class LaporanProvider extends ChangeNotifier {
  String _selectedYear = '2025/2026';
  String _searchQuery = '';

  String get selectedYear => _selectedYear;
  String get searchQuery => _searchQuery;

  final List<FakultasRekapModel> _fakultasList = const [
    FakultasRekapModel(
      rank: 1,
      fakultas: 'Fakultas Ilmu Komputer',
      code: 'FASILKOM',
      avgScore: 92.4,
      achievedIkuCount: 8,
      status: 'Sangat Baik',
    ),
    FakultasRekapModel(
      rank: 2,
      fakultas: 'Fakultas Teknik',
      code: 'FT',
      avgScore: 89.8,
      achievedIkuCount: 7,
      status: 'Sangat Baik',
    ),
    FakultasRekapModel(
      rank: 3,
      fakultas: 'Fakultas Ekonomi dan Bisnis',
      code: 'FEB',
      avgScore: 87.5,
      achievedIkuCount: 7,
      status: 'Baik',
    ),
    FakultasRekapModel(
      rank: 4,
      fakultas: 'Fakultas Kedokteran',
      code: 'FK',
      avgScore: 85.2,
      achievedIkuCount: 6,
      status: 'Baik',
    ),
    FakultasRekapModel(
      rank: 5,
      fakultas: 'Fakultas Matematika & IPA',
      code: 'FMIPA',
      avgScore: 82.0,
      achievedIkuCount: 6,
      status: 'Baik',
    ),
    FakultasRekapModel(
      rank: 6,
      fakultas: 'Fakultas Hukum',
      code: 'FH',
      avgScore: 80.4,
      achievedIkuCount: 5,
      status: 'Cukup',
    ),
    FakultasRekapModel(
      rank: 7,
      fakultas: 'Fakultas Ilmu Administrasi',
      code: 'FIA',
      avgScore: 78.6,
      achievedIkuCount: 5,
      status: 'Cukup',
    ),
    FakultasRekapModel(
      rank: 8,
      fakultas: 'Fakultas Ilmu Sosial & Politik',
      code: 'FISIP',
      avgScore: 76.5,
      achievedIkuCount: 4,
      status: 'Cukup',
    ),
  ];

  List<FakultasRekapModel> get filteredList {
    if (_searchQuery.isEmpty) {
      return _fakultasList;
    }
    return _fakultasList
        .where((item) =>
            item.fakultas.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.code.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  double get overallUniversityScore {
    final double total =
        _fakultasList.fold(0.0, (sum, item) => sum + item.avgScore);
    return total / _fakultasList.length;
  }

  int get totalFacultiesAchievingTarget =>
      _fakultasList.where((item) => item.avgScore >= 80.0).length;

  void setYear(String year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
