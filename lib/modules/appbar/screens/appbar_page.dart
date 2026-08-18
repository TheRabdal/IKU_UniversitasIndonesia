import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppbarPage extends StatelessWidget implements PreferredSizeWidget {
  const AppbarPage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  static const List<NavMenuItemModel> _menuItems = [
    NavMenuItemModel(title: 'Home'),
    NavMenuItemModel(title: 'Sub Direktorat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarProvider>(
      builder: (context, appBar, _) {
        return AppBar(
          backgroundColor: const Color(0xFF1A1A1A),
          elevation: 0,
          toolbarHeight: 80,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo/logo_universitasindonesia.png',
                  height: 60,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                const AppBarSearchBar(),
                if (!appBar.searchExpanded) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_menuItems.length, (index) {
                      final item = _menuItems[index];
                      return NavMenuItem(
                        label: item.title,
                        isHovered: appBar.hoveredIndex == index,
                        onHover: (hovered) {
                          appBar.setHoveredIndex(hovered ? index : null);
                        },
                        onTap: () {},
                      );
                    }),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
