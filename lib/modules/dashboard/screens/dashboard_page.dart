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
                      if (sidebar.selectedIndex == 1) {
                        return const AuditPage();
                      }
                      return const DashboardContent();
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
