import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppbarPage extends StatelessWidget implements PreferredSizeWidget {
  const AppbarPage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Consumer<SidebarProvider>(
      builder: (context, sidebar, _) {
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEADBBE),
                width: 1.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x08000000),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (sidebar.isHidden) ...[
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Color(0xFF8C6D1F),
                    size: 22,
                  ),
                  tooltip: 'Tampilkan Sidebar',
                  splashRadius: 20,
                  onPressed: sidebar.toggleHidden,
                ),
                const SizedBox(width: 12),
              ],
              const AppBarTitle(),
            ],
          ),
        );
      },
    );
  }
}
