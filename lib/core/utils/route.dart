import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/';
  static const String indikator = '/indikator';
  static const String audit = '/audit';
  static const String laporan = '/laporan';
  static const String simulasi = '/simulasi';
  static const String setting = '/setting';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case login:
        page = const LoginPage();
        break;
      case dashboard:
        page = const DashboardPage();
        break;
      case indikator:
        page = const IndikatorPage();
        break;
      case audit:
        page = const AuditPage();
        break;
      case laporan:
        page = const LaporanPage();
        break;
      case simulasi:
        page = const SimulasiPage();
        break;
      case setting:
        page = const SettingPage();
        break;
      case profile:
        page = const ProfilePage();
        break;
      default:
        page = const DashboardPage();
        break;
    }

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.08, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        final fadeAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginPage(),
        dashboard: (_) => const DashboardPage(),
        indikator: (_) => const IndikatorPage(),
        audit: (_) => const AuditPage(),
        laporan: (_) => const LaporanPage(),
        simulasi: (_) => const SimulasiPage(),
        setting: (_) => const SettingPage(),
        profile: (_) => const ProfilePage(),
      };
}
