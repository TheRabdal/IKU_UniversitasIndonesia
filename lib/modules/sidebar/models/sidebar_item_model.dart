import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarItemModel {
  final String title;
  final IconData icon;
  final String? route;

  const SidebarItemModel({
    required this.title,
    required this.icon,
    this.route,
  });
}
