import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SidebarProvider>(
      builder: (context, sidebar, _) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF2E2E2E),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: sidebar.isCollapsed
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/logo/logo_universitasindonesia.png',
                  height: sidebar.isCollapsed ? 36 : 48,
                  fit: BoxFit.contain,
                ),
              ),
              if (!sidebar.isCollapsed)
                IconButton(
                  icon: const Icon(
                    Icons.menu_open_rounded,
                    color: Color(0xFF999999),
                    size: 20,
                  ),
                  tooltip: 'Sembunyikan Sidebar',
                  splashRadius: 18,
                  onPressed: sidebar.toggleCollapse,
                ),
            ],
          ),
        );
      },
    );
  }
}
