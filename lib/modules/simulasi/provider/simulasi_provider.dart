import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SimulasiProvider extends ChangeNotifier {
  final List<SimulasiItemModel> _simulasiList = [
    SimulasiItemModel(
      code: 'IKU 1',
      title: 'Lulusan Mendapat Pekerjaan Layak',
      weight: 15.0,
      baselineRealization: 85.2,
      target: 80.0,
      projectedRealization: 85.2,
    ),
    SimulasiItemModel(
      code: 'IKU 2',
      title: 'Mahasiswa Berkegiatan di Luar Kampus',
      weight: 15.0,
      baselineRealization: 34.8,
      target: 30.0,
      projectedRealization: 34.8,
    ),
    SimulasiItemModel(
      code: 'IKU 3',
      title: 'Dosen Berkegiatan di Luar Kampus',
      weight: 12.5,
      baselineRealization: 28.1,
      target: 25.0,
      projectedRealization: 28.1,
    ),
    SimulasiItemModel(
      code: 'IKU 4',
      title: 'Praktisi Mengajar di Kampus',
      weight: 12.5,
      baselineRealization: 18.5,
      target: 15.0,
      projectedRealization: 18.5,
    ),
    SimulasiItemModel(
      code: 'IKU 5',
      title: 'Karya Dosen Terindeks Internasional',
      weight: 15.0,
      baselineRealization: 64.2,
      target: 60.0,
      projectedRealization: 64.2,
    ),
    SimulasiItemModel(
      code: 'IKU 6',
      title: 'Kerjasama dengan Mitra Kelas Dunia',
      weight: 10.0,
      baselineRealization: 53.7,
      target: 50.0,
      projectedRealization: 53.7,
    ),
    SimulasiItemModel(
      code: 'IKU 7',
      title: 'Kelas Kolaboratif dan Partisipatif',
      weight: 10.0,
      baselineRealization: 78.4,
      target: 75.0,
      projectedRealization: 78.4,
    ),
    SimulasiItemModel(
      code: 'IKU 8',
      title: 'Prodi Terakreditasi Internasional',
      weight: 10.0,
      baselineRealization: 44.0,
      target: 40.0,
      projectedRealization: 44.0,
    ),
  ];

  List<SimulasiItemModel> get simulasiList => _simulasiList;

  double get baselineTotalScore {
    return _simulasiList.fold(
        0.0, (sum, item) => sum + item.baselineScore);
  }

  double get projectedTotalScore {
    return _simulasiList.fold(
        0.0, (sum, item) => sum + item.projectedScore);
  }

  double get deltaScore => projectedTotalScore - baselineTotalScore;

  double get estimatedIncentiveInBillion {
    return (projectedTotalScore / 100.0) * 60.0;
  }

  void updateProjected(int index, double val) {
    if (index >= 0 && index < _simulasiList.length) {
      _simulasiList[index].projectedRealization = val;
      notifyListeners();
    }
  }

  void resetAll() {
    for (var item in _simulasiList) {
      item.projectedRealization = item.baselineRealization;
    }
    notifyListeners();
  }
}
