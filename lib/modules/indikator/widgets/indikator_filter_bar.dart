import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class IndikatorFilterBar extends StatelessWidget {
  const IndikatorFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IndikatorProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: provider.categories.map((category) {
              final bool isSelected = provider.selectedCategory == category;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => provider.setCategory(category),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFB8860B)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFB8860B)
                              : const Color(0xFFDFC99A),
                          width: 1.2,
                        ),
                        boxShadow: isSelected
                            ? const [
                                BoxShadow(
                                  color: Color(0x18B8860B),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF555555),
                          fontSize: 13,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
