import 'package:indikatorkinerjautama_ui/packages/packages.dart';

class DashboardIkuOverview extends StatelessWidget {
  const DashboardIkuOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IndikatorProvider>(
      builder: (context, provider, _) {
        final list = provider.allIndikatorList;

        return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFEADBBE),
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x06000000),
                blurRadius: 12,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ringkasan Capaian 8 Indikator (IKU)',
                        style: TextStyle(
                          color: Color(0xFF22201C),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Persentase realisasi aktual terhadap target kementerian',
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF8C6D1F),
                    ),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text(
                      'Lihat Detail',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      context.read<SidebarProvider>().setSelectedIndex(1);
                      context
                          .read<AppBarProvider>()
                          .setTitle('8 Indikator Kinerja Utama (IKU)');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF0ECE1), height: 1),
              const SizedBox(height: 14),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                separatorBuilder: (_, _) =>
                    const Divider(color: Color(0xFFF7F4EC), height: 16),
                itemBuilder: (context, index) {
                  final item = list[index];
                  final bool isAchieved = item.isAchieved;

                  return Row(
                    children: [
                      Container(
                        width: 48,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F5EC),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFDFC99A)),
                        ),
                        child: Center(
                          child: Text(
                            item.code,
                            style: const TextStyle(
                              color: Color(0xFF8C6D1F),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF22201C),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Target: ${item.target}% • Bobot: ${item.weight}%',
                              style: const TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${item.realization}%',
                              style: TextStyle(
                                color: isAchieved
                                    ? const Color(0xFF389E0D)
                                    : const Color(0xFFD48806),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: item.percentage,
                                minHeight: 6,
                                backgroundColor: const Color(0xFFF2ECE1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isAchieved
                                      ? const Color(0xFF52C41A)
                                      : const Color(0xFFD4A800),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
