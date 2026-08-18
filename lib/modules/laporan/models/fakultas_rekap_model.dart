class FakultasRekapModel {
  final int rank;
  final String fakultas;
  final String code;
  final double avgScore;
  final int achievedIkuCount;
  final int totalIkuCount;
  final String status;

  const FakultasRekapModel({
    required this.rank,
    required this.fakultas,
    required this.code,
    required this.avgScore,
    required this.achievedIkuCount,
    this.totalIkuCount = 8,
    required this.status,
  });

  double get percentage => (avgScore / 100).clamp(0.0, 1.0);
}
