import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SidebarMenuItem extends StatelessWidget {
  final SidebarItemModel item;
  final bool isSelected;
  final bool isHovered;
  final bool isCollapsed;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;

  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isHovered,
    required this.isCollapsed,
    required this.onHover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xFFD4A800);
    final normalColor = const Color(0xFFCCCCCC);

    Widget content = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          padding: EdgeInsets.symmetric(
            horizontal: isCollapsed ? 12 : 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFD4A800).withValues(alpha: 0.15)
                : (isHovered
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(6),
            border: isSelected
                ? Border.all(
                    color: const Color(0xFFD4A800).withValues(alpha: 0.4),
                    width: 1,
                  )
                : Border.all(color: Colors.transparent, width: 1),
          ),
          child: Row(
            mainAxisAlignment: isCollapsed
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Icon(
                item.icon,
                size: 20,
                color: isSelected ? activeColor : (isHovered ? Colors.white : normalColor),
              ),
              if (!isCollapsed) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected
                          ? activeColor
                          : (isHovered ? Colors.white : normalColor),
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    if (isCollapsed) {
      return Tooltip(
        message: item.title,
        waitDuration: const Duration(milliseconds: 300),
        child: content,
      );
    }

    return content;
  }
}
