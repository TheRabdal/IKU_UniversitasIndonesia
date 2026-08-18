import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class IndikatorPage extends StatelessWidget {
  const IndikatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFFAF8F5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFEADBBE),
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x08000000),
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F5EC),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFDFC99A),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.auto_graph_rounded,
                      color: Color(0xFFB8860B),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '8 Indikator Kinerja Utama (IKU)',
                          style: TextStyle(
                            color: Color(0xFF22201C),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Standar Pengukuran Kinerja Perguruan Tinggi Kemendikbudristek & PTN-BH UI',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const IndikatorFilterBar(),
            const SizedBox(height: 20),
            Consumer<IndikatorProvider>(
              builder: (context, provider, _) {
                final list = provider.filteredIndikatorList;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final int crossAxisCount = constraints.maxWidth > 1200
                        ? 4
                        : (constraints.maxWidth > 750 ? 2 : 1);

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        mainAxisExtent: 260,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return IndikatorCard(
                          item: list[index],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
