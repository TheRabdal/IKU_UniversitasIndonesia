import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarPage extends StatelessWidget {
  const SidebarPage({super.key});

  static const List<SidebarItemModel> _menuItems = [
    SidebarItemModel(
      title: 'Dashboard',
      icon: Icons.dashboard_rounded,
    ),
    SidebarItemModel(
      title: 'Audit',
      icon: Icons.fact_check_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appBar = context.read<AppBarProvider>();

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
                        if (index == 0) {
                          appBar.setTitle('Dashboard');
                        } else if (index == 1) {
                          appBar.setTitle('Audit Indikator Kinerja Utama');
                        }
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFF2E2E2E),
                      width: 1,
                    ),
                  ),
                ),
                child: sidebar.isCollapsed
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFF888888),
                              size: 20,
                            ),
                            tooltip: 'Expand Sidebar (v0.0.1)',
                            splashRadius: 18,
                            onPressed: sidebar.toggleCollapse,
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'v0.0.1',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          const Text(
                            'v0.0.1',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              color: Color(0xFF888888),
                              size: 20,
                            ),
                            tooltip: 'Collapse Sidebar',
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
