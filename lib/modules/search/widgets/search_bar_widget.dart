import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class SearchBarWidget extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback? onExpand;

  const SearchBarWidget({
    super.key,
    this.isCollapsed = false,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, search, _) {
        if (isCollapsed) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF999999),
                size: 20,
              ),
              tooltip: 'Cari...',
              splashRadius: 20,
              onPressed: onExpand,
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xFF333333),
              width: 1,
            ),
          ),
          child: TextField(
            controller: search.searchController,
            onChanged: search.setQuery,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: InputDecoration(
              hintText: 'Cari...',
              hintStyle: const TextStyle(
                color: Color(0xFF888888),
                fontSize: 13,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF888888),
                size: 18,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
              suffixIcon: search.query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFF888888),
                        size: 16,
                      ),
                      splashRadius: 14,
                      onPressed: search.clearSearch,
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        );
      },
    );
  }
}
