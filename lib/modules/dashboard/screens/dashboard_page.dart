import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      body: Row(
        children: [
          const SidebarPage(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarPage(),
                Expanded(
                  child: Consumer<SidebarProvider>(
                    builder: (context, sidebar, _) {
                      Widget page;
                      switch (sidebar.selectedIndex) {
                        case 1:
                          page = const IndikatorPage(key: ValueKey('indikator'));
                          break;
                        case 2:
                          page = const AuditPage(key: ValueKey('audit'));
                          break;
                        case 3:
                          page = const LaporanPage(key: ValueKey('laporan'));
                          break;
                        case 4:
                          page = const SimulasiPage(key: ValueKey('simulasi'));
                          break;
                        case 5:
                          page = const SettingPage(key: ValueKey('setting'));
                          break;
                        case 6:
                          page = const ProfilePage(key: ValueKey('profile'));
                          break;
                        default:
                          page = const DashboardContent(key: ValueKey('dashboard'));
                          break;
                      }

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 320),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          final slideAnimation = Tween<Offset>(
                            begin: const Offset(0.06, 0.0),
                            end: Offset.zero,
                          ).animate(animation);

                          final fadeAnimation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          );

                          return SlideTransition(
                            position: slideAnimation,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: page,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
