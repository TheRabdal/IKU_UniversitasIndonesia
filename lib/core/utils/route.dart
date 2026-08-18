import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppRoutes {
  static const String dashboard = '/';
  static const String indikator = '/indikator';
  static const String audit = '/audit';
  static const String setting = '/setting';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
      case indikator:
        return MaterialPageRoute(
          builder: (_) => const IndikatorPage(),
          settings: settings,
        );
      case audit:
        return MaterialPageRoute(
          builder: (_) => const AuditPage(),
          settings: settings,
        );
      case setting:
        return MaterialPageRoute(
          builder: (_) => const SettingPage(),
          settings: settings,
        );
      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
    }
  }

  static Map<String, WidgetBuilder> get routes => {
        dashboard: (_) => const DashboardPage(),
        indikator: (_) => const IndikatorPage(),
        audit: (_) => const AuditPage(),
        setting: (_) => const SettingPage(),
        profile: (_) => const ProfilePage(),
      };
}
