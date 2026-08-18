import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class AppBarSearchBar extends StatelessWidget {
  const AppBarSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarProvider>(
      builder: (context, appBar, _) {
        return AnimatedContainer(
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
          child: ClipRect(
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
        );
      },
    );
  }
}
