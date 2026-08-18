import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppRoutes {
  static const String dashboard = '/';
  static const String audit = '/audit';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
      case audit:
        return MaterialPageRoute(
          builder: (_) => const AuditPage(),
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
        audit: (_) => const AuditPage(),
      };
}
