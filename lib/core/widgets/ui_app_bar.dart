import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class UiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UiAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  static const List<String> _menuItems = [
    'Home',
    'Sub Direktorat',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarProvider>(
      builder: (context, appBar, _) {
        return AppBar(
          backgroundColor: const Color(0xFF1A1A1A),
          elevation: 0,
          toolbarHeight: 64,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo Universitas Indonesia
                Image.asset(
                  'assets/logo/logo_universitasindonesia.png',
                  height: 44,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                // Navigation menu items
                if (!appBar.searchExpanded) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_menuItems.length, (index) {
                      return _NavMenuItem(
                        label: _menuItems[index],
                        isHovered: appBar.hoveredIndex == index,
                        onHover: (hovered) {
                          appBar.setHoveredIndex(hovered ? index : null);
                        },
                        onTap: () {},
                      );
                    }),
                  ),
                ],
                // Search icon / expanded search bar
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  width: appBar.searchExpanded ? 220 : 40,
                  height: 36,
                  decoration: BoxDecoration(
                    color: appBar.searchExpanded
                        ? const Color(0xFF2E2E2E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    border: appBar.searchExpanded
                        ? Border.all(color: const Color(0xFFD4A800), width: 1)
                        : null,
                  ),
                  child: appBar.searchExpanded
                      ? Row(
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: appBar.searchController,
                                autofocus: true,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Cari...',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 13,
                                  ),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onSubmitted: (_) => appBar.collapseSearch(),
                              ),
                            ),
                            GestureDetector(
                              onTap: appBar.collapseSearch,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xFF999999),
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => appBar.setSearchHovered(true),
                          onExit: (_) => appBar.setSearchHovered(false),
                          child: GestureDetector(
                            onTap: appBar.expandSearch,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              width: 40,
                              height: 36,
                              decoration: BoxDecoration(
                                color: appBar.searchHovered
                                    ? Colors.white.withValues(alpha: 0.1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavMenuItem extends StatelessWidget {
  final String label;
  final bool isHovered;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;

  const _NavMenuItem({
    required this.label,
    required this.isHovered,
    required this.onHover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isHovered
                    ? const Color(0xFFD4A800)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isHovered ? const Color(0xFFD4A800) : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
