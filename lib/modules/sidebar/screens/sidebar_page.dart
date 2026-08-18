import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarPage extends StatelessWidget {
  const SidebarPage({super.key});

  static const List<SidebarItemModel> _menuItems = [
    SidebarItemModel(
      title: 'Home',
      icon: Icons.home_rounded,
    ),
    SidebarItemModel(
      title: 'Sub Direktorat',
      icon: Icons.account_tree_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SidebarProvider>(
      builder: (context, sidebar, _) {
        if (sidebar.isHidden) {
          return const SizedBox.shrink();
        }

        final double width = sidebar.isCollapsed ? 70 : 250;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOutCubic,
          width: width,
          decoration: const BoxDecoration(
            color: Color(0xFF1A1A1A),
            border: Border(
              right: BorderSide(
                color: Color(0xFF2E2E2E),
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              const SidebarHeader(),
              SearchBarWidget(
                isCollapsed: sidebar.isCollapsed,
                onExpand: sidebar.toggleCollapse,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _menuItems.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final item = _menuItems[index];
                    return SidebarMenuItem(
                      item: item,
                      isSelected: sidebar.selectedIndex == index,
                      isHovered: sidebar.hoveredIndex == index,
                      isCollapsed: sidebar.isCollapsed,
                      onHover: (hovered) {
                        sidebar.setHoveredIndex(hovered ? index : null);
                      },
                      onTap: () {
                        sidebar.setSelectedIndex(index);
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
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
                    if (!sidebar.isCollapsed)
                      IconButton(
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFF888888),
                          size: 18,
                        ),
                        tooltip: 'Hide Sidebar',
                        splashRadius: 18,
                        onPressed: sidebar.toggleHidden,
                      ),
                    IconButton(
                      icon: Icon(
                        sidebar.isCollapsed
                            ? Icons.chevron_right_rounded
                            : Icons.chevron_left_rounded,
                        color: const Color(0xFF888888),
                        size: 20,
                      ),
                      tooltip: sidebar.isCollapsed
                          ? 'Expand Sidebar'
                          : 'Collapse Sidebar',
                      splashRadius: 18,
                      onPressed: sidebar.toggleCollapse,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
