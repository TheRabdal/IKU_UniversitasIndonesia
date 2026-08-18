import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class IndikatorProvider extends ChangeNotifier {
  String _selectedCategory = 'Semua';

  String get selectedCategory => _selectedCategory;

  final List<String> categories = const [
    'Semua',
    'Kualitas Lulusan',
    'Kualitas Dosen',
    'Kualitas Kurikulum',
  ];

  final List<IndikatorModel> allIndikatorList = const [
    IndikatorModel(
      code: 'IKU 1',
      title: 'Lulusan Mendapat Pekerjaan yang Layak',
      category: 'Kualitas Lulusan',
      target: 80.0,
      realization: 85.2,
      unit: '% Lulusan',
      weight: 15.0,
      icon: Icons.work_outline_rounded,
    ),
    IndikatorModel(
      code: 'IKU 2',
      title: 'Mahasiswa Mendapat Pengalaman di Luar Kampus',
      category: 'Kualitas Lulusan',
      target: 30.0,
      realization: 34.8,
      unit: '% Mahasiswa',
      weight: 15.0,
      icon: Icons.school_outlined,
    ),
    IndikatorModel(
      code: 'IKU 3',
      title: 'Dosen Berkegiatan di Luar Kampus',
      category: 'Kualitas Dosen',
      target: 25.0,
      realization: 28.1,
      unit: '% Dosen',
      weight: 12.5,
      icon: Icons.person_search_outlined,
    ),
    IndikatorModel(
      code: 'IKU 4',
      title: 'Kualifikasi Dosen / Praktisi Mengajar di Kampus',
      category: 'Kualitas Dosen',
      target: 15.0,
      realization: 18.5,
      unit: '% SKS Mata Kuliah',
      weight: 12.5,
      icon: Icons.cast_for_education_rounded,
    ),
    IndikatorModel(
      code: 'IKU 5',
      title: 'Karya Dosen Digunakan Masyarakat / Rekognisi Internasional',
      category: 'Kualitas Dosen',
      target: 60.0,
      realization: 64.2,
      unit: '% Dosen Berprestasi',
      weight: 15.0,
      icon: Icons.emoji_events_outlined,
    ),
    IndikatorModel(
      code: 'IKU 6',
      title: 'Program Studi Bekerjasama dengan Mitra Kelas Dunia',
      category: 'Kualitas Kurikulum',
      target: 50.0,
      realization: 53.7,
      unit: '% Program Studi',
      weight: 10.0,
      icon: Icons.handshake_outlined,
    ),
    IndikatorModel(
      code: 'IKU 7',
      title: 'Kelas yang Kolaboratif dan Partisipatif',
      category: 'Kualitas Kurikulum',
      target: 75.0,
      realization: 78.4,
      unit: '% Mata Kuliah Case/Project',
      weight: 10.0,
      icon: Icons.groups_outlined,
    ),
    IndikatorModel(
      code: 'IKU 8',
      title: 'Program Studi Berstandar Internasional',
      category: 'Kualitas Kurikulum',
      target: 40.0,
      realization: 44.0,
      unit: '% Akreditasi Internasional',
      weight: 10.0,
      icon: Icons.public_outlined,
    ),
  ];

  List<IndikatorModel> get filteredIndikatorList {
    if (_selectedCategory == 'Semua') {
      return allIndikatorList;
    }
    return allIndikatorList
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
