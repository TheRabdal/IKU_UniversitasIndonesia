class SimulasiItemModel {
  final String code;
  final String title;
  final double weight;
  final double baselineRealization;
  final double target;
  double projectedRealization;

  SimulasiItemModel({
    required this.code,
    required this.title,
    required this.weight,
    required this.baselineRealization,
    required this.target,
    required this.projectedRealization,
  });

  double get baselineScore =>
      (baselineRealization / target).clamp(0.0, 1.0) * weight;

  double get projectedScore =>
      (projectedRealization / target).clamp(0.0, 1.0) * weight;
}
