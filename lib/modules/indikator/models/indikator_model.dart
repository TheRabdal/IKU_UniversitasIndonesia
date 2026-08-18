import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class IndikatorModel {
  final String code;
  final String title;
  final String category;
  final double target;
  final double realization;
  final String unit;
  final double weight;
  final IconData icon;

  const IndikatorModel({
    required this.code,
    required this.title,
    required this.category,
    required this.target,
    required this.realization,
    required this.unit,
    required this.weight,
    required this.icon,
  });

  double get percentage => (realization / target).clamp(0.0, 1.0);
  bool get isAchieved => realization >= target;
}
